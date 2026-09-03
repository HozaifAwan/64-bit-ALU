library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_Logical is
    Port (
        Reg_A   : in  STD_LOGIC_VECTOR(63 downto 0);
        Reg_B   : in  STD_LOGIC_VECTOR(63 downto 0);
        Op_Sel  : in  STD_LOGIC_VECTOR(1 downto 0);
        ALU_Out : out STD_LOGIC_VECTOR(63 downto 0)
    );
end ALU_Logical;

architecture Behavioral of ALU_Logical is
begin

    process(Reg_A, Reg_B, Op_Sel)
    begin
        case Op_Sel is

            when "00" =>
                -- NOT A
                ALU_Out <= NOT Reg_A;

            when "01" =>
                -- A AND B
                ALU_Out <= Reg_A AND Reg_B;

            when "10" =>
                -- A OR B
                ALU_Out <= Reg_A OR Reg_B;

            when "11" =>
                -- A XOR B
                ALU_Out <= Reg_A XOR Reg_B;

            when others =>
                ALU_Out <= (others => '0');

        end case;
    end process;

end Behavioral;