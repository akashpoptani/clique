-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.BoolLogicClique_testBench_types.all;
use testBench_slv2string_FD7FE0FDE5409B5E.all;

entity testBench is
  port(result : out boolean);
end;

architecture structural of testBench is
  signal \c$ds_app_arg\                        : BoolLogicClique_testBench_types.index_4;
  signal \c$ds_app_arg_0\                      : BoolLogicClique_testBench_types.Tup5;
  signal s                                     : BoolLogicClique_testBench_types.index_4 := to_unsigned(0,2);
  -- ../clique2.hs:56:5-7
  signal \BoolLogicClique.testBench_clk\       : BoolLogicClique_testBench_types.clk_System;
  signal z                                     : BoolLogicClique_testBench_types.index_7;
  signal result_1                              : BoolLogicClique_testBench_types.index_4;
  signal \c$ds_app_arg_1\                      : BoolLogicClique_testBench_types.Tup4;
  signal \c$result_rec\                        : boolean;
  signal s_0                                   : BoolLogicClique_testBench_types.index_4 := to_unsigned(0,2);
  signal f2                                    : boolean;
  signal \f'\                                  : boolean := false;
  signal result_2                              : BoolLogicClique_testBench_types.Tup4;
  -- ../clique2.hs:11:1-15
  signal common                                : boolean;
  -- ../clique2.hs:11:1-15
  signal t                                     : boolean;
  -- ../clique2.hs:11:1-15
  signal \c$common_app_arg\                    : boolean;
  -- ../clique2.hs:11:1-15
  signal p                                     : boolean;
  -- ../clique2.hs:11:1-15
  signal \c$common_case_alt\                   : boolean;
  -- ../clique2.hs:11:1-15
  signal \c$common_case_alt_0\                 : boolean;
  -- ../clique2.hs:11:1-15
  signal q                                     : boolean;
  -- ../clique2.hs:11:1-15
  signal \c$common_case_alt_1\                 : boolean;
  -- ../clique2.hs:11:1-15
  signal \c$common_case_alt_2\                 : boolean;
  -- ../clique2.hs:11:1-15
  signal r                                     : boolean;
  -- ../clique2.hs:11:1-15
  signal \c$common_case_alt_3\                 : boolean;
  -- ../clique2.hs:11:1-15
  signal s_1                                   : boolean;
  -- ../clique2.hs:39:1-9
  signal \c$BoolLogicClique.testBench_app_arg\ : BoolLogicClique_testBench_types.rst_System;
  signal \c$ds_app_arg_selection_res\          : boolean;
  signal \c$vec\                               : BoolLogicClique_testBench_types.array_of_Tup5(0 to 3);
  signal result_selection_res                  : boolean;
  signal \c$vec_0\                             : BoolLogicClique_testBench_types.array_of_Tup4(0 to 3);

