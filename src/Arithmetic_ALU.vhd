library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Arithmetic_ALU is
    Port (
        Reg_A     : in  STD_LOGIC_VECTOR(63 downto 0);
        Reg_B     : in  STD_LOGIC_VECTOR(63 downto 0);
        Carry_In  : in  STD_LOGIC;
        Op_Sel    : in  STD_LOGIC_VECTOR(1 downto 0);
        ALU_Out   : out STD_LOGIC_VECTOR(63 downto 0);
        Carry_Out : out STD_LOGIC
    );
end Arithmetic_ALU;

architecture Behavioral of Arithmetic_ALU is
    signal Temp_Result : UNSIGNED(64 downto 0);
begin

    process(Reg_A, Reg_B, Carry_In, Op_Sel)
    begin
        case Op_Sel is

            when "00" =>
                -- Transfer A
                Temp_Result <= ('0' & UNSIGNED(Reg_A));

            when "01" =>
                -- Increment A
                Temp_Result <= ('0' & UNSIGNED(Reg_A)) + 1;

            when "10" =>
                -- Decrement A
                Temp_Result <= ('0' & UNSIGNED(Reg_A)) - 1;

            when "11" =>
                -- A + B + Carry In
                if Carry_In = '1' then
                    Temp_Result <=
                        ('0' & UNSIGNED(Reg_A)) +
                        ('0' & UNSIGNED(Reg_B)) + 1;
                else
                    Temp_Result <=
                        ('0' & UNSIGNED(Reg_A)) +
                        ('0' & UNSIGNED(Reg_B));
                end if;

            when others =>
                Temp_Result <= (others => '0');

        end case;
    end process;

    ALU_Out   <= STD_LOGIC_VECTOR(Temp_Result(63 downto 0));
    Carry_Out <= Temp_Result(64);

end Behavioral;