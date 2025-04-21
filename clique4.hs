{-# LANGUAGE DataKinds #-}
{-# LANGUAGE NoImplicitPrelude #-}

module BitLogicCliqueWithBuffAndCounter where

import Clash.Prelude
import Clash.Explicit.Testbench

-- Logic function
bitLogicCliqueWithBuffAndCounter :: (Bit, Bit, Bit, Bit, Bit) -> (Bit, Bit, Bit, Bit, Bit)
bitLogicCliqueWithBuffAndCounter (p, q, r, s, t) = (a, b, c, d, complexOrSimple)
  where
    xorResult = p `xor` q `xor` r `xor` s
    common = t .&. xorResult
    a = common .&. p
    b = common .&. q
    c = common .&. r
    d = common .&. s
    complexOrSimple = t .&. complement xorResult

-- State: (counter, reg1, reg2)
type FSMState = (Unsigned 2, Bit, Bit)

bitLogicCliqueWithBuffAndCounterFSM
  :: FSMState
  -> (Bit, Bit, Bit, Bit, Bit)
  -> (FSMState, (Bit, Bit, Bit, Bit, Bit, Bit))  -- last Bit = correct
bitLogicCliqueWithBuffAndCounterFSM (cnt, prev1, prev2) input@(p, q, r, s, t) = (nextState, (a, b, c, d, complexOrSimple, correct))
  where
    (a, b, c, d, complexOrSimple) = bitLogicCliqueWithBuffAndCounter input

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

bitLogicCliqueWithBuffAndCounterCircuit
  :: HiddenClockResetEnable dom
  => Signal dom (Bit, Bit, Bit, Bit, Bit)
  -> Signal dom (Bit, Bit, Bit, Bit, Bit, Bit)
bitLogicCliqueWithBuffAndCounterCircuit = mealy bitLogicCliqueWithBuffAndCounterFSM (1, low, low)

topEntity
  :: Clock System
  -> Reset System
  -> Enable System
  -> Signal System (Bit, Bit, Bit, Bit, Bit)
  -> Signal System (Bit, Bit, Bit, Bit, Bit, Bit)
topEntity = exposeClockResetEnable bitLogicCliqueWithBuffAndCounterCircuit
{-# CLASH_OPAQUE topEntity #-}

testBench :: Signal System Bool
testBench = done
  where
    testInput = stimuliGenerator clk rst $(listToVecTH
      [ (low, low, low, low, low)     -- 1
      , (high, high, low, low, high) -- 2
      , (high, low, high, low, high) -- 3 → some 1s, correct = 0
      , (low, low, low, low, low)    -- 1
      , (low, low, low, low, low)    -- 2
      , (low, low, low, low, low)    -- 3 → all 0s, correct = 1
      ])

    expectedOutput = outputVerifier' clk rst $(listToVecTH
      [ (low, low, low, low, low, low)  -- 1
      , (low, high, low, low, low, low) -- 2
      , (high, low, high, low, low, low) -- 3
      , (low, low, low, low, low, low)  -- 1
      , (low, low, low, low, low, low)  -- 2
      , (low, low, low, low, low, high) -- 3 → correct = 1
      ])

    done = expectedOutput (topEntity clk rst enableGen testInput)
    clk  = tbSystemClockGen (not <$> done)
    rst  = systemResetGen