LIBRARY ieee;
USE ieee.numeric_std.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY datapath IS
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

END datapath;

ARCHITECTURE Structural OF datapath IS

    --  Component Declaration
    --Mux
    COMPONENT mux4x1
        PORT (
            D0 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            D1 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            D2 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            D3 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            S : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
            O : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
        );
    END COMPONENT;
    --Mul
    COMPONENT mulop
        PORT (
            I_1 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            I_2 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            O_1 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
        );
    END COMPONENT;
    --Add
    COMPONENT addop
        PORT (
            I_1 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            I_2 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            O_1 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
        );
    END COMPONENT;
    --XOR
    COMPONENT xorop
        PORT (
            I_1 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            I_2 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            O_1 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
        );
    END COMPONENT;
    --reg
    COMPONENT reg16
        PORT (
            CLOCK : IN STD_LOGIC;
            ENABLE : IN STD_LOGIC;
            D : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Q : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
        );
    END COMPONENT;

    --signals
    --MUL
    SIGNAL MUL_I_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL MUL_I_2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL MUL_O : STD_LOGIC_VECTOR(15 DOWNTO 0);
    --ADD
    SIGNAL ADD_I_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL ADD_I_2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL ADD_O : STD_LOGIC_VECTOR(15 DOWNTO 0);
    --XOR
    SIGNAL XOR_1_O : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL XOR_2_I : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL XOR_3_I : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL XOR_4_I : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL XOR_5_I : STD_LOGIC_VECTOR(15 DOWNTO 0);
    --MUX
    SIGNAL MUX_2_D2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL MUX_2_D3 : STD_LOGIC_VECTOR(15 DOWNTO 0);

    SIGNAL MUX_3_D2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL MUX_3_D3 : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
    --Module instantiation
    cMUL_1 : mulop PORT MAP(I_1 => MUL_I_1, I_2 => MUL_I_2, O_1 => MUL_O);

    cADD_1 : addop PORT MAP(I_1 => ADD_I_1, I_2 => ADD_I_2, O_1 => ADD_O);

    cMux_1 : mux4x1 PORT MAP(D0 => X_1, D1 => X_4, D2 => Z_5, D3 => Z_6, S => S, O => MUL_I_1);
    cMux_2 : mux4x1 PORT MAP(D0 => Z_1, D1 => Z_4, D2 => MUX_2_D2, D3 => MUX_2_D3, S => S, O => MUL_I_2);
    cMux_3 : mux4x1 PORT MAP(D0 => X_3, D1 => X_2, D2 => MUX_3_D2, D3 => MUX_3_D3, S => S, O => ADD_I_1);
    cMux_4 : mux4x1 PORT MAP(D0 => Z_3, D1 => Z_2, D2 => MUL_O, D3 => MUL_O, S => S_T, O => ADD_I_2);

    cXOR_1 : xorop PORT MAP(I_1 => MUL_O, I_2 => ADD_O, O_1 => XOR_1_O);
    cXOR_2 : xorop PORT MAP(I_1 => XOR_2_I, I_2 => ADD_O, O_1 => Y_3);
    cXOR_3 : xorop PORT MAP(I_1 => XOR_3_I, I_2 => MUL_O, O_1 => Y_2);
    cXOR_4 : xorop PORT MAP(I_1 => XOR_4_I, I_2 => ADD_O, O_1 => Y_4);
    cXOR_5 : xorop PORT MAP(I_1 => XOR_5_I, I_2 => MUL_O, O_1 => Y_1);

    cREG_1 : reg16 PORT MAP(CLOCK => CLK, ENABLE => EN125, D => MUL_O, Q => XOR_5_I);
    cREG_2 : reg16 PORT MAP(CLOCK => CLK, ENABLE => EN125, D => ADD_O, Q => XOR_3_I);
    cREG_3 : reg16 PORT MAP(CLOCK => CLK, ENABLE => EN346, D => ADD_O, Q => XOR_2_I);
    cREG_4 : reg16 PORT MAP(CLOCK => CLK, ENABLE => EN346, D => MUL_O, Q => XOR_4_I);
    cREG_5 : reg16 PORT MAP(CLOCK => CLK, ENABLE => EN125, D => XOR_1_O, Q => MUX_2_D2);
    cREG_6 : reg16 PORT MAP(CLOCK => CLK, ENABLE => EN346, D => XOR_1_O, Q => MUX_3_D2);
    cREG_7 : reg16 PORT MAP(CLOCK => CLK, ENABLE => EN78, D => MUL_O, Q => MUX_3_D3);
    cREG_8 : reg16 PORT MAP(CLOCK => CLK, ENABLE => EN78, D => ADD_O, Q => MUX_2_D3);
    --signal assignment for the TRAFO outputs
    Y1_TRAFO <= XOR_5_I;
    Y2_TRAFO <= XOR_3_I;
    Y3_TRAFO <= XOR_2_I;
    Y4_TRAFO <= XOR_4_I;
END Structural;