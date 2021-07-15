LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_clockedround IS
END tb_clockedround;

ARCHITECTURE behav OF tb_clockedround IS
    --component declaration
    COMPONENT clockedround
        PORT (
            CLK : IN STD_LOGIC;
            INIT : IN STD_LOGIC;
            TRAFO : IN STD_LOGIC;
            X1 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            X2 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            X3 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            X4 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z1 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z2 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z3 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z4 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z5 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z6 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y1 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y2 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y3 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y4 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            RESULT : OUT STD_LOGIC;
            Y1_TRAFO : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y2_TRAFO : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y3_TRAFO : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y4_TRAFO : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
    END COMPONENT;

    --input signals
    SIGNAL CLK : STD_LOGIC := '0';
    SIGNAL INIT : STD_LOGIC := '0';
    SIGNAL TRAFO : STD_LOGIC := '0';
    SIGNAL X1 : STD_LOGIC_VECTOR (15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL X2 : STD_LOGIC_VECTOR (15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL X3 : STD_LOGIC_VECTOR (15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL X4 : STD_LOGIC_VECTOR (15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL Z1 : STD_LOGIC_VECTOR (15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL Z2 : STD_LOGIC_VECTOR (15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL Z3 : STD_LOGIC_VECTOR (15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL Z4 : STD_LOGIC_VECTOR (15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL Z5 : STD_LOGIC_VECTOR (15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL Z6 : STD_LOGIC_VECTOR (15 DOWNTO 0) := (OTHERS => '0');
    --outputs
    SIGNAL Y1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL Y2 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL Y3 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL Y4 : STD_LOGIC_VECTOR (15 DOWNTO 0);

    SIGNAL Y1_TRAFO : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL Y2_TRAFO : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL Y3_TRAFO : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL Y4_TRAFO : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL RESULT : STD_LOGIC;

BEGIN
    --instantiation of mulop
    uut : clockedround PORT MAP
    (
        CLK => CLK,
        INIT => INIT,
        TRAFO => TRAFO,
        X1 => X1,
        X2 => X2,
        X3 => X3,
        X4 => X4,
        Z1 => Z1,
        Z2 => Z2,
        Z3 => Z3,
        Z4 => Z4,
        Z5 => Z5,
        Z6 => Z6,
        Y1 => Y1,
        Y2 => Y2,
        Y3 => Y3,
        Y4 => Y4,
        Y1_TRAFO => Y1_TRAFO,
        Y2_TRAFO => Y2_TRAFO,
        Y3_TRAFO => Y3_TRAFO,
        Y4_TRAFO => Y4_TRAFO,
        RESULT => RESULT
    );

    CLK_proc : PROCESS
    BEGIN
        CLK <= NOT CLK;
        WAIT FOR 5 ns;
    END PROCESS; -- CLK_proc

    stim_proc : PROCESS
    BEGIN
        WAIT FOR 100 ns;
        -- round test 
        X1 <= x"0000";
        X2 <= x"0000";
        X3 <= x"0000";
        X4 <= x"0000";
        Z1 <= x"0000";
        Z2 <= x"0000";
        Z3 <= x"0000";
        Z4 <= x"0000";
        Z5 <= x"0000";
        Z6 <= x"0000";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 100 ns;
        X1 <= x"ffff";
        X2 <= x"0000";
        X3 <= x"0000";
        X4 <= x"0000";
        Z1 <= x"0000";
        Z2 <= x"0000";
        Z3 <= x"0000";
        Z4 <= x"0000";
        Z5 <= x"0000";
        Z6 <= x"0000";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 100 ns;
        X1 <= x"ffff";
        X2 <= x"aaaa";
        X3 <= x"0000";
        X4 <= x"0000";
        Z1 <= x"0000";
        Z2 <= x"0000";
        Z3 <= x"0000";
        Z4 <= x"0000";
        Z5 <= x"0000";
        Z6 <= x"0000";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 100 ns;
        X1 <= x"ffff";
        X2 <= x"aaaa";
        X3 <= x"5555";
        X4 <= x"0000";
        Z1 <= x"0000";
        Z2 <= x"0000";
        Z3 <= x"0000";
        Z4 <= x"0000";
        Z5 <= x"0000";
        Z6 <= x"0000";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 100 ns;
        X1 <= x"ffff";
        X2 <= x"aaaa";
        X3 <= x"5555";
        X4 <= x"2492";
        Z1 <= x"0000";
        Z2 <= x"0000";
        Z3 <= x"0000";
        Z4 <= x"0000";
        Z5 <= x"0000";
        Z6 <= x"0000";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 100 ns;
        X1 <= x"ffff";
        X2 <= x"aaaa";
        X3 <= x"5555";
        X4 <= x"2492";
        Z1 <= x"db6d";
        Z2 <= x"0000";
        Z3 <= x"0000";
        Z4 <= x"0000";
        Z5 <= x"0000";
        Z6 <= x"0000";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 100 ns;
        X1 <= x"ffff";
        X2 <= x"aaaa";
        X3 <= x"5555";
        X4 <= x"2492";
        Z1 <= x"db6d";
        Z2 <= x"1c71";
        Z3 <= x"0000";
        Z4 <= x"0000";
        Z5 <= x"0000";
        Z6 <= x"0000";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 100 ns;
        X1 <= x"ffff";
        X2 <= x"aaaa";
        X3 <= x"5555";
        X4 <= x"2492";
        Z1 <= x"db6d";
        Z2 <= x"1c71";
        Z3 <= x"cccc";
        Z4 <= x"0000";
        Z5 <= x"0000";
        Z6 <= x"0000";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 100 ns;
        X1 <= x"ffff";
        X2 <= x"aaaa";
        X3 <= x"5555";
        X4 <= x"2492";
        Z1 <= x"db6d";
        Z2 <= x"1c71";
        Z3 <= x"cccc";
        Z4 <= x"0002";
        Z5 <= x"0000";
        Z6 <= x"0000";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 100 ns;
        X1 <= x"ffff";
        X2 <= x"aaaa";
        X3 <= x"5555";
        X4 <= x"2492";
        Z1 <= x"db6d";
        Z2 <= x"1c71";
        Z3 <= x"cccc";
        Z4 <= x"0002";
        Z5 <= x"eeee";
        Z6 <= x"0000";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 100 ns;
        X1 <= x"ffff";
        X2 <= x"aaaa";
        X3 <= x"5555";
        X4 <= x"2492";
        Z1 <= x"db6d";
        Z2 <= x"1c71";
        Z3 <= x"cccc";
        Z4 <= x"0002";
        Z5 <= x"eeee";
        Z6 <= x"8888";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 400 ns;
        -- TRAFO test
        TRAFO <= '1';
        X1 <= x"0000";
        X2 <= x"0000";
        X3 <= x"0000";
        X4 <= x"0000";
        Z1 <= x"0000";
        Z2 <= x"0000";
        Z3 <= x"0000";
        Z4 <= x"0000";
        Z5 <= x"0000";
        Z6 <= x"0000";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 100 ns;
        X1 <= x"ffff";
        X2 <= x"0000";
        X3 <= x"0000";
        X4 <= x"0000";
        Z1 <= x"0000";
        Z2 <= x"0000";
        Z3 <= x"0000";
        Z4 <= x"0000";
        Z5 <= x"0000";
        Z6 <= x"0000";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 100 ns;
        X1 <= x"ffff";
        X2 <= x"aaaa";
        X3 <= x"0000";
        X4 <= x"0000";
        Z1 <= x"0000";
        Z2 <= x"0000";
        Z3 <= x"0000";
        Z4 <= x"0000";
        Z5 <= x"0000";
        Z6 <= x"0000";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 100 ns;
        X1 <= x"ffff";
        X2 <= x"aaaa";
        X3 <= x"5555";
        X4 <= x"0000";
        Z1 <= x"0000";
        Z2 <= x"0000";
        Z3 <= x"0000";
        Z4 <= x"0000";
        Z5 <= x"0000";
        Z6 <= x"0000";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 100 ns;
        X1 <= x"ffff";
        X2 <= x"aaaa";
        X3 <= x"5555";
        X4 <= x"2492";
        Z1 <= x"0000";
        Z2 <= x"0000";
        Z3 <= x"0000";
        Z4 <= x"0000";
        Z5 <= x"0000";
        Z6 <= x"0000";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 100 ns;
        X1 <= x"ffff";
        X2 <= x"aaaa";
        X3 <= x"5555";
        X4 <= x"2492";
        Z1 <= x"db6d";
        Z2 <= x"0000";
        Z3 <= x"0000";
        Z4 <= x"0000";
        Z5 <= x"0000";
        Z6 <= x"0000";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 100 ns;
        X1 <= x"ffff";
        X2 <= x"aaaa";
        X3 <= x"5555";
        X4 <= x"2492";
        Z1 <= x"db6d";
        Z2 <= x"1c71";
        Z3 <= x"0000";
        Z4 <= x"0000";
        Z5 <= x"0000";
        Z6 <= x"0000";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 100 ns;
        X1 <= x"ffff";
        X2 <= x"aaaa";
        X3 <= x"5555";
        X4 <= x"2492";
        Z1 <= x"db6d";
        Z2 <= x"1c71";
        Z3 <= x"cccc";
        Z4 <= x"0000";
        Z5 <= x"0000";
        Z6 <= x"0000";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 100 ns;
        X1 <= x"ffff";
        X2 <= x"aaaa";
        X3 <= x"5555";
        X4 <= x"2492";
        Z1 <= x"db6d";
        Z2 <= x"1c71";
        Z3 <= x"cccc";
        Z4 <= x"0002";
        Z5 <= x"0000";
        Z6 <= x"0000";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 100 ns;
        X1 <= x"ffff";
        X2 <= x"aaaa";
        X3 <= x"5555";
        X4 <= x"2492";
        Z1 <= x"db6d";
        Z2 <= x"1c71";
        Z3 <= x"cccc";
        Z4 <= x"0002";
        Z5 <= x"eeee";
        Z6 <= x"0000";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 100 ns;
        X1 <= x"ffff";
        X2 <= x"aaaa";
        X3 <= x"5555";
        X4 <= x"2492";
        Z1 <= x"db6d";
        Z2 <= x"1c71";
        Z3 <= x"cccc";
        Z4 <= x"0002";
        Z5 <= x"eeee";
        Z6 <= x"8888";
        WAIT FOR 10 ns;
        INIT <= '1';
        WAIT FOR 20 ns;
        INIT <= '0';
        WAIT FOR 400 ns;
        ASSERT false REPORT "Reached end of test";
        WAIT;
    END PROCESS;
END behav;