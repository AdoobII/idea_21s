LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_control IS
END tb_control;

ARCHITECTURE behav OF tb_control IS
    --component declaration
    COMPONENT control
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
    END COMPONENT;

    --input signals
    SIGNAL INIT : STD_LOGIC := '0';
    SIGNAL CLK : STD_LOGIC := '0';
    SIGNAL TRAFO : STD_LOGIC := '0';

    --output signals
    SIGNAL EN125 : STD_LOGIC;
    SIGNAL EN346 : STD_LOGIC;
    SIGNAL EN78 : STD_LOGIC;
    SIGNAL RESULT : STD_LOGIC;

    SIGNAL S : STD_LOGIC_VECTOR (1 DOWNTO 0);
    SIGNAL S_T : STD_LOGIC_VECTOR (1 DOWNTO 0);

BEGIN
    --instantiation of mulop
    uut : control PORT MAP
    (
        INIT => INIT,
        CLK => CLK,
        TRAFO => TRAFO,
        EN125 => EN125,
        EN346 => EN346,
        EN78 => EN78,
        RESULT => RESULT,
        S_T => S_T,
        S => S
    );

    CLK_proc : PROCESS
    BEGIN
        CLK <= NOT CLK;
        WAIT FOR 10 ns;
    END PROCESS; -- CLK_proc

    stim_proc : PROCESS
    BEGIN
        WAIT FOR 100 ns;
        INIT <= '1';
        WAIT FOR 5 ns;
        INIT <= '0';
        WAIT FOR 400 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 50 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 400 ns;
        TRAFO <= '1';
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 400 ns;
        ASSERT false REPORT "Reached end of test";
        WAIT;
    END PROCESS;
END behav;