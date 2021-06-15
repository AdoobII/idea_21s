library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity round is
    port (  X_1 : in STD_LOGIC_VECTOR (15 downto 0);
            X_2 : in STD_LOGIC_VECTOR (15 downto 0);
            X_3 : in STD_LOGIC_VECTOR (15 downto 0);
            X_4 : in STD_LOGIC_VECTOR (15 downto 0);
            Z_1 : in STD_LOGIC_VECTOR (15 downto 0);
            Z_2 : in STD_LOGIC_VECTOR (15 downto 0);
            Z_3 : in STD_LOGIC_VECTOR (15 downto 0);
            Z_4 : in STD_LOGIC_VECTOR (15 downto 0);
            Z_5 : in STD_LOGIC_VECTOR (15 downto 0);
            Z_6 : in STD_LOGIC_VECTOR (15 downto 0);
            Y_1 : out STD_LOGIC_VECTOR (15 downto 0);
            Y_2 : out STD_LOGIC_VECTOR (15 downto 0);
            Y_3 : out STD_LOGIC_VECTOR (15 downto 0);
            Y_4 : out STD_LOGIC_VECTOR (15 downto 0));
end round;

architecture Behavioral of round is

    --  Component Declaration for XOR, ADD, MUL
    --  XOR
    COMPONENT xorop
    PORT(
         I_1 : IN  STD_LOGIC_VECTOR(15 downto 0);
         I_2 : IN  STD_LOGIC_VECTOR(15 downto 0);
         O_1 : OUT  STD_LOGIC_VECTOR(15 downto 0)
        );
    END COMPONENT;
    --  ADD
    COMPONENT addop
    PORT(
         I_1 : IN  STD_LOGIC_VECTOR(15 downto 0);
         I_2 : IN  STD_LOGIC_VECTOR(15 downto 0);
         O_1 : OUT  STD_LOGIC_VECTOR(15 downto 0)
        );
    END COMPONENT;
    -- MUL
    COMPONENT mulop
    PORT(
         I_1 : IN  STD_LOGIC_VECTOR(15 downto 0);
         I_2 : IN  STD_LOGIC_VECTOR(15 downto 0);
         O_1 : OUT  STD_LOGIC_VECTOR(15 downto 0)
        );
    END COMPONENT;

    --signals
    --MUL
    signal MUL_1 : STD_LOGIC_VECTOR(15 downto 0);
    signal MUL_2 : STD_LOGIC_VECTOR(15 downto 0);
    signal MUL_3 : STD_LOGIC_VECTOR(15 downto 0);
    signal MUL_4 : STD_LOGIC_VECTOR(15 downto 0);
    --ADD
    signal ADD_1 : STD_LOGIC_VECTOR(15 downto 0);
    signal ADD_2 : STD_LOGIC_VECTOR(15 downto 0);
    signal ADD_3 : STD_LOGIC_VECTOR(15 downto 0);
    signal ADD_4 : STD_LOGIC_VECTOR(15 downto 0);
    --XOR
    signal XOR_1 : STD_LOGIC_VECTOR(15 downto 0);
    signal XOR_2 : STD_LOGIC_VECTOR(15 downto 0);
    begin
        --Instantiate MUL modules
        cMUL_1: mulop port map (I_1 => X_1, I_2 => Z_1, O_1 => MUL_1);
        cMUL_2: mulop port map (I_1 => X_4, I_2 => Z_4, O_1 => MUL_2);
        cMUL_3: mulop port map (I_1 => XOR_1, I_2 => Z_5, O_1 => MUL_3);
        cMUL_4: mulop port map (I_1 => ADD_3, I_2 => Z_6, O_1 => MUL_4);
        --Instantiate ADD modules
        cADD_1: addop port map (I_1 => X_2, I_2 => Z_2, O_1 => ADD_1);
        cADD_2: addop port map (I_1 => MUL_3, I_2 => MUL_4, O_1 => ADD_2);
        cADD_3: addop port map (I_1 => MUL_3, I_2 => XOR_2, O_1 => ADD_3);
        cADD_4: addop port map (I_1 => X_3, I_2 => Z_3, O_1 => ADD_4);
        --Instantiate XOR modules
        cXOR_1: xorop port map (I_1 => MUL_1, I_2 => ADD_4, O_1 => XOR_1);
        cXOR_2: xorop port map (I_1 => ADD_1, I_2 => MUL_2, O_1 => XOR_2);
        cXOR_3: xorop port map (I_1 => MUL_1, I_2 => MUL_4, O_1 => Y_1);
        cXOR_4: xorop port map (I_1 => MUL_4, I_2 => ADD_4, O_1 => Y_2);
        cXOR_5: xorop port map (I_1 => ADD_2, I_2 => ADD_1, O_1 => Y_3);
        cXOR_6: xorop port map (I_1 => MUL_2, I_2 => ADD_2, O_1 => Y_4);

end Behavioral;