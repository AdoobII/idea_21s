library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
    port (  D0 : in STD_LOGIC_VECTOR (15 downto 0);
            D1 : in STD_LOGIC_VECTOR (15 downto 0);
            S : in STD_LOGIC;
            O : out STD_LOGIC_VECTOR (15 downto 0));
end mux2x1;

architecture Behav of mux2x1 is
begin
    mux : process( D0,D1,S )
    begin
        case S is
            when '0' =>
                O <= D0;
            when '1' =>
                O <= D1;
            when others =>
                O <= "XXXXXXXXXXXXXXXX";
        end case;
    end process ; -- mux
end Behav ; -- Behav