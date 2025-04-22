{-# LANGUAGE DataKinds #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE NamedFieldPuns #-}

module BitLogicCliqueLength2 where

import Clash.Prelude
import Clash.Explicit.Testbench
import GHC.Generics (Generic)

data CliqueInput = CliqueInput
  { p     :: Bit
  , q     :: Bit
  , r     :: Bit
  , s     :: Bit
  , t     :: Bit
  , pbar  :: Bit
  , pq    :: Bit
  , qbar  :: Bit
  , qs    :: Bit
  , sbar  :: Bit
  , rs    :: Bit
  , rbar  :: Bit
  , pr    :: Bit
  } deriving (Generic, NFDataX, Show, Eq, Lift)

-- Logic function
bitLogicCliqueLength2Extended :: CliqueInput -> (Bit, Bit, Bit, Bit, Bit)
bitLogicCliqueLength2Extended ci = (a, b, c, d, complexOrSimple)
  where
    -- Extract fields from record
    CliqueInput{p, q, r, s, t, pbar, pq, qbar, qs, sbar, rs, rbar, pr} = ci
    xorResult = p `xor` q `xor` r `xor` s
    allHigh = p .&. q .&. r .&. s

    -- When t is True: use original clique logic
    cliqueA = t .&. xorResult .&. p
    cliqueB = t .&. xorResult .&. q
    cliqueC = t .&. xorResult .&. r
    cliqueD = t .&. xorResult .&. s

    -- When t is False and XOR is 0 and not allHigh
    parity3 a b c = complement (a `xor` b `xor` c) -- even parity: 0 or 2 or all 3 set
    fallbackActive = (complement t) .&. complement xorResult .&. complement allHigh

    fallbackA = ((p .&. r) .|. (p .&. s) .|. (p .&. q)) .&. parity3 pbar pq pr
    fallbackB = ((p .&. q) .|. (q .&. r)) .&. parity3 qbar pq qs
    fallbackC = ((p .&. r) .|. (q .&. r)) .&. parity3 rbar rs pr
    fallbackD = (p .&. s) .&. parity3 sbar rs qs

    -- Choose based on t
    a = if t == high then cliqueA else fallbackActive .&. fallbackA
    b = if t == high then cliqueB else fallbackActive .&. fallbackB
    c = if t == high then cliqueC else fallbackActive .&. fallbackC
    d = if t == high then cliqueD else fallbackActive .&. fallbackD

    -- complexOrSimple = (t && not xorResult) || (¬t && ¬xor && ¬allHigh)
    complexOrSimple = (t .&. complement xorResult) .|. fallbackActive

-- State: (counter, reg1, reg2)
type FSMState = (Unsigned 2, Bit, Bit)

toCliqueInput
  :: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)
  -> CliqueInput
toCliqueInput (p, q, r, s, t, pbar, pq, qbar, qs, sbar, rs, rbar, pr) =
  CliqueInput { p, q, r, s, t, pbar, pq, qbar, qs, sbar, rs, rbar, pr }

bitLogicCliqueLength2FSM
  :: FSMState
  -> (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)
  -> (FSMState, (Bit, Bit, Bit, Bit, Bit, Bit))  -- + correct bit
bitLogicCliqueLength2FSM (cnt, prev1, prev2) inp = (nextState, (a, b, c, d, complexOrSimple, correct))
  where
    ci = toCliqueInput inp
    (a, b, c, d, complexOrSimple) = bitLogicCliqueLength2Extended ci

    -- Advance counter: 1 -> 2 -> 3 -> 1
    cnt' = if cnt == 3 then 1 else cnt + 1

    -- Register shifting
    nextState = (cnt', complexOrSimple, prev1)

    -- Only check at count == 3
    correct = if cnt == 3
              then if complexOrSimple == low && prev1 == low && prev2 == low
                     then high -- All 3 are 0 → output correct = 1
                     else low  -- One or more are 1 → output correct = 0
              else low -- Not time to check yet

bitLogicCliqueLength2Circuit
  :: HiddenClockResetEnable dom
  => Signal dom (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)
  -> Signal dom (Bit, Bit, Bit, Bit, Bit, Bit)
bitLogicCliqueLength2Circuit = mealy bitLogicCliqueLength2FSM (1, low, low)

topEntity
  :: Clock System
  -> Reset System
  -> Enable System
  -> Signal System (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)
  -> Signal System (Bit, Bit, Bit, Bit, Bit, Bit)
topEntity = exposeClockResetEnable bitLogicCliqueLength2Circuit
{-# CLASH_OPAQUE topEntity #-}