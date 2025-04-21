-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.BitLogicClique_testBench_types.all;
use testBench_slv2string_FD7FE0FDE5409B5E.all;

entity testBench is
  port(result : out boolean);
end;

architecture structural of testBench is
  signal \c$ds_app_arg\                       : BitLogicClique_testBench_types.index_4;
  signal \c$ds_app_arg_0\                     : BitLogicClique_testBench_types.Tup5;
  signal s                                    : BitLogicClique_testBench_types.index_4 := to_unsigned(0,2);
  -- ../clique1.hs:56:5-7
  signal \BitLogicClique.testBench_clk\       : BitLogicClique_testBench_types.clk_System;
  signal z                                    : BitLogicClique_testBench_types.index_7;
  signal result_1                             : BitLogicClique_testBench_types.index_4;
  signal \c$ds_app_arg_1\                     : BitLogicClique_testBench_types.Tup4;
  signal \c$result_rec\                       : boolean;
  signal s_0                                  : BitLogicClique_testBench_types.index_4 := to_unsigned(0,2);
  signal f2                                   : boolean;
  signal \f'\                                 : boolean := false;
  -- ../clique1.hs:11:1-14
  signal p                                    : std_logic;
  -- ../clique1.hs:11:1-14
  signal q                                    : std_logic;
  -- ../clique1.hs:11:1-14
  signal r                                    : std_logic;
  -- ../clique1.hs:11:1-14
  signal s_1                                  : std_logic;
  -- ../clique1.hs:11:1-14
  signal t                                    : std_logic;
  -- ../clique1.hs:11:1-14
  signal common                               : std_logic;
  signal result_2                             : BitLogicClique_testBench_types.Tup4;
  -- ../clique1.hs:39:1-9
  signal \c$BitLogicClique.testBench_app_arg\ : BitLogicClique_testBench_types.rst_System;
  signal \c$ds_app_arg_selection_res\         : boolean;
  signal \c$vec\                              : BitLogicClique_testBench_types.array_of_Tup5(0 to 3);
  signal result_selection_res                 : boolean;
  signal \c$vec_0\                            : BitLogicClique_testBench_types.array_of_Tup4(0 to 3);

