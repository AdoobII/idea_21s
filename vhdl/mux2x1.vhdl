LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux2x1 IS
    PORT (
        D0 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        D1 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        S : IN STD_LOGIC;
        O : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
END mux2x1;

ARCHITECTURE Behav OF mux2x1 IS
BEGIN
    mux : PROCESS (D0, D1, S)
    BEGIN
        IF S = '0' THEN
            O <= D0;
        ELSE
            O <= D1;
        END IF;
    END PROCESS; -- mux
END Behav; -- Behav