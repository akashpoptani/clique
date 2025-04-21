{-# LANGUAGE DataKinds #-}
{-# LANGUAGE NoImplicitPrelude #-}

module BitLogicClique where

import Clash.Prelude
import Clash.Explicit.Testbench

-- Logic function
bitLogicClique :: (Bit, Bit, Bit, Bit, Bit) -> (Bit, Bit, Bit, Bit)
bitLogicClique (p, q, r, s, t) = (a, b, c, d)
  where
    xorResult = p `xor` q `xor` r `xor` s
    common = t .&. xorResult
    a = common .&. p
    b = common .&. q
    c = common .&. r
    d = common .&. s

-- Synchronous circuit
bitLogicCliqueCircuit
  :: HiddenClockResetEnable dom
  => Signal dom (Bit, Bit, Bit, Bit, Bit)
  -> Signal dom (Bit, Bit, Bit, Bit)
bitLogicCliqueCircuit = fmap bitLogicClique

-- Top Entity
topEntity
  :: Clock System
  -> Reset System
  -> Enable System
  -> Signal System (Bit, Bit, Bit, Bit, Bit)
  -> Signal System (Bit, Bit, Bit, Bit)
topEntity = exposeClockResetEnable bitLogicCliqueCircuit
{-# CLASH_OPAQUE topEntity #-}

-- Testbench
testBench :: Signal System Bool
testBench = done
  where
    testInput = stimuliGenerator clk rst $(listToVecTH
      [ (low, low, low, low, low)   -- expect (low, low, low, low)
      , (high, high, low, low, high) -- expect (low, high, low, low)
      , (high, low, high, low, high) -- expect (high, low, high, low)
      , (high, high, high, high, high) -- expect (low, low, low, low)
      ])
    
    expectedOutput = outputVerifier' clk rst $(listToVecTH
      [ (low, low, low, low)
      , (low, high, low, low)
      , (high, low, high, low)
      , (low, low, low, low)
      ])

    done = expectedOutput (topEntity clk rst enableGen testInput)
    clk  = tbSystemClockGen (not <$> done)
    rst  = systemResetGen