begin
  \c$ds_app_arg_selection_res\ <= s < to_unsigned(3,2);

  \c$ds_app_arg\ <= s + to_unsigned(1,2) when \c$ds_app_arg_selection_res\ else
                    s;

  \c$vec\ <= BitLogicClique_testBench_types.array_of_Tup5'( ( Tup5_sel0_std_logic_0 => '0'
                                                          , Tup5_sel1_std_logic_1 => '0'
                                                          , Tup5_sel2_std_logic_2 => '0'
                                                          , Tup5_sel3_std_logic_3 => '0'
                                                          , Tup5_sel4_std_logic_4 => '0' )
                                                          , ( Tup5_sel0_std_logic_0 => '1'
                                                          , Tup5_sel1_std_logic_1 => '1'
                                                          , Tup5_sel2_std_logic_2 => '0'
                                                          , Tup5_sel3_std_logic_3 => '0'
                                                          , Tup5_sel4_std_logic_4 => '1' )
                                                          , ( Tup5_sel0_std_logic_0 => '1'
                                                          , Tup5_sel1_std_logic_1 => '0'
                                                          , Tup5_sel2_std_logic_2 => '1'
                                                          , Tup5_sel3_std_logic_3 => '0'
                                                          , Tup5_sel4_std_logic_4 => '1' )
                                                          , ( Tup5_sel0_std_logic_0 => '1'
                                                          , Tup5_sel1_std_logic_1 => '1'
                                                          , Tup5_sel2_std_logic_2 => '1'
                                                          , Tup5_sel3_std_logic_3 => '1'
                                                          , Tup5_sel4_std_logic_4 => '1' ) );

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
  s_register : process(\BitLogicClique.testBench_clk\,\c$BitLogicClique.testBench_app_arg\)
  begin
    if \c$BitLogicClique.testBench_app_arg\ =  '1'  then
      s <= to_unsigned(0,2);
    elsif rising_edge(\BitLogicClique.testBench_clk\) then
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
    \BitLogicClique.testBench_clk\ <= '0';
    wait for 10000 ps;
    while (not \c$result_rec\) loop
      \BitLogicClique.testBench_clk\ <= not \BitLogicClique.testBench_clk\;
      wait for half_periodH;
      \BitLogicClique.testBench_clk\ <= not \BitLogicClique.testBench_clk\;
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

  \c$vec_0\ <= BitLogicClique_testBench_types.array_of_Tup4'( ( Tup4_sel0_std_logic_0 => '0'
                                                            , Tup4_sel1_std_logic_1 => '0'
                                                            , Tup4_sel2_std_logic_2 => '0'
                                                            , Tup4_sel3_std_logic_3 => '0' )
                                                            , ( Tup4_sel0_std_logic_0 => '0'
                                                            , Tup4_sel1_std_logic_1 => '1'
                                                            , Tup4_sel2_std_logic_2 => '0'
                                                            , Tup4_sel3_std_logic_3 => '0' )
                                                            , ( Tup4_sel0_std_logic_0 => '1'
                                                            , Tup4_sel1_std_logic_1 => '0'
                                                            , Tup4_sel2_std_logic_2 => '1'
                                                            , Tup4_sel3_std_logic_3 => '0' )
                                                            , ( Tup4_sel0_std_logic_0 => '0'
                                                            , Tup4_sel1_std_logic_1 => '0'
                                                            , Tup4_sel2_std_logic_2 => '0'
                                                            , Tup4_sel3_std_logic_3 => '0' ) );

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
  s_0_register : process(\BitLogicClique.testBench_clk\,\c$BitLogicClique.testBench_app_arg\)
  begin
    if \c$BitLogicClique.testBench_app_arg\ =  '1'  then
      s_0 <= to_unsigned(0,2);
    elsif rising_edge(\BitLogicClique.testBench_clk\) then
      s_0 <= result_1;
    end if;
  end process;
  -- register end

  -- assert begin
  r_assert : block
    -- pragma translate_off
    signal actual : BitLogicClique_testBench_types.Tup4;
    signal expected : BitLogicClique_testBench_types.Tup4;
    -- pragma translate_on
  begin
    -- pragma translate_off
    actual <= result_2;
    expected <= \c$ds_app_arg_1\;
    process(\BitLogicClique.testBench_clk\) is
    begin
      if (rising_edge(\BitLogicClique.testBench_clk\)) then
        assert (toSLV(actual) = toSLV(expected)) report (("outputVerifier") & ", expected: " & testBench_slv2string_FD7FE0FDE5409B5E.slv2string(toSLV(expected)) & ", actual: " & testBench_slv2string_FD7FE0FDE5409B5E.slv2string(toSLV(actual))) severity error;
      end if;
    end process;
    -- pragma translate_on
    f2 <= \f'\;
  end block;
  -- assert end

  -- register begin
  f_register : process(\BitLogicClique.testBench_clk\,\c$BitLogicClique.testBench_app_arg\)
  begin
    if \c$BitLogicClique.testBench_app_arg\ =  '1'  then
      \f'\ <= false;
    elsif rising_edge(\BitLogicClique.testBench_clk\) then
      \f'\ <= (s_0 = to_unsigned(3,2));
    end if;
  end process;
  -- register end

  p <= \c$ds_app_arg_0\.Tup5_sel0_std_logic_0;

  q <= \c$ds_app_arg_0\.Tup5_sel1_std_logic_1;

  r <= \c$ds_app_arg_0\.Tup5_sel2_std_logic_2;

  s_1 <= \c$ds_app_arg_0\.Tup5_sel3_std_logic_3;

  t <= \c$ds_app_arg_0\.Tup5_sel4_std_logic_4;

  common <= t and (((p xor q) xor r) xor s_1);

  result_2 <= ( Tup4_sel0_std_logic_0 => common and p
              , Tup4_sel1_std_logic_1 => common and q
              , Tup4_sel2_std_logic_2 => common and r
              , Tup4_sel3_std_logic_3 => common and s_1 );

  -- resetGen begin
  resetGen : block
    constant reset_delay : time := 10000 ps - 1 ps + (integer'(1) * 10000 ps);
  begin
  -- pragma translate_off
  \c$BitLogicClique.testBench_app_arg\
    <= '1',
       '0' after reset_delay;
  -- pragma translate_on
  end block;
  -- resetGen end

  result <= \c$result_rec\;


end;