begin
  \c$ds_app_arg_selection_res\ <= s < to_unsigned(3,2);

  \c$ds_app_arg\ <= s + to_unsigned(1,2) when \c$ds_app_arg_selection_res\ else
                    s;

  \c$vec\ <= BoolLogicClique_testBench_types.array_of_Tup5'( ( Tup5_sel0_boolean_0 => false
                                                           , Tup5_sel1_boolean_1 => false
                                                           , Tup5_sel2_boolean_2 => false
                                                           , Tup5_sel3_boolean_3 => false
                                                           , Tup5_sel4_boolean_4 => false )
                                                           , ( Tup5_sel0_boolean_0 => true
                                                           , Tup5_sel1_boolean_1 => true
                                                           , Tup5_sel2_boolean_2 => false
                                                           , Tup5_sel3_boolean_3 => false
                                                           , Tup5_sel4_boolean_4 => true )
                                                           , ( Tup5_sel0_boolean_0 => true
                                                           , Tup5_sel1_boolean_1 => false
                                                           , Tup5_sel2_boolean_2 => true
                                                           , Tup5_sel3_boolean_3 => false
                                                           , Tup5_sel4_boolean_4 => true )
                                                           , ( Tup5_sel0_boolean_0 => true
                                                           , Tup5_sel1_boolean_1 => true
                                                           , Tup5_sel2_boolean_2 => true
                                                           , Tup5_sel3_boolean_3 => true
                                                           , Tup5_sel4_boolean_4 => true ) );

  -- index begin
  indexVec : block
    signal vec_index : integer range 0 to 4-1;
  begin
    vec_index <= to_integer((signed(std_logic_vector(resize(s,64)))))
    -- pragma translate_off
                 mod 4
    -- pragma translate_on
                 ;
    \c$ds_app_arg_0\ <= \c$vec\(vec_index);
  end block;
  -- index end

  -- register begin
  s_register : process(\BoolLogicClique.testBench_clk\,\c$BoolLogicClique.testBench_app_arg\)
  begin
    if \c$BoolLogicClique.testBench_app_arg\ =  '1'  then
      s <= to_unsigned(0,2);
    elsif rising_edge(\BoolLogicClique.testBench_clk\) then
      s <= \c$ds_app_arg\;
    end if;
  end process;
  -- register end

  -- tbClockGen begin
  -- pragma translate_off
  clkGen : process is
    constant half_periodH : time := 10000000 fs / 2;
    constant half_periodL : time := 10000000 fs - half_periodH;
  begin
    \BoolLogicClique.testBench_clk\ <= '0';
    wait for 10000 ps;
    while (not \c$result_rec\) loop
      \BoolLogicClique.testBench_clk\ <= not \BoolLogicClique.testBench_clk\;
      wait for half_periodH;
      \BoolLogicClique.testBench_clk\ <= not \BoolLogicClique.testBench_clk\;
      wait for half_periodL;
    end loop;
    wait;
  end process;
  -- pragma translate_on
  -- tbClockGen end

  z <= resize(s_0,3) + resize(to_unsigned(1,2),3);

  result_selection_res <= z > to_unsigned(3,3);

  result_1 <= to_unsigned(3,2) when result_selection_res else
              resize(z,2);

  \c$vec_0\ <= BoolLogicClique_testBench_types.array_of_Tup4'( ( Tup4_sel0_boolean_0 => false
                                                             , Tup4_sel1_boolean_1 => false
                                                             , Tup4_sel2_boolean_2 => false
                                                             , Tup4_sel3_boolean_3 => false )
                                                             , ( Tup4_sel0_boolean_0 => false
                                                             , Tup4_sel1_boolean_1 => true
                                                             , Tup4_sel2_boolean_2 => false
                                                             , Tup4_sel3_boolean_3 => false )
                                                             , ( Tup4_sel0_boolean_0 => true
                                                             , Tup4_sel1_boolean_1 => false
                                                             , Tup4_sel2_boolean_2 => true
                                                             , Tup4_sel3_boolean_3 => false )
                                                             , ( Tup4_sel0_boolean_0 => false
                                                             , Tup4_sel1_boolean_1 => false
                                                             , Tup4_sel2_boolean_2 => false
                                                             , Tup4_sel3_boolean_3 => false ) );

  -- index begin
  indexVec_0 : block
    signal vec_index_0 : integer range 0 to 4-1;
  begin
    vec_index_0 <= to_integer((signed(std_logic_vector(resize(s_0,64)))))
    -- pragma translate_off
                 mod 4
    -- pragma translate_on
                 ;
    \c$ds_app_arg_1\ <= \c$vec_0\(vec_index_0);
  end block;
  -- index end

  \c$result_rec\ <= \f'\ when \f'\ else
                    f2;

  -- register begin
  s_0_register : process(\BoolLogicClique.testBench_clk\,\c$BoolLogicClique.testBench_app_arg\)
  begin
    if \c$BoolLogicClique.testBench_app_arg\ =  '1'  then
      s_0 <= to_unsigned(0,2);
    elsif rising_edge(\BoolLogicClique.testBench_clk\) then
      s_0 <= result_1;
    end if;
  end process;
  -- register end

  -- assert begin
  r_assert : block
    -- pragma translate_off
    signal actual : BoolLogicClique_testBench_types.Tup4;
    signal expected : BoolLogicClique_testBench_types.Tup4;
    -- pragma translate_on
  begin
    -- pragma translate_off
    actual <= result_2;
    expected <= \c$ds_app_arg_1\;
    process(\BoolLogicClique.testBench_clk\) is
    begin
      if (rising_edge(\BoolLogicClique.testBench_clk\)) then
        assert (toSLV(actual) = toSLV(expected)) report (("outputVerifier") & ", expected: " & testBench_slv2string_FD7FE0FDE5409B5E.slv2string(toSLV(expected)) & ", actual: " & testBench_slv2string_FD7FE0FDE5409B5E.slv2string(toSLV(actual))) severity error;
      end if;
    end process;
    -- pragma translate_on
    f2 <= \f'\;
  end block;
  -- assert end

  -- register begin
  f_register : process(\BoolLogicClique.testBench_clk\,\c$BoolLogicClique.testBench_app_arg\)
  begin
    if \c$BoolLogicClique.testBench_app_arg\ =  '1'  then
      \f'\ <= false;
    elsif rising_edge(\BoolLogicClique.testBench_clk\) then
      \f'\ <= (s_0 = to_unsigned(3,2));
    end if;
  end process;
  -- register end

  result_2 <= ( Tup4_sel0_boolean_0 => common and p
              , Tup4_sel1_boolean_1 => common and q
              , Tup4_sel2_boolean_2 => common and r
              , Tup4_sel3_boolean_3 => common and s_1 );

  common <= t and \c$common_app_arg\;

  t <= \c$ds_app_arg_0\.Tup5_sel4_boolean_4;

  \c$common_app_arg\ <= \c$common_case_alt\ when p else
                        \c$common_case_alt_0\;

  p <= \c$ds_app_arg_0\.Tup5_sel0_boolean_0;

  \c$common_case_alt\ <= \c$common_case_alt_2\ when q else
                         \c$common_case_alt_1\;

  \c$common_case_alt_0\ <= \c$common_case_alt_1\ when q else
                           \c$common_case_alt_2\;

  q <= \c$ds_app_arg_0\.Tup5_sel1_boolean_1;

  \c$common_case_alt_1\ <= s_1 when r else
                           \c$common_case_alt_3\;

  \c$common_case_alt_2\ <= \c$common_case_alt_3\ when r else
                           s_1;

  r <= \c$ds_app_arg_0\.Tup5_sel2_boolean_2;

  \c$common_case_alt_3\ <= false when s_1 else
                           true;

  s_1 <= \c$ds_app_arg_0\.Tup5_sel3_boolean_3;

  -- resetGen begin
  resetGen : block
    constant reset_delay : time := 10000 ps - 1 ps + (integer'(1) * 10000 ps);
  begin
  -- pragma translate_off
  \c$BoolLogicClique.testBench_app_arg\
    <= '1',
       '0' after reset_delay;
  -- pragma translate_on
  end block;
  -- resetGen end

  result <= \c$result_rec\;


end;

