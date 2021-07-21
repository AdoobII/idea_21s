LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY mux4x1 IS
    PORT (
        D0 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        D1 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        D2 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        D3 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        S : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        O : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
END mux4x1;

ARCHITECTURE Behav OF mux4x1 IS
    TYPE mux_array_type IS ARRAY (0 TO 3) OF STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL input_array : mux_array_type;
BEGIN
    input_array(0) <= D0;
    input_array(1) <= D1;
    input_array(2) <= D2;
    input_array(3) <= D3;

    O <= input_array(to_integer(unsigned(S)));

END Behav; -- Behav