LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_idea IS
END tb_idea;
 
ARCHITECTURE behavior OF tb_idea IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT idea
        port (  X_1 : in STD_LOGIC_VECTOR (15 downto 0);
                X_2 : in STD_LOGIC_VECTOR (15 downto 0);
                X_3 : in STD_LOGIC_VECTOR (15 downto 0);
                X_4 : in STD_LOGIC_VECTOR (15 downto 0);
                KEY : in STD_LOGIC_VECTOR (127 downto 0);
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
    signal KEY : STD_LOGIC_VECTOR (127 downto 0);
    --outputs
    signal Y_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal Y_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal Y_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal Y_4 : STD_LOGIC_VECTOR (15 downto 0);
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: idea PORT MAP (
            X_1 => X_1,
            X_2 => X_2,
            X_3 => X_3,
            X_4 => X_4,
            KEY => KEY,
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
        X_1 <= x"1111";
        X_2 <= x"2222";
        X_3 <= x"4444";
        X_4 <= x"8888";
        KEY <= x"00010002000300040005000600070008";
        wait for 100 ns;
		  X_1 <= x"0000";
        X_2 <= x"0000";
        X_3 <= x"0000";
        X_4 <= x"0000";
        KEY <= x"00000000000000000000000000000000";
        wait for 100 ns;
		  X_1 <= x"1234";
        X_2 <= x"DFEA";
        X_3 <= x"3245";
        X_4 <= x"A675";
        KEY <= x"8032746083787A34EFDFBEDFAF0793A8";
        wait for 100 ns;
        assert false report "reached the end of the test";
        wait for 1000 ns;
        wait;
		
   end process;

END;
