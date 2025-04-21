{-# LANGUAGE DataKinds #-}
{-# LANGUAGE NoImplicitPrelude #-}

module BitVecLogicClique where

import Clash.Prelude
import Clash.Explicit.Testbench

-- Type aliases for readability
type CliqueInput  = Vec 5 Bit
type CliqueOutput = Vec 4 Bit

-- XOR of multiple Bits using fold
xorN :: Vec (n + 1) Bit -> Bit
xorN = fold xor

-- Core logic function
bitVecLogicClique :: CliqueInput -> CliqueOutput
bitVecLogicClique inputs = map (.&. common) inputBits
  where
    inputBits = init inputs               -- p, q, r, s
    t         = last inputs               -- t
    xorResult = xorN inputBits
    common    = t .&. xorResult

-- Synchronous circuit version
bitVecLogicCliqueCircuit
  :: HiddenClockResetEnable dom
  => Signal dom CliqueInput
  -> Signal dom CliqueOutput
bitVecLogicCliqueCircuit = fmap bitVecLogicClique

-- Top Entity
topEntity
  :: Clock System
  -> Reset System
  -> Enable System
  -> Signal System CliqueInput
  -> Signal System CliqueOutput
topEntity = exposeClockResetEnable bitVecLogicCliqueCircuit
{-# CLASH_OPAQUE topEntity #-}

-- Testbench
testBench :: Signal System Bool
testBench = done
  where
    testInput = stimuliGenerator clk rst $(listToVecTH
      [ (low :> low  :> low  :> low  :> low  :> Nil)   -- expect all low
      , (high:> high :> low  :> low  :> high :> Nil)   -- expect low, high, low, low
      , (high:> low  :> high :> low  :> high :> Nil)   -- expect high, low, high, low
      , (high:> high :> high :> high :> high :> Nil)   -- expect all low
      ])
    
    expectedOutput = outputVerifier' clk rst $(listToVecTH
      [ (low :> low  :> low  :> low  :> Nil)
      , (low :> high :> low  :> low  :> Nil)
      , (high:> low  :> high :> low  :> Nil)
      , (low :> low  :> low  :> low  :> Nil)
      ])

    done = expectedOutput (topEntity clk rst enableGen testInput)
    clk  = tbSystemClockGen (not <$> done)
    rst  = systemResetGen