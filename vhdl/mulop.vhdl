library ieee;
use ieee.numeric_std.ALL;
use ieee.std_logic_1164.ALL;

entity mulop is
    port
    (
        I_1 : in STD_LOGIC_VECTOR (15 downto 0);
        I_2 : in STD_LOGIC_VECTOR (15 downto 0);
        O_1 : out STD_LOGIC_VECTOR (15 downto 0)
    );
end mulop;

architecture behav of mulop is

    --define intermediate signals that hold multiplication,
    --division and modulo results
    signal tmp_mul_result : unsigned (32 downto 0);
    signal tmp_div_result : unsigned (16 downto 0);
    signal tmp_mod_result : unsigned (15 downto 0);

    begin
            
            mul_proc: process(I_1, I_2)
            --those two variables are used to check whether the inputs
            --are zeros or not and then preppending them to the input vector
            variable pI_1 : std_logic;
            variable pI_2 : std_logic;
            begin
                pI_1 := not(I_1(15) or I_1(14) or I_1(13) or I_1(12) or 
                            I_1(11) or I_1(10) or I_1(9) or I_1(8) or 
                            I_1(7) or I_1(6) or I_1(5) or I_1(4) or 
                            I_1(3) or I_1(2) or I_1(1) or I_1(0));
                pI_2 := not(I_2(15) or I_2(14) or I_2(13) or I_2(12) or 
                            I_2(11) or I_2(10) or I_2(9) or I_2(8) or 
                            I_2(7) or I_2(6) or I_2(5) or I_2(4) or 
                            I_2(3) or I_2(2) or I_2(1) or I_2(0));
                
                tmp_mul_result <= "*"(unsigned(pI_1 & I_1), unsigned(pI_2 & I_2))(32 downto 0);
            end process mul_proc;

            div_proc : process( tmp_mul_result )
            begin
                tmp_div_result <= tmp_mul_result(32 downto 16);
            end process ; -- div_proc

            mod_proc : process( tmp_mul_result )
            begin
                tmp_mod_result <= tmp_mul_result(15 downto 0);
            end process ; -- mod_proc

            output_proc : process( tmp_div_result,  tmp_mod_result)
            begin
                if tmp_mod_result >= tmp_div_result then
                    O_1 <= STD_LOGIC_VECTOR("-"(unsigned'(tmp_mod_result), tmp_div_result)(15 downto 0));
                else
                    O_1 <= STD_LOGIC_VECTOR("+"(unsigned'("-"(unsigned'(tmp_mod_result), tmp_div_result)), unsigned'("1" & x"0001"))(15 downto 0));
                end if;
            end process ; -- output_proc
    end behav;