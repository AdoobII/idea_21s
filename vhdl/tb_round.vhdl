LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_round_module IS
END tb_round_module;

ARCHITECTURE behavior OF tb_round_module IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT round_module
        PORT (
            X_1 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            X_2 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            X_3 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            X_4 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z_1 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z_2 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z_3 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z_4 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z_5 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z_6 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y_1 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y_2 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y_3 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y_4 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
    END COMPONENT;
    --Inputs
    SIGNAL X_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL X_2 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL X_3 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL X_4 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL Z_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL Z_2 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL Z_3 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL Z_4 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL Z_5 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL Z_6 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    --outputs
    SIGNAL Y_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL Y_2 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL Y_3 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL Y_4 : STD_LOGIC_VECTOR (15 DOWNTO 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut : round_module PORT MAP(
        X_1 => X_1,
        X_2 => X_2,
        X_3 => X_3,
        X_4 => X_4,
        Z_1 => Z_1,
        Z_2 => Z_2,
        Z_3 => Z_3,
        Z_4 => Z_4,
        Z_5 => Z_5,
        Z_6 => Z_6,
        Y_1 => Y_1,
        Y_2 => Y_2,
        Y_3 => Y_3,
        Y_4 => Y_4
    );

    -- Stimulus process
    stim_proc : PROCESS
    BEGIN
        WAIT FOR 100 ns;
        -- insert stimulus here 
        X_1 <= x"0000";
        X_2 <= x"0000";
        X_3 <= x"0000";
        X_4 <= x"0000";
        Z_1 <= x"0000";
        Z_2 <= x"0000";
        Z_3 <= x"0000";
        Z_4 <= x"0000";
        Z_5 <= x"0000";
        Z_6 <= x"0000";
        WAIT FOR 100 ns;
        X_1 <= x"ffff";
        X_2 <= x"0000";
        X_3 <= x"0000";
        X_4 <= x"0000";
        Z_1 <= x"0000";
        Z_2 <= x"0000";
        Z_3 <= x"0000";
        Z_4 <= x"0000";
        Z_5 <= x"0000";
        Z_6 <= x"0000";
        WAIT FOR 100 ns;
        X_1 <= x"ffff";
        X_2 <= x"aaaa";
        X_3 <= x"0000";
        X_4 <= x"0000";
        Z_1 <= x"0000";
        Z_2 <= x"0000";
        Z_3 <= x"0000";
        Z_4 <= x"0000";
        Z_5 <= x"0000";
        Z_6 <= x"0000";
        WAIT FOR 100 ns;
        X_1 <= x"ffff";
        X_2 <= x"aaaa";
        X_3 <= x"5555";
        X_4 <= x"0000";
        Z_1 <= x"0000";
        Z_2 <= x"0000";
        Z_3 <= x"0000";
        Z_4 <= x"0000";
        Z_5 <= x"0000";
        Z_6 <= x"0000";
        WAIT FOR 100 ns;
        X_1 <= x"ffff";
        X_2 <= x"aaaa";
        X_3 <= x"5555";
        X_4 <= x"2492";
        Z_1 <= x"0000";
        Z_2 <= x"0000";
        Z_3 <= x"0000";
        Z_4 <= x"0000";
        Z_5 <= x"0000";
        Z_6 <= x"0000";
        WAIT FOR 100 ns;
        X_1 <= x"ffff";
        X_2 <= x"aaaa";
        X_3 <= x"5555";
        X_4 <= x"2492";
        Z_1 <= x"db6d";
        Z_2 <= x"0000";
        Z_3 <= x"0000";
        Z_4 <= x"0000";
        Z_5 <= x"0000";
        Z_6 <= x"0000";
        WAIT FOR 100 ns;
        X_1 <= x"ffff";
        X_2 <= x"aaaa";
        X_3 <= x"5555";
        X_4 <= x"2492";
        Z_1 <= x"db6d";
        Z_2 <= x"1c71";
        Z_3 <= x"0000";
        Z_4 <= x"0000";
        Z_5 <= x"0000";
        Z_6 <= x"0000";
        WAIT FOR 100 ns;
        X_1 <= x"ffff";
        X_2 <= x"aaaa";
        X_3 <= x"5555";
        X_4 <= x"2492";
        Z_1 <= x"db6d";
        Z_2 <= x"1c71";
        Z_3 <= x"cccc";
        Z_4 <= x"0000";
        Z_5 <= x"0000";
        Z_6 <= x"0000";
        WAIT FOR 100 ns;
        X_1 <= x"ffff";
        X_2 <= x"aaaa";
        X_3 <= x"5555";
        X_4 <= x"2492";
        Z_1 <= x"db6d";
        Z_2 <= x"1c71";
        Z_3 <= x"cccc";
        Z_4 <= x"0002";
        Z_5 <= x"0000";
        Z_6 <= x"0000";
        WAIT FOR 100 ns;
        X_1 <= x"ffff";
        X_2 <= x"aaaa";
        X_3 <= x"5555";
        X_4 <= x"2492";
        Z_1 <= x"db6d";
        Z_2 <= x"1c71";
        Z_3 <= x"cccc";
        Z_4 <= x"0002";
        Z_5 <= x"eeee";
        Z_6 <= x"0000";
        WAIT FOR 100 ns;
        X_1 <= x"ffff";
        X_2 <= x"aaaa";
        X_3 <= x"5555";
        X_4 <= x"2492";
        Z_1 <= x"db6d";
        Z_2 <= x"1c71";
        Z_3 <= x"cccc";
        Z_4 <= x"0002";
        Z_5 <= x"eeee";
        Z_6 <= x"8888";
        WAIT FOR 100 ns;
        ASSERT false REPORT "reached the end of the test";
        WAIT FOR 100 ns;
        WAIT;

    END PROCESS;

END;