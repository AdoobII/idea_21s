library ieee;
use ieee.std_logic_1164.ALL;

entity tb_reg16 is
end tb_reg16;

architecture behav of tb_reg16 is
    --component declaration
    component reg16
    port (  CLOCK : in STD_LOGIC;
            ENABLE : in STD_LOGIC;
            D : in STD_LOGIC_VECTOR (15 downto 0);
            Q : out STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;

    --input signals
    signal D : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal CLOCK : STD_LOGIC := '0';
    signal ENABLE : STD_LOGIC := '0';

    --output signal
    signal Q : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

begin
    --instantiation of mulop
    uut: reg16 port map 
    (
        D => D,
        CLOCK => CLOCK,
        ENABLE => ENABLE,
        Q => Q
    );

    clock_proc : process
    begin
        CLOCK <= not CLOCK;
        wait for 10 ns;
    end process ; -- clock_proc

    stim_proc: process
    begin
        wait for 100 ns;
        D <= x"AAAA";
        wait for 50 ns;
        ENABLE <= '1';
        wait for 52 ns;
        D <= x"6969";
        wait for 100 ns;
        assert false report "Reached end of test";
        wait;
    end process;
end behav;