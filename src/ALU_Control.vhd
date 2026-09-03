library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_Control is
    Port (
        Reg_A     : in  STD_LOGIC_VECTOR(63 downto 0);
        Reg_B     : in  STD_LOGIC_VECTOR(63 downto 0);
        Carry_In  : in  STD_LOGIC;
        Op_Sel    : in  STD_LOGIC_VECTOR(3 downto 0);
        ALU_Out   : out STD_LOGIC_VECTOR(63 downto 0);
        Carry_Out : out STD_LOGIC
    );
end ALU_Control;

architecture Structural of ALU_Control is

    signal Arithmetic_Out   : STD_LOGIC_VECTOR(63 downto 0);
    signal Logical_Out      : STD_LOGIC_VECTOR(63 downto 0);
    signal Shift_Out        : STD_LOGIC_VECTOR(63 downto 0);
    signal Arithmetic_Carry : STD_LOGIC;

begin

    Arithmetic_Unit : entity work.Arithmetic_ALU
        port map (
            Reg_A     => Reg_A,
            Reg_B     => Reg_B,
            Carry_In  => Carry_In,
            Op_Sel    => Op_Sel(1 downto 0),
            ALU_Out   => Arithmetic_Out,
            Carry_Out => Arithmetic_Carry
        );

    Logical_Unit : entity work.ALU_Logical
        port map (
            Reg_A   => Reg_A,
            Reg_B   => Reg_B,
            Op_Sel  => Op_Sel(1 downto 0),
            ALU_Out => Logical_Out
        );

    Shift_Unit : entity work.ALU_Shift
        port map (
            Reg_A   => Reg_A,
            Op_Sel  => Op_Sel(1 downto 0),
            ALU_Out => Shift_Out
        );

    process(
        Op_Sel,
        Arithmetic_Out,
        Logical_Out,
        Shift_Out,
        Arithmetic_Carry
    )
    begin

        case Op_Sel(3 downto 2) is

            when "00" =>
                ALU_Out   <= Arithmetic_Out;
                Carry_Out <= Arithmetic_Carry;

            when "01" =>
                ALU_Out   <= Logical_Out;
                Carry_Out <= '0';

            when "10" =>
                ALU_Out   <= Shift_Out;
                Carry_Out <= '0';

            when others =>
                ALU_Out   <= (others => '0');
                Carry_Out <= '0';

        end case;

    end process;

end Structural;