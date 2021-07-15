LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY idea_rcs2 IS
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
END idea_rcs2;

ARCHITECTURE Structural OF idea_rcs2 IS
    --component declaration
    --clockedround
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
    --keygen
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
    --roundcounter
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
    --mux2x1
    COMPONENT mux2x1
        PORT (
            D0 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            D1 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            S : IN STD_LOGIC;
            O : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
    END COMPONENT;
    --REG
    COMPONENT reg16
        PORT (
            CLOCK : IN STD_LOGIC;
            ENABLE : IN STD_LOGIC;
            D : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Q : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
    END COMPONENT;

    --interconnect signals
    --clocked round signals
    SIGNAL sX_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sX_2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sX_3 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sX_4 : STD_LOGIC_VECTOR(15 DOWNTO 0);

    SIGNAL sY1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL sY2 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL sY3 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL sY4 : STD_LOGIC_VECTOR (15 DOWNTO 0);

    SIGNAL sINIT : STD_LOGIC;
    SIGNAL sTRAFO : STD_LOGIC;
    SIGNAL sRESULT : STD_LOGIC;

    SIGNAL sZ_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sZ_2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sZ_3 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sZ_4 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sZ_5 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sZ_6 : STD_LOGIC_VECTOR(15 DOWNTO 0);

    --round counter
    SIGNAL sS_i : STD_LOGIC;
    SIGNAL sROUND : STD_LOGIC_VECTOR(3 DOWNTO 0);

    --mux
    SIGNAL sD0_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sD0_2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sD0_3 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sD0_4 : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
    --instantiate modules
    cCLOCKEDROUND_1 : clockedround PORT MAP(
        CLK => CLOCK, INIT => sINIT, TRAFO => sTRAFO, X1 => sX_1, X2 => sX_2,
        X3 => sX_3, X4 => sX_4, Z1 => sZ_1, Z2 => sZ_2, Z3 => sZ_3, Z4 => sZ_4,
        Z5 => sZ_5, Z6 => sZ_6, Y1 => sY1, Y2 => sY2, Y3 => sY3, Y4 => sY4,
        RESULT => sRESULT, Y1_TRAFO => Y_1, Y2_TRAFO => Y_2, Y3_TRAFO => Y_3,
        Y4_TRAFO => Y_4);

    cKEYGEN_1 : keygen PORT MAP(
        KEY => KEY, ROUND_C => sROUND, Z_1 => sZ_1,
        Z_2 => sZ_2, Z_3 => sZ_3, Z_4 => sZ_4, Z_5 => sZ_5, Z_6 => sZ_6);

    cROUNDCOUNTER_1 : roundcounter PORT MAP(
        CLK => CLOCK, START => START,
        RESULT => sRESULT, READY => READY, S_i => sS_i, INIT => sINIT,
        TRAFO => sTRAFO, ROUND => sROUND);

    cMUX2x1_1 : mux2x1 PORT MAP(D0 => sD0_1, D1 => X_1, S => sS_i, O => sX_1);
    cMUX2x1_2 : mux2x1 PORT MAP(D0 => sD0_2, D1 => X_2, S => sS_i, O => sX_2);
    cMUX2x1_3 : mux2x1 PORT MAP(D0 => sD0_3, D1 => X_3, S => sS_i, O => sX_3);
    cMUX2x1_4 : mux2x1 PORT MAP(D0 => sD0_4, D1 => X_4, S => sS_i, O => sX_4);

    cREG16_1 : reg16 PORT MAP(CLOCK => CLOCK, ENABLE => sRESULT, D => sY1, Q => sD0_1);
    cREG16_2 : reg16 PORT MAP(CLOCK => CLOCK, ENABLE => sRESULT, D => sY2, Q => sD0_2);
    cREG16_3 : reg16 PORT MAP(CLOCK => CLOCK, ENABLE => sRESULT, D => sY3, Q => sD0_3);
    cREG16_4 : reg16 PORT MAP(CLOCK => CLOCK, ENABLE => sRESULT, D => sY4, Q => sD0_4);

END Structural;