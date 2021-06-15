library ieee;
use ieee.numeric_std.ALL;
use ieee.std_logic_1164.ALL;

entity tb_mulop is
end tb_mulop;

architecture behav of tb_mulop is
    --component declaration
    component mulop
    port
    (
        I_1 : IN  STD_LOGIC_VECTOR(15 downto 0);
        I_2 : IN  STD_LOGIC_VECTOR(15 downto 0);
        O_1 : OUT  STD_LOGIC_VECTOR(15 downto 0)
    );
    END COMPONENT;

    --input signals
    signal I_1 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal I_2 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

    --output signal
    signal O_1 : STD_LOGIC_VECTOR(15 downto 0);

begin
    --instantiation of mulop
    uut: mulop port map 
    (
        I_1 => I_1,
        I_2 => I_2,
        O_1 => O_1
    );

    stim_proc: process
    begin
        wait for 100 ns;
        I_1 <= x"0000";
        I_2 <= x"0000";
		  wait for 10 ns;
        assert (O_1 /= x"0001") report "vector not matched";
        wait for 100 ns;
        I_1 <= x"0001";
        I_2 <= x"0000";
        assert (O_1 /= x"0000") report "vector not matched";
        wait for 100 ns;
        I_1 <= x"0001";
        I_2 <= x"0001";
        assert (O_1 /= x"0001") report "vector not matched";
        wait for 100 ns;
        I_1 <= x"0003";
        I_2 <= x"0001";
        assert (O_1 /= x"0003") report "vector not matched";
        wait for 100 ns;
        I_1 <= x"0003";
        I_2 <= x"0003";
        assert (O_1 /= x"0009") report "vector not matched";
        wait for 100 ns;
        I_1 <= x"7fff";
        I_2 <= x"0003";
        assert (O_1 /= x"7ffc") report "vector not matched";
        wait for 100 ns;
        I_1 <= x"7fff";
        I_2 <= x"7fff";
        assert (O_1 /= x"c003") report "vector not matched";
        wait for 100 ns;
		  I_1 <= x"ffff";
        I_2 <= x"7fff";
        assert (O_1 /= x"0003") report "vector not matched";
		  I_1 <= x"ffff";
        I_2 <= x"ffff";
        assert (O_1 /= x"0004") report "vector not matched";
        wait for 100 ns;
        I_1 <= x"8000";
        I_2 <= x"ffff";
        assert (O_1 /= x"0001") report "vector not matched";
        wait for 100 ns;
        I_1 <= x"8000";
        I_2 <= x"8000";
        assert (O_1 /= x"c001") report "vector not matched";
        wait for 100 ns;
        I_1 <= x"ffff";
        I_2 <= x"ffff";
        assert (O_1 /= x"0004") report "vector not matched";

        assert false report "Reached end of test";
        wait;
    end process;
end behav;