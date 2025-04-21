{-# LANGUAGE DataKinds #-}
{-# LANGUAGE NoImplicitPrelude #-}

module BoolLogicClique where

import Clash.Prelude
import Clash.Explicit.Testbench

-- Logic function using Bool
boolLogicClique :: (Bool, Bool, Bool, Bool, Bool) -> (Bool, Bool, Bool, Bool)
boolLogicClique (p, q, r, s, t) = (a, b, c, d)
  where
    xorResult = (p /= q) /= (r /= s)  -- chained xor for Bool
    common = t && xorResult
    a = common && p
    b = common && q
    c = common && r
    d = common && s

-- Synchronous circuit
boolLogicCliqueCircuit
  :: HiddenClockResetEnable dom
  => Signal dom (Bool, Bool, Bool, Bool, Bool)
  -> Signal dom (Bool, Bool, Bool, Bool)
boolLogicCliqueCircuit = fmap boolLogicClique

-- Top entity
topEntity
  :: Clock System
  -> Reset System
  -> Enable System
  -> Signal System (Bool, Bool, Bool, Bool, Bool)
  -> Signal System (Bool, Bool, Bool, Bool)
topEntity = exposeClockResetEnable boolLogicCliqueCircuit
{-# CLASH_OPAQUE topEntity #-}

-- Testbench
testBench :: Signal System Bool
testBench = done
  where
    testInput = stimuliGenerator clk rst $(listToVecTH
      [ (False, False, False, False, False)  -- expect (False, False, False, False)
      , (True,  True,  False, False, True)   -- expect (False, True, False, False)
      , (True,  False, True,  False, True)   -- expect (True, False, True, False)
      , (True,  True,  True,  True,  True)   -- expect (False, False, False, False)
      ])
    
    expectedOutput = outputVerifier' clk rst $(listToVecTH
      [ (False, False, False, False)
      , (False, True,  False, False)
      , (True,  False, True,  False)
      , (False, False, False, False)
      ])

    done = expectedOutput (topEntity clk rst enableGen testInput)
    clk  = tbSystemClockGen (not <$> done)
    rst  = systemResetGen