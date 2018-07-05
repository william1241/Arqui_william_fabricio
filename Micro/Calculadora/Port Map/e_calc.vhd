Library ieee;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

ENTITY e_calc IS
PORT(entrada:IN bit;
		clk: IN bit;
		salida: OUT bit);
END ENTITY e_calc;

ARCHITECTURE a_calc OF e_calc IS
TYPE tipo_estado IS (leerA,leerB,leerOP, mostrar_resultado); 
SIGNAL regA : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL regB : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL regOP : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL aluR : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL regResultado : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
SIGNAL Cin, Zout, Cout : STD_LOGIC;
SIGNAL estado: tipo_estado:= leerA;
SIGNAL prox_estado: tipo_estado;

BEGIN alu8: ENTITY work.ALU PORT MAP( a => regA,
													b => regB,
													op => regOP,
													ci => Cin,
													co => Cout,
													z => Zout,
													r => aluR);
		dpe:
		PROCESS(estado, entrada)
			BEGIN
				CASE estado IS
						WHEN leerA =>
							prox_estado<= leerB;
							a1<='1';
						WHEN leerB =>
							prox_estado<= leerOP;
							b1<='1';
						WHEN leerOP =>
							prox_estado<= mostrar_resultado;
							op1<='1';
						WHEN mostrar_resultado =>
							IF entrada<='1' THEN
								salida<=aluR;
							ELSE 
								salida<=Zout;
							END IF;
						WHEN OTHERS =>
								prox_estado <= leerA;
				END CASE;
		END PROCESS dpe;
END ARCHITECTURE a_calc; 