LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_idea_rcs2 IS
END tb_idea_rcs2;

ARCHITECTURE behavior OF tb_idea_rcs2 IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT idea_rcs2
        PORT (
            CLOCK : IN STD_LOGIC;
            START : IN STD_LOGIC;
            KEY : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
            X_1 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            X_2 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            X_3 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            X_4 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y_1 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y_2 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y_3 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y_4 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            READY : OUT STD_LOGIC);
    END COMPONENT;
    --Inputs
    SIGNAL CLOCK : STD_LOGIC := '0';
    SIGNAL START : STD_LOGIC := '0';
    SIGNAL KEY : STD_LOGIC_VECTOR (127 DOWNTO 0) := (OTHERS => '0');
    SIGNAL X_1 : STD_LOGIC_VECTOR (15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL X_2 : STD_LOGIC_VECTOR (15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL X_3 : STD_LOGIC_VECTOR (15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL X_4 : STD_LOGIC_VECTOR (15 DOWNTO 0) := (OTHERS => '0');
    --outputs
    SIGNAL Y_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL Y_2 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL Y_3 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL Y_4 : STD_LOGIC_VECTOR (15 DOWNTO 0);

    SIGNAL READY : STD_LOGIC;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut : idea_rcs2 PORT MAP(
        CLOCK => CLOCK,
        START => START,
        KEY => KEY,
        X_1 => X_1,
        X_2 => X_2,
        X_3 => X_3,
        X_4 => X_4,
        Y_1 => Y_1,
        Y_2 => Y_2,
        Y_3 => Y_3,
        Y_4 => Y_4,
        READY => READY
    );

    CLK_proc : PROCESS
    BEGIN
        CLOCK <= NOT CLOCK;
        WAIT FOR 5 ns;
    END PROCESS; -- CLK_proc

    -- Stimulus process
    stim_proc : PROCESS
    BEGIN
        WAIT FOR 100 ns;
        -- insert stimulus here 
        X_1 <= x"1111";
        X_2 <= x"2222";
        X_3 <= x"4444";
        X_4 <= x"8888";
        KEY <= x"00010002000300040005000600070008";
        WAIT FOR 10 ns;
        START <= '1';
        WAIT FOR 20 ns;
        START <= '0';
        WAIT FOR 1000 ns;
        X_1 <= x"0000";
        X_2 <= x"0000";
        X_3 <= x"0000";
        X_4 <= x"0000";
        KEY <= x"00000000000000000000000000000000";
        WAIT FOR 10 ns;
        START <= '1';
        WAIT FOR 20 ns;
        START <= '0';
        WAIT FOR 1000 ns;
        X_1 <= x"1234";
        X_2 <= x"DFEA";
        X_3 <= x"3245";
        X_4 <= x"A675";
        KEY <= x"8032746083787A34EFDFBEDFAF0793A8";
        -- 57E6 28EF A6E8 9578
        WAIT FOR 10 ns;
        START <= '1';
        WAIT FOR 20 ns;
        START <= '0';
        WAIT FOR 1000 ns;
        ASSERT false REPORT "reached the end of the test";
        WAIT FOR 1000 ns;
        WAIT;

    END PROCESS;

END;