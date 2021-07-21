LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY control IS
    PORT (
        CLK : IN STD_LOGIC;
        INIT : IN STD_LOGIC;
        TRAFO : IN STD_LOGIC;
        EN125 : OUT STD_LOGIC;
        EN346 : OUT STD_LOGIC;
        EN78 : OUT STD_LOGIC;
        RESULT : OUT STD_LOGIC;
        S : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        S_T : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END control;

ARCHITECTURE Behavioral OF control IS
    SIGNAL counter : unsigned (2 DOWNTO 0) := (OTHERS => '1');
BEGIN
    control_proc : PROCESS (CLK)
    BEGIN
        IF CLK = '1' AND CLK'event THEN
            IF INIT = '1' AND counter = "100" THEN
                counter <= "000";
            ELSIF counter /= "100" THEN
                counter <= counter + 1;
            END IF;
            CASE(counter) IS

                WHEN "000" =>
                EN125 <= '1';
                EN346 <= '0';
                EN78 <= '0';
                RESULT <= '0';
                S <= "00";
                IF TRAFO = '1' THEN
                    S_T <= "01";
                ELSE
                    S_T <= "00";
                END IF;
                WHEN "001" =>
                EN125 <= '0';
                EN346 <= '1';
                EN78 <= '0';
                RESULT <= '0';
                S <= "01";
                IF TRAFO = '1' THEN
                    counter <= "011";
                    S_T <= "00";
                ELSE
                    S_T <= "01";
                END IF;
                WHEN "010" =>
                EN125 <= '0';
                EN346 <= '0';
                EN78 <= '1';
                RESULT <= '0';
                S <= "10";
                IF TRAFO = '1' THEN
                    S_T <= "11";
                ELSE
                    S_T <= "10";
                END IF;
                WHEN "011" =>
                EN125 <= '0';
                EN346 <= '0';
                EN78 <= '0';
                RESULT <= '1';
                S <= "11";
                IF TRAFO = '1' THEN
                    S_T <= "10";
                ELSE
                    S_T <= "11";
                END IF;
                WHEN "100" =>
                EN125 <= '0';
                EN346 <= '0';
                EN78 <= '0';
                RESULT <= '0';
                S <= "11";
                IF TRAFO = '1' THEN
                    S_T <= "10";
                ELSE
                    S_T <= "11";
                END IF;
                -- WHEN "101" =>
                -- EN125 <= '0';
                -- EN346 <= '0';
                -- EN78 <= '0';
                -- S <= "10";
                -- IF TRAFO = '1' THEN
                --     S_T <= "11";
                -- ELSE
                --     S_T <= "10";
                -- END IF;
                -- WHEN "110" =>
                -- EN125 <= '0';
                -- EN346 <= '0';
                -- EN78 <= '0';
                -- RESULT <= '1';
                -- S <= "11";
                -- IF TRAFO = '1' THEN
                --     S_T <= "10";
                -- ELSE
                --     S_T <= "11";
                -- END IF;
                -- WHEN "111" =>
                -- EN125 <= '0';
                -- EN346 <= '0';
                -- EN78 <= '0';
                -- RESULT <= '0';
                -- S <= "11";
                -- IF TRAFO = '1' THEN
                --     S_T <= "10";
                -- ELSE
                --     S_T <= "11";
                -- END IF;
                WHEN OTHERS => counter <= "100";
            END CASE;

            -- S <= select_line;
            -- IF TRAFO = '1' THEN
            --     S_T <= select_line(1) & NOT(select_line(0));
            -- ELSE
            --     S_T <= select_line;
            -- END IF;

        END IF;
    END PROCESS; -- control_proc
END Behavioral;