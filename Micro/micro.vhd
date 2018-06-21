Library ieee;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

ENTITY micro IS
PORT(clk: IN bit;
		rst: IN bit;
		Cout: OUT STD_LOGIC;
		PCout: OUT STD_LOGIC_VECTOR (3 downto 0);
		Wout: OUT STD_LOGIC_VECTOR (7 downto 0);
		LEDestado: OUT STD_LOGIC_VECTOR(2 downto 0));
END ENTITY micro;

ARCHITECTURE a_micro OF micro IS
TYPE tipo_estado IS (leer,execute,escribir);
SIGNAL PC, tmpPC : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL IR : STD_LOGIC_VECTOR (11 downto 0); 
SIGNAL W : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL tmpB, tmpA : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL R : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL tmpS : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL memData1 : STD_LOGIC_VECTOR (11 downto 0);
SIGNAL C, Co1, Ci1: STD_LOGIC;
SIGNAL estado: tipo_estado:= leer;
SIGNAL prox_estado: tipo_estado;

BEGIN 

	ALU: ENTITY work.alu8 PORT MAP( a => tmpA,
													b => tmpB,
													op => tmpS,
													ci => Ci1,
													co => Co1,
													r => R);
													
	ROM: ENTITY work.ROM PORT MAP( address => PC,
													memData => memData1);

		dpe:
		PROCESS(estado)
		BEGIN
			IF rst='0' THEN 
				PC<="0000";
				W<="00000000";
				C<='0';
			ELSE
				CASE estado IS
					WHEN leer =>
						IR<= memData1;
						prox_estado<=execute;
						LEDestado <= "001";
					WHEN execute =>
						tmpB<=IR(7 downto 0);
						tmpS<=IR (11 downto 8);
						tmpA<=W;
						tmpPC<=PC+1;
						prox_estado<=escribir;
						LEDestado <= "010";
					WHEN escribir =>
						W<=R;
						C<=Co1;
						Ci1<=C;
						PC <= tmpPC;
						prox_estado<=leer;
						LEDestado <= "100";
				END CASE;
			END IF;
		END PROCESS dpe;
		
		PROCESS (clk, prox_estado)
		BEGIN 
			IF rst='0' THEN
				estado <= leer;
			ELSIF clk'event AND clk='0' THEN 
				estado<= prox_estado;
			END IF;
		END PROCESS;

		PCout<=PC;
		Wout<=W;
		Cout<=C;

END ARCHITECTURE a_micro; 