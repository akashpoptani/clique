-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.BitVecLogicClique_testBench_types.all;
use testBench_slv2string_FD7FE0FDE5409B5E.all;

entity testBench is
  port(result : out boolean);
end;

architecture structural of testBench is
  signal \c$ds_app_arg\                          : BitVecLogicClique_testBench_types.index_4;
  signal \c$ds_app_arg_0\                        : BitVecLogicClique_testBench_types.array_of_std_logic(0 to 4);
  signal s                                       : BitVecLogicClique_testBench_types.index_4 := to_unsigned(0,2);
  -- ../clique3.hs:62:5-7
  signal \BitVecLogicClique.testBench_clk\       : BitVecLogicClique_testBench_types.clk_System;
  signal z                                       : BitVecLogicClique_testBench_types.index_7;
  signal result_1                                : BitVecLogicClique_testBench_types.index_4;
  signal \c$ds_app_arg_1\                        : BitVecLogicClique_testBench_types.array_of_std_logic(0 to 3);
  signal \c$result_rec\                          : boolean;
  signal s_0                                     : BitVecLogicClique_testBench_types.index_4 := to_unsigned(0,2);
  signal f2                                      : boolean;
  signal \f'\                                    : boolean := false;
  -- ../clique3.hs:19:1-17
  signal inputBits                               : BitVecLogicClique_testBench_types.array_of_std_logic(0 to 3);
  signal result_2                                : BitVecLogicClique_testBench_types.array_of_std_logic(0 to 3);
  -- ../clique3.hs:19:1-17
  signal \c$ds_app_arg_2\                        : std_logic;
  -- ../clique3.hs:45:1-9
  signal \c$BitVecLogicClique.testBench_app_arg\ : BitVecLogicClique_testBench_types.rst_System;
  signal \c$ds_app_arg_selection_res\            : boolean;
  signal \c$vec\                                 : BitVecLogicClique_testBench_types.array_of_array_of_5_std_logic(0 to 3);
  signal result_selection_res                    : boolean;
  signal \c$vec_0\                               : BitVecLogicClique_testBench_types.array_of_array_of_4_std_logic(0 to 3);

