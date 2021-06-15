library ieee;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;

entity idea is
    port (  X_1 : in STD_LOGIC_VECTOR (15 downto 0);
            X_2 : in STD_LOGIC_VECTOR (15 downto 0);
            X_3 : in STD_LOGIC_VECTOR (15 downto 0);
            X_4 : in STD_LOGIC_VECTOR (15 downto 0);
            KEY : in STD_LOGIC_VECTOR (127 downto 0);
            Y_1 : out STD_LOGIC_VECTOR (15 downto 0);
            Y_2 : out STD_LOGIC_VECTOR (15 downto 0);
            Y_3 : out STD_LOGIC_VECTOR (15 downto 0);
            Y_4 : out STD_LOGIC_VECTOR (15 downto 0));
end idea;

architecture Behavioral of idea is

    --  Component Declaration for ROUND, TRAFO
    --  ROUND
    COMPONENT round
    PORT(
            X_1 : in STD_LOGIC_VECTOR (15 downto 0);
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
            Y_4 : out STD_LOGIC_VECTOR (15 downto 0)
        );
    END COMPONENT;
    --  TRAFO
    COMPONENT trafo
    PORT(
            X_1 : in STD_LOGIC_VECTOR (15 downto 0);
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
            Y_4 : out STD_LOGIC_VECTOR (15 downto 0)
        );
    END COMPONENT;
    --KEYGEN
    COMPONENT keygen
    PORT(
            KEY : in STD_LOGIC_VECTOR (127 downto 0);
            ROUND_KEY_1 : out STD_LOGIC_VECTOR(95 downto 0);
            ROUND_KEY_2 : out STD_LOGIC_VECTOR(95 downto 0);
            ROUND_KEY_3 : out STD_LOGIC_VECTOR(95 downto 0);
            ROUND_KEY_4 : out STD_LOGIC_VECTOR(95 downto 0);
            ROUND_KEY_5 : out STD_LOGIC_VECTOR(95 downto 0);
            ROUND_KEY_6 : out STD_LOGIC_VECTOR(95 downto 0);
            ROUND_KEY_7 : out STD_LOGIC_VECTOR(95 downto 0);
            ROUND_KEY_8 : out STD_LOGIC_VECTOR(95 downto 0);
            TRAFO_KEY_1 : out STD_LOGIC_VECTOR(63 downto 0)
        );
    END COMPONENT;

    --signals
    --round outputs
    signal ROUND_O_1 : STD_LOGIC_VECTOR(63 downto 0);
    signal ROUND_O_2 : STD_LOGIC_VECTOR(63 downto 0);
    signal ROUND_O_3 : STD_LOGIC_VECTOR(63 downto 0);
    signal ROUND_O_4 : STD_LOGIC_VECTOR(63 downto 0);
    signal ROUND_O_5 : STD_LOGIC_VECTOR(63 downto 0);
    signal ROUND_O_6 : STD_LOGIC_VECTOR(63 downto 0);
    signal ROUND_O_7 : STD_LOGIC_VECTOR(63 downto 0);
    signal ROUND_O_8 : STD_LOGIC_VECTOR(63 downto 0);
    --partial keys
    signal ROUND_KEY_1 : STD_LOGIC_VECTOR(95 downto 0);
    signal ROUND_KEY_2 : STD_LOGIC_VECTOR(95 downto 0);
    signal ROUND_KEY_3 : STD_LOGIC_VECTOR(95 downto 0);
    signal ROUND_KEY_4 : STD_LOGIC_VECTOR(95 downto 0);
    signal ROUND_KEY_5 : STD_LOGIC_VECTOR(95 downto 0);
    signal ROUND_KEY_6 : STD_LOGIC_VECTOR(95 downto 0);
    signal ROUND_KEY_7 : STD_LOGIC_VECTOR(95 downto 0);
    signal ROUND_KEY_8 : STD_LOGIC_VECTOR(95 downto 0);
    signal TRAFO_KEY_1 : STD_LOGIC_VECTOR(63 downto 0);
    begin
        --INSTANTIATE KEYGEN TO GET THE 54 PARTIAL KEYS
        cKEYGEN_1: keygen port map (KEY => KEY, ROUND_KEY_1 => ROUND_KEY_1, ROUND_KEY_2 => ROUND_KEY_2,
                                    ROUND_KEY_3 => ROUND_KEY_3, ROUND_KEY_4 => ROUND_KEY_4,
                                    ROUND_KEY_5 => ROUND_KEY_5, ROUND_KEY_6 => ROUND_KEY_6,
                                    ROUND_KEY_7 => ROUND_KEY_7, ROUND_KEY_8 => ROUND_KEY_8,
                                    TRAFO_KEY_1 => TRAFO_KEY_1);
        --Instantiate ROUND modules
        cROUND_1: round port map (  X_1, X_2, X_3, X_4,
                                    Z_1 => ROUND_KEY_1(95 downto 80), Z_2 => ROUND_KEY_1(79 downto 64),
                                    Z_3 => ROUND_KEY_1(63 downto 48), Z_4 => ROUND_KEY_1(47 downto 32),
                                    Z_5 => ROUND_KEY_1(31 downto 16), Z_6 => ROUND_KEY_1(15 downto 0),
                                    Y_1 => ROUND_O_1(63 downto 48), Y_2 => ROUND_O_1(47 downto 32),
                                    Y_3 => ROUND_O_1(31 downto 16), Y_4 => ROUND_O_1(15 downto 0));
        
        cROUND_2: round port map (  X_1 => ROUND_O_1(63 downto 48), X_2 => ROUND_O_1(47 downto 32),
                                    X_3 => ROUND_O_1(31 downto 16), X_4 => ROUND_O_1(15 downto 0),
                                    Z_1 => ROUND_KEY_2(95 downto 80), Z_2 => ROUND_KEY_2(79 downto 64),
                                    Z_3 => ROUND_KEY_2(63 downto 48), Z_4 => ROUND_KEY_2(47 downto 32),
                                    Z_5 => ROUND_KEY_2(31 downto 16), Z_6 => ROUND_KEY_2(15 downto 0),
                                    Y_1 => ROUND_O_2(63 downto 48), Y_2 => ROUND_O_2(47 downto 32),
                                    Y_3 => ROUND_O_2(31 downto 16), Y_4 => ROUND_O_2(15 downto 0));

        cROUND_3: round port map (  X_1 => ROUND_O_2(63 downto 48), X_2 => ROUND_O_2(47 downto 32),
                                    X_3 => ROUND_O_2(31 downto 16), X_4 => ROUND_O_2(15 downto 0),
                                    Z_1 => ROUND_KEY_3(95 downto 80), Z_2 => ROUND_KEY_3(79 downto 64),
                                    Z_3 => ROUND_KEY_3(63 downto 48), Z_4 => ROUND_KEY_3(47 downto 32),
                                    Z_5 => ROUND_KEY_3(31 downto 16), Z_6 => ROUND_KEY_3(15 downto 0),
                                    Y_1 => ROUND_O_3(63 downto 48), Y_2 => ROUND_O_3(47 downto 32),
                                    Y_3 => ROUND_O_3(31 downto 16), Y_4 => ROUND_O_3(15 downto 0));

        cROUND_4: round port map (  X_1 => ROUND_O_3(63 downto 48), X_2 => ROUND_O_3(47 downto 32),
                                    X_3 => ROUND_O_3(31 downto 16), X_4 => ROUND_O_3(15 downto 0),
                                    Z_1 => ROUND_KEY_4(95 downto 80), Z_2 => ROUND_KEY_4(79 downto 64),
                                    Z_3 => ROUND_KEY_4(63 downto 48), Z_4 => ROUND_KEY_4(47 downto 32),
                                    Z_5 => ROUND_KEY_4(31 downto 16), Z_6 => ROUND_KEY_4(15 downto 0),
                                    Y_1 => ROUND_O_4(63 downto 48), Y_2 => ROUND_O_4(47 downto 32),
                                    Y_3 => ROUND_O_4(31 downto 16), Y_4 => ROUND_O_4(15 downto 0));

        cROUND_5: round port map (  X_1 => ROUND_O_4(63 downto 48), X_2 => ROUND_O_4(47 downto 32),
                                    X_3 => ROUND_O_4(31 downto 16), X_4 => ROUND_O_4(15 downto 0),
                                    Z_1 => ROUND_KEY_5(95 downto 80), Z_2 => ROUND_KEY_5(79 downto 64),
                                    Z_3 => ROUND_KEY_5(63 downto 48), Z_4 => ROUND_KEY_5(47 downto 32),
                                    Z_5 => ROUND_KEY_5(31 downto 16), Z_6 => ROUND_KEY_5(15 downto 0),
                                    Y_1 => ROUND_O_5(63 downto 48), Y_2 => ROUND_O_5(47 downto 32),
                                    Y_3 => ROUND_O_5(31 downto 16), Y_4 => ROUND_O_5(15 downto 0));
        
        cROUND_6: round port map (  X_1 => ROUND_O_5(63 downto 48), X_2 => ROUND_O_5(47 downto 32),
                                    X_3 => ROUND_O_5(31 downto 16), X_4 => ROUND_O_5(15 downto 0),
                                    Z_1 => ROUND_KEY_6(95 downto 80), Z_2 => ROUND_KEY_6(79 downto 64),
                                    Z_3 => ROUND_KEY_6(63 downto 48), Z_4 => ROUND_KEY_6(47 downto 32),
                                    Z_5 => ROUND_KEY_6(31 downto 16), Z_6 => ROUND_KEY_6(15 downto 0),
                                    Y_1 => ROUND_O_6(63 downto 48), Y_2 => ROUND_O_6(47 downto 32),
                                    Y_3 => ROUND_O_6(31 downto 16), Y_4 => ROUND_O_6(15 downto 0));

        cROUND_7: round port map (  X_1 => ROUND_O_6(63 downto 48), X_2 => ROUND_O_6(47 downto 32),
                                    X_3 => ROUND_O_6(31 downto 16), X_4 => ROUND_O_6(15 downto 0),
                                    Z_1 => ROUND_KEY_7(95 downto 80), Z_2 => ROUND_KEY_7(79 downto 64),
                                    Z_3 => ROUND_KEY_7(63 downto 48), Z_4 => ROUND_KEY_7(47 downto 32),
                                    Z_5 => ROUND_KEY_7(31 downto 16), Z_6 => ROUND_KEY_7(15 downto 0),
                                    Y_1 => ROUND_O_7(63 downto 48), Y_2 => ROUND_O_7(47 downto 32),
                                    Y_3 => ROUND_O_7(31 downto 16), Y_4 => ROUND_O_7(15 downto 0));

        cROUND_8: round port map (  X_1 => ROUND_O_7(63 downto 48), X_2 => ROUND_O_7(47 downto 32),
                                    X_3 => ROUND_O_7(31 downto 16), X_4 => ROUND_O_7(15 downto 0),
                                    Z_1 => ROUND_KEY_8(95 downto 80), Z_2 => ROUND_KEY_8(79 downto 64),
                                    Z_3 => ROUND_KEY_8(63 downto 48), Z_4 => ROUND_KEY_8(47 downto 32),
                                    Z_5 => ROUND_KEY_8(31 downto 16), Z_6 => ROUND_KEY_8(15 downto 0),
                                    Y_1 => ROUND_O_8(63 downto 48), Y_2 => ROUND_O_8(47 downto 32),
                                    Y_3 => ROUND_O_8(31 downto 16), Y_4 => ROUND_O_8(15 downto 0));

        --Instantiate TRAFO
        cTRAFO_1: trafo port map (  X_1 => ROUND_O_8(63 downto 48), X_2 => ROUND_O_8(47 downto 32),
                                    X_3 => ROUND_O_8(31 downto 16), X_4 => ROUND_O_8(15 downto 0),
                                    Z_1 => TRAFO_KEY_1(63 downto 48), Z_2 => TRAFO_KEY_1(47 downto 32),
                                    Z_3 => TRAFO_KEY_1(31 downto 16), Z_4 => TRAFO_KEY_1(15 downto 0),
                                    Y_1 => Y_1, Y_2 => Y_2, Y_3 => Y_3, Y_4 => Y_4);
        

end Behavioral;