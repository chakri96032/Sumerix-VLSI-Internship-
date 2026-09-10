# 32-bit RISC Processor — Instruction Set

## 1. Overview

The processor uses a simple custom 32-bit RISC instruction format.

The instruction encoding is inspired by the MIPS instruction format
and is used for educational purposes.

This project is not a complete RISC-V implementation.

## 2. Instruction Types

The processor currently uses two main instruction formats:

- R-type
- I-type

### R-type

R-type instructions perform operations between registers.

Format:

    | opcode | rs | rt | rd | shamt | funct |
    | 6 bits | 5 | 5 | 5 | 5 | 6 |

Example:

    ADD R3, R1, R2

Encoding:

    00221820

Fields:

    opcode = 000000
    rs     = R1
    rt     = R2
    rd     = R3
    funct  = 100000

The function code 100000 selects ADD.

### I-type

I-type instructions contain a register and an immediate value.

Format:

    | opcode | rs | rt | immediate |
    | 6 bits | 5 | 5 | 16 bits |

Example:

    ADDI R1, R0, 10

Encoding:

    2001000A

Fields:

    opcode    = 001000
    rs        = R0
    rt        = R1
    immediate = 000A

## 3. Supported Instructions

| Instruction | Type | Operation |
|-------------|------|-----------|
| ADD | R-type | rd = rs + rt |
| SUB | R-type | rd = rs - rt |
| AND | R-type | rd = rs & rt |
| OR | R-type | rd = rs \| rt |
| XOR | R-type | rd = rs ^ rt |
| ADDI | I-type | rt = rs + immediate |

The Control Unit also contains control definitions for:

- LW
- SW
- BEQ

These instructions are not yet fully implemented in the datapath.

## 4. Example Program

The instruction memory contains the following example program:

    ADDI R1, R0, 10
    ADDI R2, R0, 20
    ADD  R3, R1, R2

Machine-code representation:

    0x2001000A
    0x20020014
    0x00221820

## 5. Execution

### Instruction 1

    ADDI R1, R0, 10

The processor adds 10 to the value in R0.

Since R0 is always zero:

    R1 = 0 + 10
    R1 = 10

### Instruction 2

    ADDI R2, R0, 20

The processor calculates:

    R2 = 0 + 20
    R2 = 20

### Instruction 3

    ADD R3, R1, R2

The ALU receives:

    A = R1 = 10
    B = R2 = 20

The ALU performs addition:

    R3 = 10 + 20
    R3 = 30

## 6. Instruction Fetch

The Program Counter points to the current instruction.

Each instruction occupies 4 bytes.

Therefore:

    PC = PC + 4

Example:

    PC = 0x00000000 → Instruction 1
    PC = 0x00000004 → Instruction 2
    PC = 0x00000008 → Instruction 3

## 7. Instruction Fields in SystemVerilog

The processor extracts instruction fields using:

    opcode = instruction[31:26]
    rs     = instruction[25:21]
    rt     = instruction[20:16]
    rd     = instruction[15:11]
    funct  = instruction[5:0]

For immediate instructions:

    immediate = instruction[15:0]

The immediate value is sign-extended from 16 bits to 32 bits.

## 8. Verification

The processor was simulated using a SystemVerilog testbench.

The simulation verified:

    ADDI R1, R0, 10
    ADDI R2, R0, 20
    ADD R3, R1, R2

The ALU produced:

    10
    20
    30

The final ADD operation therefore confirmed:

    10 + 20 = 30

## 9. Current Limitations

The current processor is an educational implementation.

Currently:

- ADDI executes correctly.
- R-type ADD executes correctly.
- Basic ALU operations are supported.
- Instruction fetching is implemented.
- Register read/write is implemented.
- LW, SW, and BEQ control signals are defined.
- A data memory module is not yet implemented.
- Branch PC selection is not yet implemented.

Future versions can extend the processor with:

- Data memory
- Load/store execution
- Branch support
- More instructions
- Improved verification
- Pipeline stages

## 10. Conclusion

The instruction set demonstrates how a 32-bit machine instruction
is decoded into opcode, register, function, and immediate fields.

The implementation provides a simple foundation for understanding
processor datapaths, instruction decoding, ALU control, register
operations, and SystemVerilog-based processor verification.
