LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_roundcounter IS
END tb_roundcounter;

ARCHITECTURE behav OF tb_roundcounter IS
    --component declaration
    COMPONENT roundcounter
        PORT (
            CLK : IN STD_LOGIC;
            START : IN STD_LOGIC;
            RESULT : IN STD_LOGIC;
            READY : OUT STD_LOGIC;
            S_i : OUT STD_LOGIC;
            INIT : OUT STD_LOGIC;
            TRAFO : OUT STD_LOGIC;
            ROUND : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
    END COMPONENT;

    --input signals
    SIGNAL CLK : STD_LOGIC := '0';
    SIGNAL START : STD_LOGIC := '0';
    SIGNAL RESULT : STD_LOGIC := '0';

    --output signals
    SIGNAL READY : STD_LOGIC;
    SIGNAL S_i : STD_LOGIC;
    SIGNAL INIT : STD_LOGIC;
    SIGNAL TRAFO : STD_LOGIC;

    SIGNAL ROUND : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN
    --instantiation of mulop
    uut : roundcounter PORT MAP
    (
        CLK => CLK,
        START => START,
        RESULT => RESULT,
        READY => READY,
        S_i => S_i,
        INIT => INIT,
        TRAFO => TRAFO,
        ROUND => ROUND
    );

    CLK_proc : PROCESS
    BEGIN
        CLK <= NOT CLK;
        WAIT FOR 10 ns;
    END PROCESS; -- CLK_proc

    stim_proc : PROCESS
    BEGIN
        WAIT FOR 100 ns;
        START <= '1';
        WAIT FOR 20 ns;
        START <= '0';
        RESULT <= '1';
        WAIT FOR 10 ns;
        RESULT <= '0';
        WAIT FOR 10 ns;
        RESULT <= '1';
        WAIT FOR 10 ns;
        RESULT <= '0';
        WAIT FOR 10 ns;
        RESULT <= '1';
        WAIT FOR 10 ns;
        RESULT <= '0';
        WAIT FOR 10 ns;
        RESULT <= '1';
        WAIT FOR 10 ns;
        RESULT <= '0';
        WAIT FOR 10 ns;
        RESULT <= '1';
        WAIT FOR 10 ns;
        RESULT <= '0';
        WAIT FOR 10 ns;
        RESULT <= '1';
        WAIT FOR 10 ns;
        RESULT <= '0';
        WAIT FOR 10 ns;
        RESULT <= '1';
        WAIT FOR 10 ns;
        RESULT <= '0';
        WAIT FOR 10 ns;
        RESULT <= '1';
        WAIT FOR 10 ns;
        RESULT <= '0';
        WAIT FOR 10 ns;
        RESULT <= '1';
        WAIT FOR 10 ns;
        RESULT <= '0';
        WAIT FOR 10 ns;
        RESULT <= '1';
        WAIT FOR 10 ns;
        RESULT <= '0';
        WAIT FOR 10 ns;
        RESULT <= '1';
        WAIT FOR 10 ns;
        RESULT <= '0';
        WAIT FOR 10 ns;
        START <= '1';
        WAIT FOR 400 ns;
        ASSERT false REPORT "Reached end of test";
        WAIT;
    END PROCESS;
END behav;