LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY roundcounter IS
    PORT (
        CLK : IN STD_LOGIC;
        START : IN STD_LOGIC;
        RESULT : IN STD_LOGIC;
        READY : OUT STD_LOGIC;
        S_i : OUT STD_LOGIC;
        INIT : OUT STD_LOGIC;
        TRAFO : OUT STD_LOGIC;
        ROUND : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END roundcounter;

ARCHITECTURE Behavioral OF roundcounter IS
    TYPE state_type IS (sleep, setup, calc);
    SIGNAL state : state_type;
    SIGNAL round_counter : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1000";
BEGIN
    roundcounter_proc : PROCESS (CLK)
    BEGIN

        IF clk = '1' AND clk'event THEN
            CASE(round_counter) IS

                WHEN "1000" =>
                IF START = '1' THEN
                    round_counter <= "0000";
                END IF;
                WHEN "0000" =>
                IF RESULT = '1' THEN
                    round_counter <= "0001";
                END IF;
                WHEN "0001" =>
                IF RESULT = '1' THEN
                    round_counter <= "0010";
                END IF;
                WHEN "0010" =>
                IF RESULT = '1' THEN
                    round_counter <= "0011";
                END IF;
                WHEN "0011" =>
                IF RESULT = '1' THEN
                    round_counter <= "0100";
                END IF;
                WHEN "0100" =>
                IF RESULT = '1' THEN
                    round_counter <= "0101";
                END IF;
                WHEN "0101" =>
                IF RESULT = '1' THEN
                    round_counter <= "0110";
                END IF;
                WHEN "0110" =>
                IF RESULT = '1' THEN
                    round_counter <= "0111";
                END IF;
                WHEN "0111" =>
                IF RESULT = '1' THEN
                    round_counter <= "1000";
                END IF;
                WHEN OTHERS => round_counter <= "1000";
            END CASE;
            CASE(state) IS
                WHEN sleep =>
                INIT <= '0';
                READY <= '1';
                IF START = '1' THEN
                    state <= setup;
                END IF;

                WHEN setup =>
                INIT <= '1';
                READY <= '0';
                state <= calc;

                WHEN calc =>
                INIT <= '0';
                IF RESULT = '1' AND round_counter /= "1000" THEN
                    state <= setup;
                ELSIF RESULT = '1' AND round_counter = "1000" THEN
                    state <= sleep;
                END IF;
                WHEN OTHERS => state <= sleep;
            END CASE;
            TRAFO <= round_counter(3);
            ROUND <= round_counter;
            IF round_counter = "0000" THEN
                S_i <= '1';
            ELSE
                S_i <= '0';
            END IF;
        END IF;
    END PROCESS; -- roundcounter_proc
END Behavioral;