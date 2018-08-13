Library ieee;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

ENTITY ROM IS
PORT(address: IN STD_LOGIC_VECTOR (3 downto 0);
		memData: OUT STD_LOGIC_VECTOR (13 downto 0));
END ENTITY ROM;

ARCHITECTURE a_rom OF ROM IS
BEGIN 
		PROCESS (address)
BEGIN	
		CASE address IS
		
			WHEN "0000" => 
				memData<= "11100100010100";	--movLW 20
			
			WHEN "0001" =>
				memData<= "00100010000101";	--movWF 5
				
			WHEN "0010" =>
				memData<= "11100100001111";	--movLW 15
				
			WHEN "0011" =>
				memData<= "00100010000110";	--movWF 6
				
			WHEN "0100" =>
				memData<= "11110000001010";	--addLW 10
				
			WHEN "0101" =>
				memData<= "00100010000111";	--movWF 7
				
			WHEN "0110" =>
				memData<= "11110000010100";	--addLW 20
				
			WHEN "0111" =>
				memData<= "00100010001000";	--movWF 8
				
			WHEN "1000" =>
				memData<= "00100100000111";	--movF 7,0
				
			WHEN "1001" =>
				memData<= "00110000000111";	--addWF 7,0
				
			WHEN "1010" =>
				memData<= "00100100000111";	--movF 7,0
			
			WHEN "1011" =>
				memData<= "00110010000110";	--addWF 6,1
				
			WHEN "1100" =>
				memData<= "00100100000110";	--movF 6,0
				
			WHEN "1101" =>
				memData<= "00100110001000";	--movF 8,1
				
			WHEN OTHERS =>
				memData<= "00000000000000";
		END CASE;
	END PROCESS;
END ARCHITECTURE a_rom;