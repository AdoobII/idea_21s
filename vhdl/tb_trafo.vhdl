LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_trafo IS
END tb_trafo;
 
ARCHITECTURE behavior OF tb_trafo IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT trafo
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
    END COMPONENT;
    

    --Inputs
    signal X_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal X_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal X_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal X_4 : STD_LOGIC_VECTOR (15 downto 0);
    signal Z_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal Z_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal Z_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal Z_4 : STD_LOGIC_VECTOR (15 downto 0);
    --outputs
    signal Y_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal Y_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal Y_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal Y_4 : STD_LOGIC_VECTOR (15 downto 0);
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: trafo PORT MAP (
            X_1 => X_1,
            X_2 => X_2,
            X_3 => X_3,
            X_4 => X_4,
            Z_1 => Z_1,
            Z_2 => Z_2,
            Z_3 => Z_3,
            Z_4 => Z_4,
            Y_1 => Y_1,
            Y_2 => Y_2,
            Y_3 => Y_3,
            Y_4 => Y_4
        );

   -- Stimulus process
   stim_proc: process
   begin
        wait for 100 ns;		
        -- insert stimulus here 
        X_1 <= x"0000";
        X_2 <= x"0000";
        X_3 <= x"0000";
        X_4 <= x"0000";
        Z_1 <= x"0000";
        Z_2 <= x"0000";
        Z_3 <= x"0000";
        Z_4 <= x"0000";
        wait for 100 ns;
        X_1 <= x"ffff";
        X_2 <= x"0000";
        X_3 <= x"0000";
        X_4 <= x"0000";
        Z_1 <= x"0000";
        Z_2 <= x"0000";
        Z_3 <= x"0000";
        Z_4 <= x"0000";
        wait for 100 ns;
        X_1 <= x"ffff";
        X_2 <= x"aaaa";
        X_3 <= x"0000";
        X_4 <= x"0000";
        Z_1 <= x"0000";
        Z_2 <= x"0000";
        Z_3 <= x"0000";
        Z_4 <= x"0000";
        wait for 100 ns;
        X_1 <= x"ffff";
        X_2 <= x"aaaa";
        X_3 <= x"5555";
        X_4 <= x"0000";
        Z_1 <= x"0000";
        Z_2 <= x"0000";
        Z_3 <= x"0000";
        Z_4 <= x"0000";
        wait for 100 ns;
        X_1 <= x"ffff";
        X_2 <= x"aaaa";
        X_3 <= x"5555";
        X_4 <= x"2492";
        Z_1 <= x"0000";
        Z_2 <= x"0000";
        Z_3 <= x"0000";
        Z_4 <= x"0000";
        wait for 100 ns;
        X_1 <= x"ffff";
        X_2 <= x"aaaa";
        X_3 <= x"5555";
        X_4 <= x"2492";
        Z_1 <= x"db6d";
        Z_2 <= x"0000";
        Z_3 <= x"0000";
        Z_4 <= x"0000";
        wait for 100 ns;
        X_1 <= x"ffff";
        X_2 <= x"aaaa";
        X_3 <= x"5555";
        X_4 <= x"2492";
        Z_1 <= x"db6d";
        Z_2 <= x"1c71";
        Z_3 <= x"0000";
        Z_4 <= x"0000";
        wait for 100 ns;
        X_1 <= x"ffff";
        X_2 <= x"aaaa";
        X_3 <= x"5555";
        X_4 <= x"2492";
        Z_1 <= x"db6d";
        Z_2 <= x"1c71";
        Z_3 <= x"cccc";
        Z_4 <= x"0000";
        wait for 100 ns;
        X_1 <= x"ffff";
        X_2 <= x"aaaa";
        X_3 <= x"5555";
        X_4 <= x"2492";
        Z_1 <= x"db6d";
        Z_2 <= x"1c71";
        Z_3 <= x"cccc";
        Z_4 <= x"0002";
        wait for 100 ns;
        assert false report "reached the end of the test";
        wait for 100 ns;
        wait;
		
   end process;

END;
