LIBRARY ieee;
USE ieee.numeric_std.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY idea_single IS
    PORT (
        CLOCK : IN STD_LOGIC;
        START : IN STD_LOGIC;
        READY : OUT STD_LOGIC;
        KEY : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
        X_1 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        X_2 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        X_3 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        X_4 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        Y_1 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
        Y_2 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
        Y_3 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
        Y_4 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
END idea_single;

ARCHITECTURE Behavioral OF idea_single IS

    --  Component Declaration for ROUND, TRAFO
    --  ROUND
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
            Y_4 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
        );
    END COMPONENT;
    --  TRAFO
    COMPONENT trafo
        PORT (
            X_1 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            X_2 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            X_3 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            X_4 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z_1 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z_2 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z_3 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Z_4 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y_1 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y_2 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y_3 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Y_4 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
        );
    END COMPONENT;
    --KEYGEN
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
    --control
    COMPONENT control
        PORT (
            CLK : IN STD_LOGIC;
            START : IN STD_LOGIC;
            READY : OUT STD_LOGIC;
            S : OUT STD_LOGIC;
            EN : OUT STD_LOGIC;
            ROUND : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;
    --register
    COMPONENT reg16
        PORT (
            CLOCK : IN STD_LOGIC;
            ENABLE : IN STD_LOGIC;
            D : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Q : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
    END COMPONENT;
    --mux
    COMPONENT mux2x1
        PORT (
            D0 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            D1 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            S : IN STD_LOGIC;
            O : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
    END COMPONENT;

    --signals
    --Round inputs
    SIGNAL ROUND_X_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL ROUND_X_2 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL ROUND_X_3 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL ROUND_X_4 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    --Round outputs
    SIGNAL ROUND_Y_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL ROUND_Y_2 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL ROUND_Y_3 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL ROUND_Y_4 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    --Trafo inputs
    SIGNAL TARFO_X_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL TARFO_X_2 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL TARFO_X_3 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL TARFO_X_4 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    --Keys
    SIGNAL KEY_1 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL KEY_2 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL KEY_3 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL KEY_4 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL KEY_5 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL KEY_6 : STD_LOGIC_VECTOR (15 DOWNTO 0);
    --Control
    SIGNAL S : STD_LOGIC;
    SIGNAL EN : STD_LOGIC;
    SIGNAL ROUND : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN
    --Component instantiation
    --Round
    cROUND_1 : round_module PORT MAP(
        X_1 => ROUND_X_1, X_2 => ROUND_X_2,
        X_3 => ROUND_X_3, X_4 => ROUND_X_4,
        Y_1 => ROUND_Y_1, Y_2 => ROUND_Y_2,
        Y_3 => ROUND_Y_3, Y_4 => ROUND_Y_4,
        Z_1 => KEY_1, Z_2 => KEY_2, Z_3 => KEY_3,
        Z_4 => KEY_4, Z_5 => KEY_5, Z_6 => KEY_6);
    --Trafo
    ctrafo_1 : trafo PORT MAP(
        X_1 => TARFO_X_1, X_2 => TARFO_X_2,
        X_3 => TARFO_X_3, X_4 => TARFO_X_4,
        Y_1 => Y_1, Y_2 => Y_2,
        Y_3 => Y_3, Y_4 => Y_4,
        Z_1 => KEY_1, Z_2 => KEY_2, Z_3 => KEY_3,
        Z_4 => KEY_4);
    --Keygen
    cKEYGEN_1 : keygen PORT MAP(
        KEY => KEY, ROUND_C => ROUND,
        Z_1 => KEY_1, Z_2 => KEY_2, Z_3 => KEY_3,
        Z_4 => KEY_4, Z_5 => KEY_5, Z_6 => KEY_6);
    --Control
    cCONTROL_1 : control PORT MAP(
        CLK => CLOCK, START => START, READY => READY,
        S => S, EN => EN, ROUND => ROUND);
    --Registers
    cREG16_1 : reg16 PORT MAP(
        CLOCK => CLOCK, ENABLE => EN, D => ROUND_Y_1,
        Q => TARFO_X_1);

    cREG16_2 : reg16 PORT MAP(
        CLOCK => CLOCK, ENABLE => EN, D => ROUND_Y_2,
        Q => TARFO_X_2);

    cREG16_3 : reg16 PORT MAP(
        CLOCK => CLOCK, ENABLE => EN, D => ROUND_Y_3,
        Q => TARFO_X_3);

    cREG16_4 : reg16 PORT MAP(
        CLOCK => CLOCK, ENABLE => EN, D => ROUND_Y_4,
        Q => TARFO_X_4);
    --Multiplexers
    cMUX2X1_1 : mux2x1 PORT MAP(
        D0 => X_1, D1 => TARFO_X_1, S => S,
        O => ROUND_X_1);

    cMUX2X1_2 : mux2x1 PORT MAP(
        D0 => X_2, D1 => TARFO_X_2, S => S,
        O => ROUND_X_2);

    cMUX2X1_3 : mux2x1 PORT MAP(
        D0 => X_3, D1 => TARFO_X_3, S => S,
        O => ROUND_X_3);

    cMUX2X1_4 : mux2x1 PORT MAP(
        D0 => X_4, D1 => TARFO_X_4, S => S,
        O => ROUND_X_4);

END Behavioral;