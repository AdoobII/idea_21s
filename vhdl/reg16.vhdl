LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY reg16 IS
    PORT (
        CLOCK : IN STD_LOGIC;
        ENABLE : IN STD_LOGIC;
        D : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        Q : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
END reg16;

ARCHITECTURE Behav OF reg16 IS
BEGIN
    reg : PROCESS (CLOCK)
    BEGIN
        IF (CLOCK = '1' AND CLOCK'EVENT) THEN
            IF (ENABLE = '1') THEN
                Q <= D;
            END IF;
        END IF;
    END PROCESS; -- reg
END Behav; -- Behav