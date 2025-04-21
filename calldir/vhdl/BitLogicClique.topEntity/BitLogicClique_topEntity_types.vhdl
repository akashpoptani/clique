library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package BitLogicClique_topEntity_types is
  subtype rst_System is std_logic;

  subtype en_System is boolean;
  subtype clk_System is std_logic;
  type Tup5 is record
    Tup5_sel0_std_logic_0 : std_logic;
    Tup5_sel1_std_logic_1 : std_logic;
    Tup5_sel2_std_logic_2 : std_logic;
    Tup5_sel3_std_logic_3 : std_logic;
    Tup5_sel4_std_logic_4 : std_logic;
  end record;
  type Tup4 is record
    Tup4_sel0_std_logic_0 : std_logic;
    Tup4_sel1_std_logic_1 : std_logic;
    Tup4_sel2_std_logic_2 : std_logic;
    Tup4_sel3_std_logic_3 : std_logic;
  end record;
  function toSLV (sl : in std_logic) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return std_logic;
  function toSLV (b : in boolean) return std_logic_vector;
  function fromSLV (sl : in std_logic_vector) return boolean;
  function tagToEnum (s : in signed) return boolean;
  function dataToTag (b : in boolean) return signed;
  function toSLV (p : Tup5) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return Tup5;
  function toSLV (p : Tup4) return std_logic_vector;
  function fromSLV (slv : in std_logic_vector) return Tup4;
end;

package body BitLogicClique_topEntity_types is
  function toSLV (sl : in std_logic) return std_logic_vector is
  begin
    return std_logic_vector'(0 => sl);
  end;
  function fromSLV (slv : in std_logic_vector) return std_logic is
    alias islv : std_logic_vector (0 to slv'length - 1) is slv;
  begin
    return islv(0);
  end;
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
  function toSLV (p : Tup5) return std_logic_vector is
  begin
    return (toSLV(p.Tup5_sel0_std_logic_0) & toSLV(p.Tup5_sel1_std_logic_1) & toSLV(p.Tup5_sel2_std_logic_2) & toSLV(p.Tup5_sel3_std_logic_3) & toSLV(p.Tup5_sel4_std_logic_4));
  end;
  function fromSLV (slv : in std_logic_vector) return Tup5 is
  alias islv : std_logic_vector(0 to slv'length - 1) is slv;
  begin
    return (fromSLV(islv(0 to 0)),fromSLV(islv(1 to 1)),fromSLV(islv(2 to 2)),fromSLV(islv(3 to 3)),fromSLV(islv(4 to 4)));
  end;
  function toSLV (p : Tup4) return std_logic_vector is
  begin
    return (toSLV(p.Tup4_sel0_std_logic_0) & toSLV(p.Tup4_sel1_std_logic_1) & toSLV(p.Tup4_sel2_std_logic_2) & toSLV(p.Tup4_sel3_std_logic_3));
  end;
  function fromSLV (slv : in std_logic_vector) return Tup4 is
  alias islv : std_logic_vector(0 to slv'length - 1) is slv;
  begin
    return (fromSLV(islv(0 to 0)),fromSLV(islv(1 to 1)),fromSLV(islv(2 to 2)),fromSLV(islv(3 to 3)));
  end;
end;

