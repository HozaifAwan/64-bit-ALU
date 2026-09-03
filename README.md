# 64-bit ALU

A modular 64-bit Arithmetic Logic Unit (ALU) designed in VHDL. The project implements arithmetic, logical, and shift operations using separate modules connected through a central control unit.

## Features

- 64-bit arithmetic operations
- Bitwise logical operations
- Arithmetic and logical shifts
- Carry input and carry output
- 4-bit operation selector
- Modular VHDL architecture

## Design

The ALU is divided into separate arithmetic, logical, and shift modules. The control module uses the operation selector to determine which operation is performed and routes the appropriate result to the ALU output.

## Verification

A VHDL testbench was created to test the different ALU operations. The design was compiled and simulated using GHDL, with the resulting waveform analyzed in GTKWave.

RTL synthesis was also used to inspect the hardware structure and verify the connections between the ALU modules.

## Simulation Waveform

![ALU Waveform](Schematics%20%2B%20Waveform/waveform.png)

## Tools

- VHDL
- GHDL
- GTKWave
- Quartus Prime
- Visual Studio Code