begin
  \c$ds_app_arg_selection_res\ <= s < to_unsigned(3,2);

  \c$ds_app_arg\ <= s + to_unsigned(1,2) when \c$ds_app_arg_selection_res\ else
                    s;

  \c$vec\ <= BitVecLogicClique_testBench_types.array_of_array_of_5_std_logic'( BitVecLogicClique_testBench_types.array_of_std_logic'( '0'
                                                                                                                                    , '0'
                                                                                                                                    , '0'
                                                                                                                                    , '0'
                                                                                                                                    , '0' )
                                                                             , BitVecLogicClique_testBench_types.array_of_std_logic'( '1'
                                                                                                                                    , '1'
                                                                                                                                    , '0'
                                                                                                                                    , '0'
                                                                                                                                    , '1' )
                                                                             , BitVecLogicClique_testBench_types.array_of_std_logic'( '1'
                                                                                                                                    , '0'
                                                                                                                                    , '1'
                                                                                                                                    , '0'
                                                                                                                                    , '1' )
                                                                             , BitVecLogicClique_testBench_types.array_of_std_logic'( '1'
                                                                                                                                    , '1'
                                                                                                                                    , '1'
                                                                                                                                    , '1'
                                                                                                                                    , '1' ) );

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
  s_register : process(\BitVecLogicClique.testBench_clk\,\c$BitVecLogicClique.testBench_app_arg\)
  begin
    if \c$BitVecLogicClique.testBench_app_arg\ =  '1'  then
      s <= to_unsigned(0,2);
    elsif rising_edge(\BitVecLogicClique.testBench_clk\) then
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
    \BitVecLogicClique.testBench_clk\ <= '0';
    wait for 10000 ps;
    while (not \c$result_rec\) loop
      \BitVecLogicClique.testBench_clk\ <= not \BitVecLogicClique.testBench_clk\;
      wait for half_periodH;
      \BitVecLogicClique.testBench_clk\ <= not \BitVecLogicClique.testBench_clk\;
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

  \c$vec_0\ <= BitVecLogicClique_testBench_types.array_of_array_of_4_std_logic'( BitVecLogicClique_testBench_types.array_of_std_logic'( '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0' )
                                                                               , BitVecLogicClique_testBench_types.array_of_std_logic'( '0'
                                                                                                                                      , '1'
                                                                                                                                      , '0'
                                                                                                                                      , '0' )
                                                                               , BitVecLogicClique_testBench_types.array_of_std_logic'( '1'
                                                                                                                                      , '0'
                                                                                                                                      , '1'
                                                                                                                                      , '0' )
                                                                               , BitVecLogicClique_testBench_types.array_of_std_logic'( '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0'
                                                                                                                                      , '0' ) );

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
  s_0_register : process(\BitVecLogicClique.testBench_clk\,\c$BitVecLogicClique.testBench_app_arg\)
  begin
    if \c$BitVecLogicClique.testBench_app_arg\ =  '1'  then
      s_0 <= to_unsigned(0,2);
    elsif rising_edge(\BitVecLogicClique.testBench_clk\) then
      s_0 <= result_1;
    end if;
  end process;
  -- register end

  -- assert begin
  r_assert : block
    -- pragma translate_off
    signal actual : BitVecLogicClique_testBench_types.array_of_std_logic(0 to 3);
    signal expected : BitVecLogicClique_testBench_types.array_of_std_logic(0 to 3);
    -- pragma translate_on
  begin
    -- pragma translate_off
    actual <= result_2;
    expected <= \c$ds_app_arg_1\;
    process(\BitVecLogicClique.testBench_clk\) is
    begin
      if (rising_edge(\BitVecLogicClique.testBench_clk\)) then
        assert (toSLV(actual) = toSLV(expected)) report (("outputVerifier") & ", expected: " & testBench_slv2string_FD7FE0FDE5409B5E.slv2string(toSLV(expected)) & ", actual: " & testBench_slv2string_FD7FE0FDE5409B5E.slv2string(toSLV(actual))) severity error;
      end if;
    end process;
    -- pragma translate_on
    f2 <= \f'\;
  end block;
  -- assert end

  -- register begin
  f_register : process(\BitVecLogicClique.testBench_clk\,\c$BitVecLogicClique.testBench_app_arg\)
  begin
    if \c$BitVecLogicClique.testBench_app_arg\ =  '1'  then
      \f'\ <= false;
    elsif rising_edge(\BitVecLogicClique.testBench_clk\) then
      \f'\ <= (s_0 = to_unsigned(3,2));
    end if;
  end process;
  -- register end

  inputBits <= \c$ds_app_arg_0\(0 to \c$ds_app_arg_0\'high - 1);

  -- map begin
  r_map : for i in result_2'range generate
  begin
    result_2(i) <= inputBits(i) and (( \c$ds_app_arg_0\(\c$ds_app_arg_0\'high) ) and \c$ds_app_arg_2\);


  end generate;
  -- map end

  fold : block
    signal vec     : BitVecLogicClique_testBench_types.array_of_std_logic(0 to 3);
    signal acc_2_0 : std_logic;
    signal acc_1   : std_logic;
    signal acc_2   : std_logic;
    signal acc_3   : std_logic;
    signal acc_4   : std_logic;
    signal acc_1_0 : std_logic;
    signal acc_1_1 : std_logic;
  begin
    \c$ds_app_arg_2\ <= acc_2_0;

    vec <= inputBits;

    acc_1 <= vec(0);

    acc_2 <= vec(1);

    acc_3 <= vec(2);

    acc_4 <= vec(3);

    acc_1_0 <= acc_1 xor acc_2;



    acc_1_1 <= acc_3 xor acc_4;



    acc_2_0 <= acc_1_0 xor acc_1_1;




  end block;

  -- resetGen begin
  resetGen : block
    constant reset_delay : time := 10000 ps - 1 ps + (integer'(1) * 10000 ps);
  begin
  -- pragma translate_off
  \c$BitVecLogicClique.testBench_app_arg\
    <= '1',
       '0' after reset_delay;
  -- pragma translate_on
  end block;
  -- resetGen end

  result <= \c$result_rec\;


end;

