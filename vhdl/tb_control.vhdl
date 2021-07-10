LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_control IS
END tb_control;

ARCHITECTURE behav OF tb_control IS
    --component declaration
    COMPONENT control
        PORT (
            CLK : IN STD_LOGIC;
            START : IN STD_LOGIC;
            READY : OUT STD_LOGIC;
            S : OUT STD_LOGIC;
            EN : OUT STD_LOGIC;
            ROUND : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    --input signals
    SIGNAL START : STD_LOGIC := '0';
    SIGNAL CLK : STD_LOGIC := '0';

    --output signal
    SIGNAL READY : STD_LOGIC;
    SIGNAL S : STD_LOGIC;
    SIGNAL EN : STD_LOGIC;
    SIGNAL ROUND : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN
    --instantiation of mulop
    uut : control PORT MAP
    (
        START => START,
        CLK => CLK,
        READY => READY,
        S => S,
        EN => EN,
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
        start <= '1';
        WAIT FOR 20 ns;
        start <= '0';
        WAIT FOR 300 ns;
        start <= '1';
        WAIT FOR 100 ns;
        start <= '0';
        WAIT FOR 100 ns;
        start <= '1';
        WAIT FOR 5 ns;
        start <= '0';
        WAIT FOR 100 ns;
        ASSERT false REPORT "Reached end of test";
        WAIT;
    END PROCESS;
END behav;