-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.BitVecLogicClique_topEntity_types.all;

entity topEntity is
  port(-- clock
       clk      : in BitVecLogicClique_topEntity_types.clk_System;
       -- reset
       rst      : in BitVecLogicClique_topEntity_types.rst_System;
       -- enable
       en       : in BitVecLogicClique_topEntity_types.en_System;
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
  -- ../clique3.hs:19:1-17
  signal inputBits      : BitVecLogicClique_topEntity_types.array_of_std_logic(0 to 3);
  -- ../clique3.hs:19:1-17
  signal \c$ds_app_arg\ : std_logic;
  signal eta            : BitVecLogicClique_topEntity_types.array_of_std_logic(0 to 4);
  signal result         : BitVecLogicClique_topEntity_types.array_of_std_logic(0 to 3);

begin
  eta <= BitVecLogicClique_topEntity_types.array_of_std_logic'( eta_0
                                                              , eta_1
                                                              , eta_2
                                                              , eta_3
                                                              , eta_4 );

  inputBits <= eta(0 to eta'high - 1);

  -- map begin
  r_map : for i in result'range generate
  begin
    result(i) <= inputBits(i) and (( eta(eta'high) ) and \c$ds_app_arg\);


  end generate;
  -- map end

  fold : block
    signal vec     : BitVecLogicClique_topEntity_types.array_of_std_logic(0 to 3);
    signal acc_2_0 : std_logic;
    signal acc_1   : std_logic;
    signal acc_2   : std_logic;
    signal acc_3   : std_logic;
    signal acc_4   : std_logic;
    signal acc_1_0 : std_logic;
    signal acc_1_1 : std_logic;
  begin
    \c$ds_app_arg\ <= acc_2_0;

    vec <= inputBits;

    acc_1 <= vec(0);

    acc_2 <= vec(1);

    acc_3 <= vec(2);

    acc_4 <= vec(3);

    acc_1_0 <= acc_1 xor acc_2;



    acc_1_1 <= acc_3 xor acc_4;



    acc_2_0 <= acc_1_0 xor acc_1_1;




  end block;

  result_0 <= result(0);

  result_1 <= result(1);

  result_2 <= result(2);

  result_3 <= result(3);


end;

