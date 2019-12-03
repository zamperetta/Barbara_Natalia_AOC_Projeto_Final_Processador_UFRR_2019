LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY RAM IS
	port(entradaDATA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		  saidaDATA   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		  endereco     : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		  writememory, readmemory, clk   : IN STD_LOGIC);
END RAM;

ARCHITECTURE test OF RAM IS
	TYPE memory1 IS ARRAY(0 TO 1) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL memoria : memory1:= (OTHERS => "00000000");
BEGIN
	PROCESS(Clk)
		BEGIN
			IF(rising_edge(Clk)) THEN
				IF(writememory = '1') THEN
					memoria(to_integer(unsigned(endereco))) <= entradaDATA;
				END IF;
				IF (readmemory = '1') THEN
					saidaDATA <= memoria(to_integer(unsigned(endereco)));
				END IF;
			END IF;
	END PROCESS;
END test;

