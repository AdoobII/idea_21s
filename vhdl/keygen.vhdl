LIBRARY ieee;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_1164.ALL;

ENTITY keygen IS
    PORT (
        KEY : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
        ROUND_C : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        Z_1 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
        Z_2 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
        Z_3 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
        Z_4 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
        Z_5 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
        Z_6 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));

END keygen;

ARCHITECTURE Behavioral OF keygen IS
BEGIN
    --The indices in the keygen_proc were generated using python to avoid rotating the key in hardware, since the rotation is a linear operation and its magnitude does not change
    keygen_proc : PROCESS (KEY, ROUND_C)
    BEGIN
        CASE(ROUND_C) IS
            WHEN "0000" =>
            Z_1 <= STD_LOGIC_VECTOR(KEY(127 DOWNTO 112));
            Z_2 <= STD_LOGIC_VECTOR(KEY(111 DOWNTO 96));
            Z_3 <= STD_LOGIC_VECTOR(KEY(95 DOWNTO 80));
            Z_4 <= STD_LOGIC_VECTOR(KEY(79 DOWNTO 64));
            Z_5 <= STD_LOGIC_VECTOR(KEY(63 DOWNTO 48));
            Z_6 <= STD_LOGIC_VECTOR(KEY(47 DOWNTO 32));
            WHEN "0001" =>
            Z_1 <= STD_LOGIC_VECTOR(KEY(31 DOWNTO 16));
            Z_2 <= STD_LOGIC_VECTOR(KEY(15 DOWNTO 0));
            Z_3 <= STD_LOGIC_VECTOR(KEY(102 DOWNTO 87));
            Z_4 <= STD_LOGIC_VECTOR(KEY(86 DOWNTO 71));
            Z_5 <= STD_LOGIC_VECTOR(KEY(70 DOWNTO 55));
            Z_6 <= STD_LOGIC_VECTOR(KEY(54 DOWNTO 39));
            WHEN "0010" =>
            Z_1 <= STD_LOGIC_VECTOR(KEY(38 DOWNTO 23));
            Z_2 <= STD_LOGIC_VECTOR(KEY(22 DOWNTO 7));
            Z_3 <= STD_LOGIC_VECTOR(KEY(6 DOWNTO 0)) & STD_LOGIC_VECTOR(KEY(127 DOWNTO 119));
            Z_4 <= STD_LOGIC_VECTOR(KEY(118 DOWNTO 103));
            Z_5 <= STD_LOGIC_VECTOR(KEY(77 DOWNTO 62));
            Z_6 <= STD_LOGIC_VECTOR(KEY(61 DOWNTO 46));
            WHEN "0011" =>
            Z_1 <= STD_LOGIC_VECTOR(KEY(45 DOWNTO 30));
            Z_2 <= STD_LOGIC_VECTOR(KEY(29 DOWNTO 14));
            Z_3 <= STD_LOGIC_VECTOR(KEY(13 DOWNTO 0)) & STD_LOGIC_VECTOR(KEY(127 DOWNTO 126));
            Z_4 <= STD_LOGIC_VECTOR(KEY(125 DOWNTO 110));
            Z_5 <= STD_LOGIC_VECTOR(KEY(109 DOWNTO 94));
            Z_6 <= STD_LOGIC_VECTOR(KEY(93 DOWNTO 78));
            WHEN "0100" =>
            Z_1 <= STD_LOGIC_VECTOR(KEY(52 DOWNTO 37));
            Z_2 <= STD_LOGIC_VECTOR(KEY(36 DOWNTO 21));
            Z_3 <= STD_LOGIC_VECTOR(KEY(20 DOWNTO 5));
            Z_4 <= STD_LOGIC_VECTOR(KEY(4 DOWNTO 0)) & STD_LOGIC_VECTOR(KEY(127 DOWNTO 117));
            Z_5 <= STD_LOGIC_VECTOR(KEY(116 DOWNTO 101));
            Z_6 <= STD_LOGIC_VECTOR(KEY(100 DOWNTO 85));
            WHEN "0101" =>
            Z_1 <= STD_LOGIC_VECTOR(KEY(84 DOWNTO 69));
            Z_2 <= STD_LOGIC_VECTOR(KEY(68 DOWNTO 53));
            Z_3 <= STD_LOGIC_VECTOR(KEY(27 DOWNTO 12));
            Z_4 <= STD_LOGIC_VECTOR(KEY(11 DOWNTO 0)) & STD_LOGIC_VECTOR(KEY(127 DOWNTO 124));
            Z_5 <= STD_LOGIC_VECTOR(KEY(123 DOWNTO 108));
            Z_6 <= STD_LOGIC_VECTOR(KEY(107 DOWNTO 92));
            WHEN "0110" =>
            Z_1 <= STD_LOGIC_VECTOR(KEY(91 DOWNTO 76));
            Z_2 <= STD_LOGIC_VECTOR(KEY(75 DOWNTO 60));
            Z_3 <= STD_LOGIC_VECTOR(KEY(59 DOWNTO 44));
            Z_4 <= STD_LOGIC_VECTOR(KEY(43 DOWNTO 28));
            Z_5 <= STD_LOGIC_VECTOR(KEY(2 DOWNTO 0)) & STD_LOGIC_VECTOR(KEY(127 DOWNTO 115));
            Z_6 <= STD_LOGIC_VECTOR(KEY(114 DOWNTO 99));
            WHEN "0111" =>
            Z_1 <= STD_LOGIC_VECTOR(KEY(98 DOWNTO 83));
            Z_2 <= STD_LOGIC_VECTOR(KEY(82 DOWNTO 67));
            Z_3 <= STD_LOGIC_VECTOR(KEY(66 DOWNTO 51));
            Z_4 <= STD_LOGIC_VECTOR(KEY(50 DOWNTO 35));
            Z_5 <= STD_LOGIC_VECTOR(KEY(34 DOWNTO 19));
            Z_6 <= STD_LOGIC_VECTOR(KEY(18 DOWNTO 3));
            WHEN "1000" =>
            Z_1 <= STD_LOGIC_VECTOR(KEY(105 DOWNTO 90));
            Z_2 <= STD_LOGIC_VECTOR(KEY(89 DOWNTO 74));
            Z_3 <= STD_LOGIC_VECTOR(KEY(73 DOWNTO 58));
            Z_4 <= STD_LOGIC_VECTOR(KEY(57 DOWNTO 42));
            Z_5 <= (OTHERS => 'X');
            Z_6 <= (OTHERS => 'X');
            WHEN OTHERS =>
            Z_1 <= (OTHERS => 'X');
            Z_2 <= (OTHERS => 'X');
            Z_3 <= (OTHERS => 'X');
            Z_4 <= (OTHERS => 'X');
            Z_5 <= (OTHERS => 'X');
            Z_6 <= (OTHERS => 'X');
        END CASE;
    END PROCESS keygen_proc;

    -- ROUND_KEY_1 <= STD_LOGIC_VECTOR(KEY_0(127 downto 32));
    -- ROUND_KEY_2 <= STD_LOGIC_VECTOR(KEY_0(31 downto 0) & KEY_25(127 downto 64));
    -- ROUND_KEY_3 <= STD_LOGIC_VECTOR(KEY_25(63 downto 0) & KEY_50(127 downto 96));
    -- ROUND_KEY_4 <= STD_LOGIC_VECTOR(KEY_50(95 downto 0));
    -- ROUND_KEY_5 <= STD_LOGIC_VECTOR(KEY_75(127 downto 32));
    -- ROUND_KEY_6 <= STD_LOGIC_VECTOR(KEY_75(31 downto 0) & KEY_100(127 downto 64));
    -- ROUND_KEY_7 <= STD_LOGIC_VECTOR(KEY_100(63 downto 0) & KEY_125(127 downto 96));
    -- ROUND_KEY_8 <= STD_LOGIC_VECTOR(KEY_125(95 downto 0));
    -- TRAFO_KEY_1 <= STD_LOGIC_VECTOR(KEY_150(127 downto 64));
END Behavioral;