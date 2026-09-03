library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_Shift is
    Port (
        Reg_A   : in  STD_LOGIC_VECTOR(63 downto 0);
        Op_Sel  : in  STD_LOGIC_VECTOR(1 downto 0);
        ALU_Out : out STD_LOGIC_VECTOR(63 downto 0)
    );
end ALU_Shift;

architecture Behavioral of ALU_Shift is
begin

    process(Reg_A, Op_Sel)
    begin
        case Op_Sel is

            when "00" =>
                -- Arithmetic Shift Left
                ALU_Out <=
                    STD_LOGIC_VECTOR(SHIFT_LEFT(SIGNED(Reg_A), 1));

            when "01" =>
                -- Arithmetic Shift Right
                ALU_Out <=
                    STD_LOGIC_VECTOR(SHIFT_RIGHT(SIGNED(Reg_A), 1));

            when "10" =>
                -- Logical Shift Left
                ALU_Out <=
                    STD_LOGIC_VECTOR(SHIFT_LEFT(UNSIGNED(Reg_A), 1));

            when "11" =>
                -- Logical Shift Right
                ALU_Out <=
                    STD_LOGIC_VECTOR(SHIFT_RIGHT(UNSIGNED(Reg_A), 1));

            when others =>
                ALU_Out <= (others => '0');

        end case;
    end process;

end Behavioral;