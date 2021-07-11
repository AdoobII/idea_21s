LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_mux4x1 IS
END tb_mux4x1;

ARCHITECTURE behav OF tb_mux4x1 IS
    --component declaration
    COMPONENT mux4x1
        PORT (
            D0 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            D1 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            D2 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            D3 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            S : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
            O : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
    END COMPONENT;

    --input signals
    SIGNAL D0 : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL D1 : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL D2 : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL D3 : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL S : STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '0');
    --output signal
    SIGNAL O : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');

BEGIN
    --instantiation of mulop
    uut : mux4x1 PORT MAP
    (
        D0 => D0,
        D1 => D1,
        D2 => D2,
        D3 => D3,
        S => S,
        O => O
    );

    stim_proc : PROCESS
    BEGIN
        WAIT FOR 100 ns;
        D0 <= x"AAAA";
        D1 <= x"BBBB";
        D2 <= x"CCCC";
        D3 <= x"DDDD";
        WAIT FOR 50 ns;
        S <= "01";
        WAIT FOR 50 ns;
        S <= "10";
        WAIT FOR 50 ns;
        S <= "11";
        WAIT FOR 50 ns;
        D3 <= x"FFFF";
        WAIT FOR 100 ns;
        ASSERT false REPORT "Reached end of test";
        WAIT;
    END PROCESS;
END behav;