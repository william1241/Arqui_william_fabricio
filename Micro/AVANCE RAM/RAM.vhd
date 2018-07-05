library ieee;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

ENTITY RAM IS
PORT(clk_sinc: IN bit;
		Data_in: IN STD_LOGIC_VECTOR (7 downto 0);
		RAM_ADDR: IN STD_LOGIC_VECTOR (6 downto 0);
		nWR: IN STD_LOGIC;
		Data_out: OUT STD_LOGIC_VECTOR (7 downto 0));
END ENTITY RAM;

ARCHITECTURE a_RAM OF RAM IS
TYPE RAM_ARRAY IS  ARRAY (0 to 127 ) of std_logic_vector (7 downto 0);
SIGNAL RAM: RAM_ARRAY :=(
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00"); 
BEGIN
	PROCESS(clk_sinc)
		BEGIN
			IF clk_sinc'event AND clk_sinc='1' THEN 
				IF(nWR='1') then -- when write enable = 1, 
 -- write input data into RAM at the provided address
					RAM(conv_integer(RAM_ADDR)) <= Data_in;
 -- The index of the RAM array type needs to be integer so
 -- converts RAM_ADDR from std_logic_vector -> Unsigned -> Interger using numeric_std library
				END IF;
			END IF;
		END PROCESS;
Data_out <= RAM(conv_integer(RAM_ADDR));
END ARCHITECTURE a_RAM;