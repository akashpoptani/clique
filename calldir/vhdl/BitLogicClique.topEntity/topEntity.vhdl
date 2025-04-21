-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.BitLogicClique_topEntity_types.all;

entity topEntity is
  port(-- clock
       clk      : in BitLogicClique_topEntity_types.clk_System;
       -- reset
       rst      : in BitLogicClique_topEntity_types.rst_System;
       -- enable
       en       : in BitLogicClique_topEntity_types.en_System;
       eta_0    : in std_logic;
       eta_1    : in std_logic;
       eta_2    : in std_logic;
       eta_3    : in std_logic;
       eta_4    : in std_logic;
       result_0 : out std_logic;
       result_1 : out std_logic;
       result_2 : out std_logic;
       result_3 : out std_logic);
end;

architecture structural of topEntity is
  -- ../clique1.hs:11:1-14
  signal p      : std_logic;
  -- ../clique1.hs:11:1-14
  signal q      : std_logic;
  -- ../clique1.hs:11:1-14
  signal r      : std_logic;
  -- ../clique1.hs:11:1-14
  signal s      : std_logic;
  -- ../clique1.hs:11:1-14
  signal t      : std_logic;
  -- ../clique1.hs:11:1-14
  signal common : std_logic;
  signal eta    : BitLogicClique_topEntity_types.Tup5;
  signal result : BitLogicClique_topEntity_types.Tup4;

begin
  eta <= ( Tup5_sel0_std_logic_0 => eta_0
         , Tup5_sel1_std_logic_1 => eta_1
         , Tup5_sel2_std_logic_2 => eta_2
         , Tup5_sel3_std_logic_3 => eta_3
         , Tup5_sel4_std_logic_4 => eta_4 );

  p <= eta.Tup5_sel0_std_logic_0;

  q <= eta.Tup5_sel1_std_logic_1;

  r <= eta.Tup5_sel2_std_logic_2;

  s <= eta.Tup5_sel3_std_logic_3;

  t <= eta.Tup5_sel4_std_logic_4;

  common <= t and (((p xor q) xor r) xor s);

  result <= ( Tup4_sel0_std_logic_0 => common and p
            , Tup4_sel1_std_logic_1 => common and q
            , Tup4_sel2_std_logic_2 => common and r
            , Tup4_sel3_std_logic_3 => common and s );

  result_0 <= result.Tup4_sel0_std_logic_0;

  result_1 <= result.Tup4_sel1_std_logic_1;

  result_2 <= result.Tup4_sel2_std_logic_2;

  result_3 <= result.Tup4_sel3_std_logic_3;


end;

