LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY clockedround IS
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
END clockedround;

ARCHITECTURE Structural OF clockedround IS
    --component declaration
    --datapath
    COMPONENT datapath
        PORT (
            CLK : IN STD_LOGIC;
            EN125 : IN STD_LOGIC;
            EN346 : IN STD_LOGIC;
            EN78 : IN STD_LOGIC;

            S : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            S_T : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

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
            --Xor outputs
            Y_1 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y_2 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y_3 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y_4 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            --Trafo outputs
            Y1_TRAFO : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y2_TRAFO : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y3_TRAFO : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y4_TRAFO : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
    END COMPONENT;
    --controller
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

    --signals
    SIGNAL EN125 : STD_LOGIC;
    SIGNAL EN346 : STD_LOGIC;
    SIGNAL EN78 : STD_LOGIC;
    SIGNAL S : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL S_T : STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN
    cDATAPATH_1 : datapath PORT MAP(
        CLK => CLK, EN125 => EN125, EN346 => EN346, EN78 => EN78, S => S,
        S_T => S_T, X_1 => X1, X_2 => X2, X_3 => X3, X_4 => X4, Z_1 => Z1,
        Z_2 => Z2, Z_3 => Z3, Z_4 => Z4, Z_5 => Z5, Z_6 => Z6, Y_1 => Y1,
        Y_2 => Y2, Y_3 => Y3, Y_4 => Y4, Y1_TRAFO => Y1_TRAFO,
        Y2_TRAFO => Y2_TRAFO, Y3_TRAFO => Y3_TRAFO, Y4_TRAFO => Y4_TRAFO);
    cCONTROLLER_1 : control PORT MAP(
        CLK => CLK, INIT => INIT, TRAFO => TRAFO,
        EN125 => EN125, EN346 => EN346, EN78 => EN78, RESULT => RESULT, S => S, S_T => S_T);
END Structural;