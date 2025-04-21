library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package BitVecLogicClique_testBench_types is

  subtype rst_System is std_logic;
  subtype index_4 is unsigned(1 downto 0);
  subtype index_7 is unsigned(2 downto 0);

  type array_of_std_logic is array (integer range <>) of std_logic;
  type array_of_array_of_5_std_logic is array (integer range <>) of array_of_std_logic(0 to 4);
  subtype clk_System is std_logic;
  type array_of_array_of_4_std_logic is array (integer range <>) of array_of_std_logic(0 to 3);
  function toSLV (b : in boolean) return std_logic_vector;
  function fromSLV (sl : in std_logic_vector) return boolean;
  function tagToEnum (s : in signed) return boolean;
  function dataToTag (b : in boolean) return signed;
  function toSLV (sl : in std_logic) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return std_logic;
  function toSLV (u : in unsigned) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return unsigned;
  function toSLV (value :  array_of_std_logic) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return array_of_std_logic;
  function toSLV (value :  array_of_array_of_5_std_logic) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return array_of_array_of_5_std_logic;
  function toSLV (value :  array_of_array_of_4_std_logic) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return array_of_array_of_4_std_logic;
end;

package body BitVecLogicClique_testBench_types is
  function toSLV (b : in boolean) return std_logic_vector is
  begin
    if b then
      return "1";
    else
      return "0";
    end if;
  end;
  function fromSLV (sl : in std_logic_vector) return boolean is
  begin
    if sl = "1" then
      return true;
    else
      return false;
    end if;
  end;
  function tagToEnum (s : in signed) return boolean is
  begin
    if s = to_signed(0,64) then
      return false;
    else
      return true;
    end if;
  end;
  function dataToTag (b : in boolean) return signed is
  begin
    if b then
      return to_signed(1,64);
    else
      return to_signed(0,64);
    end if;
  end;
  function toSLV (sl : in std_logic) return std_logic_vector is
  begin
    return std_logic_vector'(0 => sl);
  end;
  function fromSLV (slv : in std_logic_vector) return std_logic is
    alias islv : std_logic_vector (0 to slv'length - 1) is slv;
  begin
    return islv(0);
  end;
  function toSLV (u : in unsigned) return std_logic_vector is
  begin
    return std_logic_vector(u);
  end;
  function fromSLV (slv : in std_logic_vector) return unsigned is
    alias islv : std_logic_vector(0 to slv'length - 1) is slv;
  begin
    return unsigned(islv);
  end;
  function toSLV (value :  array_of_std_logic) return std_logic_vector is
    alias ivalue    : array_of_std_logic(1 to value'length) is value;
    variable result : std_logic_vector(1 to value'length * 1);
  begin
    for i in ivalue'range loop
      result(((i - 1) * 1) + 1 to i*1) := toSLV(ivalue(i));
    end loop;
    return result;
  end;
  function fromSLV (slv : in std_logic_vector) return array_of_std_logic is
    alias islv      : std_logic_vector(0 to slv'length - 1) is slv;
    variable result : array_of_std_logic(0 to slv'length / 1 - 1);
  begin
    for i in result'range loop
      result(i) := fromSLV(islv(i * 1 to (i+1) * 1 - 1));
    end loop;
    return result;
  end;
  function toSLV (value :  array_of_array_of_5_std_logic) return std_logic_vector is
    alias ivalue    : array_of_array_of_5_std_logic(1 to value'length) is value;
    variable result : std_logic_vector(1 to value'length * 5);
  begin
    for i in ivalue'range loop
      result(((i - 1) * 5) + 1 to i*5) := toSLV(ivalue(i));
    end loop;
    return result;
  end;
  function fromSLV (slv : in std_logic_vector) return array_of_array_of_5_std_logic is
    alias islv      : std_logic_vector(0 to slv'length - 1) is slv;
    variable result : array_of_array_of_5_std_logic(0 to slv'length / 5 - 1);
  begin
    for i in result'range loop
      result(i) := fromSLV(islv(i * 5 to (i+1) * 5 - 1));
    end loop;
    return result;
  end;
  function toSLV (value :  array_of_array_of_4_std_logic) return std_logic_vector is
    alias ivalue    : array_of_array_of_4_std_logic(1 to value'length) is value;
    variable result : std_logic_vector(1 to value'length * 4);
  begin
    for i in ivalue'range loop
      result(((i - 1) * 4) + 1 to i*4) := toSLV(ivalue(i));
    end loop;
    return result;
  end;
  function fromSLV (slv : in std_logic_vector) return array_of_array_of_4_std_logic is
    alias islv      : std_logic_vector(0 to slv'length - 1) is slv;
    variable result : array_of_array_of_4_std_logic(0 to slv'length / 4 - 1);
  begin
    for i in result'range loop
      result(i) := fromSLV(islv(i * 4 to (i+1) * 4 - 1));
    end loop;
    return result;
  end;
end;

