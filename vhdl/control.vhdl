LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY control IS
    PORT (
        CLK : IN STD_LOGIC;
        START : IN STD_LOGIC;
        READY : OUT STD_LOGIC;
        S : OUT STD_LOGIC;
        EN : OUT STD_LOGIC;
        ROUND : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END control;

ARCHITECTURE behave OF control IS

    TYPE state_type IS (IDLE, ROUND_1, SUBSEQUENT_ROUNDS, OUTPUT_TRANSFORMATION);
    SIGNAL state : state_type;
    SIGNAL round_counter : unsigned (3 DOWNTO 0);

BEGIN

    ROUND <= STD_LOGIC_VECTOR(round_counter);

    control_proc : PROCESS (CLK)
    BEGIN
        IF CLK = '1' AND CLK'event THEN
            IF START = '1' THEN
                state <= ROUND_1;
            END IF;
            CASE(state) IS

                WHEN IDLE =>
                READY <= '1';

                WHEN ROUND_1 =>
                EN <= '1';
                READY <= '0';
                S <= '0';
                round_counter <= "0000";
                state <= SUBSEQUENT_ROUNDS;

                WHEN SUBSEQUENT_ROUNDS =>
                EN <= '1';
                READY <= '0';
                S <= '1';
                round_counter <= round_counter + 1;
                IF round_counter = "0110" THEN
                    state <= OUTPUT_TRANSFORMATION;
                END IF;

                WHEN OUTPUT_TRANSFORMATION =>
                EN <= '0';
                S <= '1';
                READY <= '1';
                round_counter <= "1000";
                state <= IDLE;
                WHEN OTHERS =>
                READY <= '1';
                state <= IDLE;

            END CASE;
        END IF;
    END PROCESS; -- control_proc
END behave; -- behave