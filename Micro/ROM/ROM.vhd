Library ieee;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

ENTITY ROM IS
PORT(address: IN STD_LOGIC_VECTOR (3 downto 0);
		memData: OUT STD_LOGIC_VECTOR (11 downto 0));
END ENTITY ROM;

ARCHITECTURE a_rom OF ROM IS
BEGIN 
		PROCESS (address)
BEGIN	
		CASE address IS
		
			WHEN "0000" => 
				memData<= "100100001111";
			
			WHEN "0001" =>
				memData<= "110000001100";
				
			WHEN "0010" =>
				memData<= "010111110000";
				
			WHEN "0011" =>
				memData<= "011000000011";
				
			WHEN "0100" =>
				memData<= "010011111111";
				
			WHEN "0101" =>
				memData<= "110001100100";
				
			WHEN "0110" =>
				memData<= "110111001000";
				
			WHEN "0111" =>
				memData<= "110001100100";
				
			WHEN "1000" =>
				memData<= "010100001100";
				
			WHEN "1001" =>
				memData<= "010000000000";
				
			WHEN "1010" =>
				memData<= "100100010111";
				
			WHEN OTHERS =>
				memData<="000000000000";
		END CASE;
	END PROCESS;
END ARCHITECTURE a_rom;