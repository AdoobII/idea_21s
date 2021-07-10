LIBRARY ieee;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_1164.ALL;

ENTITY round_module IS
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
END round_module;

ARCHITECTURE Behavioral OF round_module IS

    --  Component Declaration for XOR, ADD, MUL
    --  XOR
    COMPONENT xorop
        PORT (
            I_1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            I_2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            O_1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;
    --  ADD
    COMPONENT addop
        PORT (
            I_1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            I_2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            O_1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;
    -- MUL
    COMPONENT mulop
        PORT (
            I_1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            I_2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            O_1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    --signals
    --MUL
    SIGNAL MUL_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL MUL_2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL MUL_3 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL MUL_4 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    --ADD
    SIGNAL ADD_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL ADD_2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL ADD_3 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL ADD_4 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    --XOR
    SIGNAL XOR_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL XOR_2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    --Instantiate MUL modules
    cMUL_1 : mulop PORT MAP(I_1 => X_1, I_2 => Z_1, O_1 => MUL_1);
    cMUL_2 : mulop PORT MAP(I_1 => X_4, I_2 => Z_4, O_1 => MUL_2);
    cMUL_3 : mulop PORT MAP(I_1 => XOR_1, I_2 => Z_5, O_1 => MUL_3);
    cMUL_4 : mulop PORT MAP(I_1 => ADD_3, I_2 => Z_6, O_1 => MUL_4);
    --Instantiate ADD modules
    cADD_1 : addop PORT MAP(I_1 => X_2, I_2 => Z_2, O_1 => ADD_1);
    cADD_2 : addop PORT MAP(I_1 => MUL_3, I_2 => MUL_4, O_1 => ADD_2);
    cADD_3 : addop PORT MAP(I_1 => MUL_3, I_2 => XOR_2, O_1 => ADD_3);
    cADD_4 : addop PORT MAP(I_1 => X_3, I_2 => Z_3, O_1 => ADD_4);
    --Instantiate XOR modules
    cXOR_1 : xorop PORT MAP(I_1 => MUL_1, I_2 => ADD_4, O_1 => XOR_1);
    cXOR_2 : xorop PORT MAP(I_1 => ADD_1, I_2 => MUL_2, O_1 => XOR_2);
    cXOR_3 : xorop PORT MAP(I_1 => MUL_1, I_2 => MUL_4, O_1 => Y_1);
    cXOR_4 : xorop PORT MAP(I_1 => MUL_4, I_2 => ADD_4, O_1 => Y_2);
    cXOR_5 : xorop PORT MAP(I_1 => ADD_2, I_2 => ADD_1, O_1 => Y_3);
    cXOR_6 : xorop PORT MAP(I_1 => MUL_2, I_2 => ADD_2, O_1 => Y_4);

END Behavioral;