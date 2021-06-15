library ieee;
use ieee.std_logic_1164.all;

entity reg16 is
    port (  CLOCK : in STD_LOGIC;
            ENABLE : in STD_LOGIC;
            D : in STD_LOGIC_VECTOR (15 downto 0);
            Q : out STD_LOGIC_VECTOR (15 downto 0));
end reg16;

architecture Behav of reg16 is
begin
    reg : process( CLOCK )
    begin
        if (CLOCK = '1' and CLOCK'EVENT) then
            if (ENABLE = '1') then
                Q <= D;
            end if;
        end if;
    end process ; -- reg
end Behav ; -- Behav