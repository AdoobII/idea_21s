library ieee;
use ieee.std_logic_1164.all;

entity tb_mux2x1 is
    end tb_mux2x1;
    
    architecture behav of tb_mux2x1 is
        --component declaration
        component mux2x1
        port (  D0 : in STD_LOGIC_VECTOR (15 downto 0);
                D1 : in STD_LOGIC_VECTOR (15 downto 0);
                S  : in STD_LOGIC;
                O  : out STD_LOGIC_VECTOR (15 downto 0));
        END COMPONENT;
    
        --input signals
        signal D0 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
        signal D1 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
        signal S : STD_LOGIC := '0';
    
        --output signal
        signal O : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    
    begin
        --instantiation of mulop
        uut: mux2x1 port map 
        (
            D0 => D0,
            D1 => D1,
            S => S,
            O => O
        );
    
        stim_proc: process
        begin
            wait for 100 ns;
            D0 <= x"AAAA";
            D1 <= x"BBBB";
            wait for 50 ns;
            D0 <= x"FFFF";
            D1 <= x"CCCC";
            S <= '1';
            wait for 52 ns;
            D1 <= x"BBBB";
            wait for 100 ns;
            assert false report "Reached end of test";
            wait;
        end process;
    end behav;