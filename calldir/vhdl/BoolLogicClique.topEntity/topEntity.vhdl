-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.BoolLogicClique_topEntity_types.all;

entity topEntity is
  port(-- clock
       clk      : in BoolLogicClique_topEntity_types.clk_System;
       -- reset
       rst      : in BoolLogicClique_topEntity_types.rst_System;
       -- enable
       en       : in BoolLogicClique_topEntity_types.en_System;
       eta_0    : in boolean;
       eta_1    : in boolean;
       eta_2    : in boolean;
       eta_3    : in boolean;
       eta_4    : in boolean;
       result_0 : out boolean;
       result_1 : out boolean;
       result_2 : out boolean;
       result_3 : out boolean);
end;

architecture structural of topEntity is
  -- ../clique2.hs:11:1-15
  signal common                : boolean;
  -- ../clique2.hs:11:1-15
  signal t                     : boolean;
  -- ../clique2.hs:11:1-15
  signal \c$common_app_arg\    : boolean;
  -- ../clique2.hs:11:1-15
  signal p                     : boolean;
  -- ../clique2.hs:11:1-15
  signal \c$common_case_alt\   : boolean;
  -- ../clique2.hs:11:1-15
  signal \c$common_case_alt_0\ : boolean;
  -- ../clique2.hs:11:1-15
  signal q                     : boolean;
  -- ../clique2.hs:11:1-15
  signal \c$common_case_alt_1\ : boolean;
  -- ../clique2.hs:11:1-15
  signal \c$common_case_alt_2\ : boolean;
  -- ../clique2.hs:11:1-15
  signal r                     : boolean;
  -- ../clique2.hs:11:1-15
  signal \c$common_case_alt_3\ : boolean;
  -- ../clique2.hs:11:1-15
  signal s                     : boolean;
  signal eta                   : BoolLogicClique_topEntity_types.Tup5;
  signal result                : BoolLogicClique_topEntity_types.Tup4;

begin
  eta <= ( Tup5_sel0_boolean_0 => eta_0
         , Tup5_sel1_boolean_1 => eta_1
         , Tup5_sel2_boolean_2 => eta_2
         , Tup5_sel3_boolean_3 => eta_3
         , Tup5_sel4_boolean_4 => eta_4 );

  result <= ( Tup4_sel0_boolean_0 => common and p
            , Tup4_sel1_boolean_1 => common and q
            , Tup4_sel2_boolean_2 => common and r
            , Tup4_sel3_boolean_3 => common and s );

  common <= t and \c$common_app_arg\;

  t <= eta.Tup5_sel4_boolean_4;

  \c$common_app_arg\ <= \c$common_case_alt\ when p else
                        \c$common_case_alt_0\;

  p <= eta.Tup5_sel0_boolean_0;

  \c$common_case_alt\ <= \c$common_case_alt_2\ when q else
                         \c$common_case_alt_1\;

  \c$common_case_alt_0\ <= \c$common_case_alt_1\ when q else
                           \c$common_case_alt_2\;

  q <= eta.Tup5_sel1_boolean_1;

  \c$common_case_alt_1\ <= s when r else
                           \c$common_case_alt_3\;

  \c$common_case_alt_2\ <= \c$common_case_alt_3\ when r else
                           s;

  r <= eta.Tup5_sel2_boolean_2;

  \c$common_case_alt_3\ <= false when s else
                           true;

  s <= eta.Tup5_sel3_boolean_3;

  result_0 <= result.Tup4_sel0_boolean_0;

  result_1 <= result.Tup4_sel1_boolean_1;

  result_2 <= result.Tup4_sel2_boolean_2;

  result_3 <= result.Tup4_sel3_boolean_3;


end;

