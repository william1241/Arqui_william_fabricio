library ieee;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

ENTITY RAM IS
PORT(clk_sinc: IN bit;
		Data_in: IN STD_LOGIC_VECTOR (7 downto 0);
		Address_with: IN STD_LOGIC_VECTOR (6 downto 0);
		W/R: IN STD_LOGIC;
		Data_out: STD_LOGIC_VECTOR (7 downto 0));
END ENTITY RAM;

ARCHITECTURE a_RAM OF RAM IS
BEGIN
TYPE RAM_ARRAY is array (0 to 127 ) of std_logic_vector (7 downto 0);
-- initial values in the RAM
SIGNAL RAM: RAM_ARRAY :=(
   x"55",x"66",x"77",x"67",-- 0x00: 
   x"99",x"00",x"00",x"11",-- 0x04: 
   x"00",x"00",x"00",x"00",-- 0x08: 
   x"00",x"00",x"00",x"00",-- 0x0C: 
   x"00",x"00",x"00",x"00",-- 0x10: 
   x"00",x"00",x"00",x"00",-- 0x14: 
   x"00",x"00",x"00",x"00",-- 0x18: 
   x"00",x"00",x"00",x"00",-- 0x1C: 
   x"00",x"00",x"00",x"00",-- 0x20: 
   x"00",x"00",x"00",x"00",-- 0x24: 
   x"00",x"00",x"00",x"00",-- 0x28: 
   x"00",x"00",x"00",x"00",-- 0x2C: 
   x"00",x"00",x"00",x"00",-- 0x30: 
   x"00",x"00",x"00",x"00",-- 0x34: 
   x"00",x"00",x"00",x"00",-- 0x38: 
   x"00",x"00",x"00",x"00",-- 0x3C: 
   x"00",x"00",x"00",x"00",-- 0x40: 
   x"00",x"00",x"00",x"00",-- 0x44: 
   x"00",x"00",x"00",x"00",-- 0x48: 
   x"00",x"00",x"00",x"00",-- 0x4C: 
   x"00",x"00",x"00",x"00",-- 0x50: 
   x"00",x"00",x"00",x"00",-- 0x54: 
   x"00",x"00",x"00",x"00",-- 0x58: 
   x"00",x"00",x"00",x"00",-- 0x5C: 
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00"); 
	PROCESS(clk_sinc)
	BEGIN
		IF(rising_edge(clk_sinc)) THEN
			IF(W/R='1') THEN -- when write enable = 1, 
 -- write input data into RAM at the provided address
		RAM(to_integer(unsigned(address_with))) <= Data_in;
 -- The index of the RAM array type needs to be integer so
 -- converts RAM_ADDR from std_logic_vector -> Unsigned -> Interger using numeric_std library
			END IF;
		END IF;
	END PROCESS;
 -- Data to be read out 
 Data_out<= RAM(to_integer(unsigned(address_with)));
END ARCHITECTURE a_RAM;