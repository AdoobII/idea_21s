----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:03:44 05/09/2021 
-- Design Name: 
-- Module Name:    addop - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
USE ieee.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity addop is
    Port ( I_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           I_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           O_1 : out  STD_LOGIC_VECTOR (15 downto 0));
end addop;

architecture Behavioral of addop is
begin
	ADDOP_proc: process(I_1, I_2)
	begin
		O_1 <= std_logic_vector("+"(unsigned(I_1), unsigned(I_2))(15 downto 0));
	end process ADDOP_proc;

end Behavioral;

