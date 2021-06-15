library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity keygen is
    port (  KEY : in STD_LOGIC_VECTOR (127 downto 0);
            ROUND_KEY_1 : out STD_LOGIC_VECTOR(95 downto 0);
            ROUND_KEY_2 : out STD_LOGIC_VECTOR(95 downto 0);
            ROUND_KEY_3 : out STD_LOGIC_VECTOR(95 downto 0);
            ROUND_KEY_4 : out STD_LOGIC_VECTOR(95 downto 0);
            ROUND_KEY_5 : out STD_LOGIC_VECTOR(95 downto 0);
            ROUND_KEY_6 : out STD_LOGIC_VECTOR(95 downto 0);
            ROUND_KEY_7 : out STD_LOGIC_VECTOR(95 downto 0);
            ROUND_KEY_8 : out STD_LOGIC_VECTOR(95 downto 0);
            TRAFO_KEY_1 : out STD_LOGIC_VECTOR(63 downto 0));

end keygen;

architecture Behavioral of keygen is
    signal KEY_0 : unsigned (127 downto 0);
    signal KEY_25 : unsigned (127 downto 0);
    signal KEY_50 : unsigned (127 downto 0);
    signal KEY_75 : unsigned (127 downto 0);
    signal KEY_100 : unsigned (127 downto 0);
    signal KEY_125 : unsigned (127 downto 0);
    signal KEY_150 : unsigned (127 downto 0);
    begin
        keygen_proc : process( KEY )
        begin
            KEY_0 <= unsigned(KEY) rol 0;
            KEY_25 <= unsigned(KEY) rol 25;
            KEY_50 <= unsigned(KEY) rol 50;
            KEY_75 <= unsigned(KEY) rol 75;
            KEY_100 <= unsigned(KEY) rol 100;
            KEY_125 <= unsigned(KEY) rol 125;
            KEY_150 <= unsigned(KEY) rol 150;
        end process keygen_proc;

        ROUND_KEY_1 <= STD_LOGIC_VECTOR(KEY_0(127 downto 32));
        ROUND_KEY_2 <= STD_LOGIC_VECTOR(KEY_0(31 downto 0) & KEY_25(127 downto 64));
        ROUND_KEY_3 <= STD_LOGIC_VECTOR(KEY_25(63 downto 0) & KEY_50(127 downto 96));
        ROUND_KEY_4 <= STD_LOGIC_VECTOR(KEY_50(95 downto 0));
        ROUND_KEY_5 <= STD_LOGIC_VECTOR(KEY_75(127 downto 32));
        ROUND_KEY_6 <= STD_LOGIC_VECTOR(KEY_75(31 downto 0) & KEY_100(127 downto 64));
        ROUND_KEY_7 <= STD_LOGIC_VECTOR(KEY_100(63 downto 0) & KEY_125(127 downto 96));
        ROUND_KEY_8 <= STD_LOGIC_VECTOR(KEY_125(95 downto 0));
        TRAFO_KEY_1 <= STD_LOGIC_VECTOR(KEY_150(127 downto 64));
        end Behavioral;

