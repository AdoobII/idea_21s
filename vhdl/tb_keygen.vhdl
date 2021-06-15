LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_keygen IS
END tb_keygen;

ARCHITECTURE behav OF tb_keygen IS
    --component declaration
    COMPONENT keygen
        PORT (
            KEY : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
            ROUND_C : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Z_1 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z_2 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z_3 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z_4 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z_5 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z_6 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
    END COMPONENT;

    --input signals
    SIGNAL KEY : STD_LOGIC_VECTOR(127 DOWNTO 0) := (OTHERS => '0');
    SIGNAL ROUND_C : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');

    --output signal
    SIGNAL Z_1 : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL Z_2 : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL Z_3 : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL Z_4 : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL Z_5 : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL Z_6 : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');

BEGIN
    --instantiation of mulop
    uut : keygen PORT MAP
    (
        KEY => KEY,
        ROUND_C => ROUND_C,
        Z_1 => Z_1,
        Z_2 => Z_2,
        Z_3 => Z_3,
        Z_4 => Z_4,
        Z_5 => Z_5,
        Z_6 => Z_6
    );

    stim_proc : PROCESS
    BEGIN
        WAIT FOR 100 ns;
        KEY <= x"00010002000300040005000600070008";
        ROUND_c <= "0000";
        WAIT FOR 10 ns;
        ROUND_c <= "0001";
        WAIT FOR 10 ns;
        ROUND_c <= "0010";
        WAIT FOR 10 ns;
        ROUND_c <= "0011";
        WAIT FOR 10 ns;
        ROUND_c <= "0100";
        WAIT FOR 10 ns;
        ROUND_c <= "0101";
        WAIT FOR 10 ns;
        ROUND_c <= "0110";
        WAIT FOR 10 ns;
        ROUND_c <= "0111";
        WAIT FOR 10 ns;
        ROUND_c <= "1000";
        WAIT FOR 10 ns;
        ROUND_c <= "1001";
        WAIT FOR 10 ns;
        ROUND_c <= "1011";
        WAIT FOR 10 ns;
        WAIT FOR 100 ns;
        KEY <= x"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
        ROUND_c <= "0000";
        WAIT FOR 10 ns;
        ROUND_c <= "0001";
        WAIT FOR 10 ns;
        ROUND_c <= "0010";
        WAIT FOR 10 ns;
        ROUND_c <= "0011";
        WAIT FOR 10 ns;
        ROUND_c <= "0100";
        WAIT FOR 10 ns;
        ROUND_c <= "0101";
        WAIT FOR 10 ns;
        ROUND_c <= "0110";
        WAIT FOR 10 ns;
        ROUND_c <= "0111";
        WAIT FOR 10 ns;
        ROUND_c <= "1000";
        WAIT FOR 10 ns;
        ROUND_c <= "1001";
        WAIT FOR 10 ns;
        ROUND_c <= "1011";
        WAIT FOR 10 ns;
        WAIT FOR 100 ns;
        ASSERT false REPORT "Reached end of test";
        WAIT;
    END PROCESS;
END behav;