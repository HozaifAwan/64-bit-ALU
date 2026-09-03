library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU64_TB is
end ALU64_TB;

architecture Behavioral of ALU64_TB is

    signal Reg_A     : STD_LOGIC_VECTOR(63 downto 0);
    signal Reg_B     : STD_LOGIC_VECTOR(63 downto 0);
    signal Carry_In  : STD_LOGIC;
    signal Op_Sel    : STD_LOGIC_VECTOR(3 downto 0);
    signal ALU_Out   : STD_LOGIC_VECTOR(63 downto 0);
    signal Carry_Out : STD_LOGIC;

begin

    DUT : entity work.ALU_Control
        port map (
            Reg_A     => Reg_A,
            Reg_B     => Reg_B,
            Carry_In  => Carry_In,
            Op_Sel    => Op_Sel,
            ALU_Out   => ALU_Out,
            Carry_Out => Carry_Out
        );

    stimulus : process
    begin

        Reg_A    <= x"0000000000000005";
        Reg_B    <= x"0000000000000003";
        Carry_In <= '0';

        -- Arithmetic Operations
        Op_Sel <= "0000"; wait for 10 ns; -- Transfer A
        Op_Sel <= "0001"; wait for 10 ns; -- Increment A
        Op_Sel <= "0010"; wait for 10 ns; -- Decrement A
        Op_Sel <= "0011"; wait for 10 ns; -- A + B + Carry

        -- Logical Operations
        Op_Sel <= "0100"; wait for 10 ns; -- NOT A
        Op_Sel <= "0101"; wait for 10 ns; -- A AND B
        Op_Sel <= "0110"; wait for 10 ns; -- A OR B
        Op_Sel <= "0111"; wait for 10 ns; -- A XOR B

        -- Shift Operations
        Op_Sel <= "1000"; wait for 10 ns; -- Arithmetic Shift Left
        Op_Sel <= "1001"; wait for 10 ns; -- Arithmetic Shift Right
        Op_Sel <= "1010"; wait for 10 ns; -- Logical Shift Left
        Op_Sel <= "1011"; wait for 10 ns; -- Logical Shift Right

        wait;

    end process;

end Behavioral;