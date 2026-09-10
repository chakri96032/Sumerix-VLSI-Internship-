# 32-bit RISC Processor — Architecture

## 1. Overview

This project implements a simple 32-bit RISC processor using
SystemVerilog.

The processor is designed as an educational single-cycle-style
processor to demonstrate the main components of a CPU and their
interaction.

## 2. Main Components

The processor contains the following modules:

1. Program Counter
2. Instruction Memory
3. Register File
4. Control Unit
5. ALU Decoder
6. Arithmetic Logic Unit (ALU)

## 3. Processor Datapath

The basic data flow is:

    Program Counter
           |
           v
    Instruction Memory
           |
           v
       Instruction
           |
           v
      Control Unit
           |
           +----------------+
           |                |
           v                v
    Register File      ALU Decoder
           |                |
           +-------+--------+
                   |
                   v
                  ALU
                   |
                   v
              ALU Result
                   |
                   v
               Writeback

## 4. Program Counter

The Program Counter (PC) stores the address of the current
instruction.

For this processor, instructions are 32 bits and normally occupy
4 bytes.

Therefore, the PC increases by 4 after each clock cycle.

Example:

    PC = 0x00000000
    PC = 0x00000004
    PC = 0x00000008
    PC = 0x0000000C

## 5. Instruction Memory

Instruction Memory stores the processor instructions.

The current implementation contains 16 locations, with each
location storing one 32-bit instruction.

The PC address selects the instruction.

## 6. Register File

The Register File contains:

    32 registers
    32 bits per register

Register R0 is permanently read as zero.

The processor uses two read addresses and one write address.

## 7. Arithmetic Logic Unit

The ALU performs arithmetic and logical operations.

Supported operations:

| ALU Control | Operation |
|-------------|-----------|
| 0000 | ADD |
| 0001 | SUB |
| 0010 | AND |
| 0011 | OR |
| 0100 | XOR |
| 0101 | LESS THAN |

The ALU also produces a zero flag.

## 8. Control Unit

The Control Unit examines the instruction opcode and generates
control signals.

Supported instruction types include:

- R-type
- ADDI
- LW
- SW
- BEQ

## 9. ALU Decoder

The ALU Decoder converts the Control Unit's ALU operation
signals and instruction function field into the ALU control signal.

For R-type instructions, the function field selects the operation.

## 10. Instruction Examples

The processor was tested using:

    ADDI R1, R0, 10
    ADDI R2, R0, 20
    ADD  R3, R1, R2

The expected result is:

    R1 = 10
    R2 = 20
    R3 = 30

## 11. Simulation Result

The processor simulation produced:

    PC = 0x00000000
    Instruction = 0x2001000A
    ALU Result = 10

    PC = 0x00000004
    Instruction = 0x20020014
    ALU Result = 20

    PC = 0x00000008
    Instruction = 0x00221820
    ALU Result = 30

This confirms that the processor successfully fetched and
executed the three test instructions.

## 12. Design Summary

The project demonstrates the basic operation of a 32-bit RISC
processor using modular SystemVerilog RTL.

Each processor component is independently implemented and
verified before being integrated into the complete processor.

