library ieee;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

ENTITY alu8 IS
PORT(a:IN std_logic_vector(7 downto 0);
		b:IN std_logic_vector(7 downto 0);
		op:IN std_logic_vector(3 downto 0);
		ci: IN std_logic;
		co: OUT std_logic;
		r: OUT std_logic_vector(7 downto 0);
		z: OUT std_logic);
END ENTITY alu8;

ARCHITECTURE a_alu OF alu8 IS
SIGNAL r1: std_logic_vector(8 downto 0);
BEGIN 

		PROCESS(ci, a, b, op)
		BEGIN
			CASE op IS
				WHEN "0000" =>
					r1<="000000000";
				WHEN "0001" =>
					r1<="000000000";
				WHEN "0010" =>
					r1(8)<=a(7);
					r1(0)<=ci;
					r1(7 downto 1)<=a(6 downto 0);
				WHEN "0011" =>
					r1(8)<=a(0);
					r1(7)<=ci;
					r1(6 downto 0)<=a(7 downto 1);
				WHEN "0100" =>
					r1(7 downto 0)<= a AND b;
					r1(8)<='0';
				WHEN "0101" =>
					r1(7 downto 0)<= a OR b;
					r1(8)<='0';
				WHEN "0110" =>
					r1(7 downto 0)<= a XOR b;
					r1(8)<='0';
				WHEN "0111" =>
					r1(7 downto 0)<= NOT a;
					r1(8)<='0';
				WHEN "1000" =>
					r1(7 downto 0)<=a;
					r1(8)<='0';
				WHEN "1001" =>
					r1(7 downto 0)<=b;
					r1(8)<='0';
				WHEN "1010" =>
					r1<=('0'&a)+1;
				WHEN "1011" =>
					r1<=('0'&a)-1;
				WHEN "1100" =>
					r1<= ('0'&a)+('0'&b);
				WHEN "1101" =>
					r1<= ('0'&a)-('0'&b);
				WHEN OTHERS =>
					r1<= "011111111";
			END CASE;
			
			IF r1(7 downto 0)="00000000" THEN
				z<='1';
			ELSE
				z<='0';
			END IF;
			
			r<=r1(7 downto 0);
			co<=r1(8);
		END PROCESS;
END ARCHITECTURE a_alu;