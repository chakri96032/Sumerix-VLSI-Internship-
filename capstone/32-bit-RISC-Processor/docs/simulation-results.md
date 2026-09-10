# 32-bit RISC Processor — Simulation Results

## 1. Overview

The processor was simulated using Icarus Verilog and verified using
a SystemVerilog testbench.

The simulation verifies instruction fetching, ALU operation,
register updates, and the final arithmetic result.

## 2. Test Program

The instruction memory contains three main instructions:

| Address | Machine Code | Instruction |
|---------|--------------|-------------|
| 0x00000000 | 0x2001000A | ADDI R1, R0, 10 |
| 0x00000004 | 0x20020014 | ADDI R2, R0, 20 |
| 0x00000008 | 0x00221820 | ADD R3, R1, R2 |

## 3. Expected Results

After execution:

    R1 = 10
    R2 = 20
    R3 = 30

The third instruction performs:

    R3 = R1 + R2
    R3 = 10 + 20
    R3 = 30

## 4. Simulation Trace

The processor simulation produced the following important values:

| Time | PC | Instruction | ALU Result |
|------|----|-------------|------------|
| 5000 | 0x00000000 | 0x2001000A | 0x0000000A |
| 15000 | 0x00000004 | 0x20020014 | 0x00000014 |
| 25000 | 0x00000008 | 0x00221820 | 0x0000001E |

The Program Counter increases by 4 bytes for each instruction.

## 5. Verification Output

The verification testbench automatically checked the register
values.

The results were:

    PASS: R1 = 10
    PASS: R2 = 20
    PASS: R3 = 30

All three verification checks passed.

## 6. Verification Analysis

### R1 Verification

The first instruction is:

    ADDI R1, R0, 10

Since R0 is always zero:

    R1 = 0 + 10
    R1 = 10

Result:

    PASS

### R2 Verification

The second instruction is:

    ADDI R2, R0, 20

Therefore:

    R2 = 0 + 20
    R2 = 20

Result:

    PASS

### R3 Verification

The third instruction is:

    ADD R3, R1, R2

The ALU receives:

    A = 10
    B = 20

Therefore:

    R3 = 10 + 20
    R3 = 30

Result:

    PASS

## 7. Waveform

The simulation generates the waveform file:

    waveforms/risc_processor.vcd

The waveform can be opened using GTKWave.

Important signals for inspection include:

- clk
- reset
- PC
- instruction
- ALU result

The waveform demonstrates the relationship between the clock,
program counter, fetched instructions, and ALU results.

## 8. Simulation Conclusion

The simulation successfully demonstrated the basic operation of
the educational 32-bit RISC processor.

The processor correctly:

- Generated the program counter sequence.
- Fetched instructions from instruction memory.
- Decoded instruction fields.
- Read register operands.
- Performed ALU operations.
- Wrote results into the register file.
- Produced the expected final result.

The final verification result was:

    R1 = 10
    R2 = 20
    R3 = 30

Therefore, the implemented processor successfully passes the
current functional verification test.

## 9. Current Scope

This verification covers the currently implemented processor
functionality.

The design is an educational custom RISC processor with a
MIPS-inspired instruction encoding. It should not be considered
a complete RISC-V implementation.

Load/store data memory and branch execution are planned extensions
for future versions.
