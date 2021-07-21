library ieee;
use ieee.numeric_std.all;
USE ieee.std_logic_1164.ALL;


entity trafo is
    port (  X_1 : in STD_LOGIC_VECTOR (15 downto 0);
            X_2 : in STD_LOGIC_VECTOR (15 downto 0);
            X_3 : in STD_LOGIC_VECTOR (15 downto 0);
            X_4 : in STD_LOGIC_VECTOR (15 downto 0);
            Z_1 : in STD_LOGIC_VECTOR (15 downto 0);
            Z_2 : in STD_LOGIC_VECTOR (15 downto 0);
            Z_3 : in STD_LOGIC_VECTOR (15 downto 0);
            Z_4 : in STD_LOGIC_VECTOR (15 downto 0);
            Y_1 : out STD_LOGIC_VECTOR (15 downto 0);
            Y_2 : out STD_LOGIC_VECTOR (15 downto 0);
            Y_3 : out STD_LOGIC_VECTOR (15 downto 0);
            Y_4 : out STD_LOGIC_VECTOR (15 downto 0));
end trafo;

architecture Behavioral of trafo is

    --  Component Declaration for ADD, MUL
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

    begin
        --Instantiate MUL modules
        cMUL_1: mulop port map (I_1 => X_1, I_2 => Z_1, O_1 => Y_1);
        cMUL_2: mulop port map (I_1 => X_4, I_2 => Z_4, O_1 => Y_4);
        --Instantiate ADD modules
        cADD_1: addop port map (I_1 => X_3, I_2 => Z_2, O_1 => Y_2);
        cADD_2: addop port map (I_1 => X_2, I_2 => Z_3, O_1 => Y_3);
        
end Behavioral;