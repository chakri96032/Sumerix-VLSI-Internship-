# 32-bit RISC Processor Design and Verification

## Overview

This project implements a simple **32-bit educational RISC processor** using SystemVerilog.

The processor demonstrates the fundamental components of a CPU, including:

* Program Counter
* Instruction Memory
* Register File
* Control Unit
* ALU Decoder
* Arithmetic Logic Unit (ALU)
* Instruction decoding
* Register writeback
* SystemVerilog-based verification

The design uses a **custom, MIPS-inspired instruction encoding** for educational purposes. It is **not a complete RISC-V implementation**.

---

## Architecture

The basic processor datapath is:

```text
                    ┌────────────────────┐
                    │  Program Counter   │
                    └─────────┬──────────┘
                              │
                              ▼
                    ┌────────────────────┐
                    │ Instruction Memory │
                    └─────────┬──────────┘
                              │
                              ▼
                    ┌────────────────────┐
                    │   Instruction      │
                    │     Decode         │
                    └─────────┬──────────┘
                              │
                 ┌────────────┴────────────┐
                 │                         │
                 ▼                         ▼
        ┌─────────────────┐       ┌─────────────────┐
        │  Control Unit   │       │   ALU Decoder   │
        └────────┬────────┘       └────────┬────────┘
                 │                         │
                 └────────────┬────────────┘
                              ▼
                    ┌────────────────────┐
                    │   Register File    │
                    └─────────┬──────────┘
                              │
                              ▼
                    ┌────────────────────┐
                    │        ALU         │
                    └─────────┬──────────┘
                              │
                              ▼
                       ALU / Writeback
```

---

## Project Structure

```text
32-bit-RISC-Processor/
│
├── rtl/
│   ├── program_counter.sv
│   ├── instruction_memory.sv
│   ├── register_file.sv
│   ├── alu.sv
│   ├── alu_decoder.sv
│   ├── control_unit.sv
│   └── risc_processor.sv
│
├── verification/
│   ├── tb_program_counter.sv
│   ├── tb_instruction_memory.sv
│   ├── tb_register_file.sv
│   ├── tb_alu.sv
│   ├── tb_alu_decoder.sv
│   ├── tb_control_unit.sv
│   └── tb_risc_processor.sv
│
├── docs/
│   ├── architecture.md
│   ├── instruction-set.md
│   └── simulation-results.md
│
└── waveforms/
    ├── program_counter.vcd
    ├── instruction_memory.vcd
    ├── register_file.vcd
    ├── alu.vcd
    ├── alu_decoder.vcd
    ├── control_unit.vcd
    └── risc_processor.vcd
```

---

## Processor Components

### Program Counter

The Program Counter stores the address of the current instruction.

The current implementation increments the PC by 4 bytes after each clock cycle.

```text
0x00000000
0x00000004
0x00000008
0x0000000C
...
```

### Instruction Memory

Instruction Memory stores 32-bit instructions.

The current implementation contains 16 instruction locations.

### Register File

The processor contains:

```text
32 registers
32 bits per register
```

Register `R0` always reads as zero.

The Register File provides two read ports and one write port.

### ALU

The ALU supports:

| Operation | ALU Control |
| --------- | ----------- |
| ADD       | `0000`      |
| SUB       | `0001`      |
| AND       | `0010`      |
| OR        | `0011`      |
| XOR       | `0100`      |
| LESS THAN | `0101`      |

The ALU also generates a zero flag.

### Control Unit

The Control Unit decodes the instruction opcode and generates processor control signals.

Control definitions are provided for:

* R-type
* ADDI
* LW
* SW
* BEQ

### ALU Decoder

The ALU Decoder determines the required ALU operation using the ALU operation field and, for R-type instructions, the function field.

---

## Example Program

The processor currently executes the following example:

```text
ADDI R1, R0, 10
ADDI R2, R0, 20
ADD  R3, R1, R2
```

Machine-code representation:

```text
0x2001000A
0x20020014
0x00221820
```

### Execution

First instruction:

```text
R1 = R0 + 10
R1 = 10
```

Second instruction:

```text
R2 = R0 + 20
R2 = 20
```

Third instruction:

```text
R3 = R1 + R2
R3 = 10 + 20
R3 = 30
```

---

## Verification

The processor was verified using a SystemVerilog testbench and Icarus Verilog.

The testbench automatically checks the contents of the register file.

Verification result:

```text
PASS: R1 = 10
PASS: R2 = 20
PASS: R3 = 30
```

Therefore:

```text
Expected R3 = 30
Actual   R3 = 30

RESULT: PASS
```

---

## Simulation

The processor generates a VCD waveform:

```text
waveforms/risc_processor.vcd
```

The waveform can be viewed using GTKWave.

Important signals include:

```text
clk
reset
PC
instruction
ALU result
```

---

## How to Simulate

### 1. Compile

From the processor directory:

```bash
iverilog -g2012 -o risc_processor_sim rtl/program_counter.sv rtl/instruction_memory.sv rtl/register_file.sv rtl/alu.sv rtl/alu_decoder.sv rtl/control_unit.sv rtl/risc_processor.sv verification/tb_risc_processor.sv
```

### 2. Run

```bash
vvp risc_processor_sim
```

### 3. View Waveform

The simulation creates:

```text
risc_processor.vcd
```

The waveform can be opened with GTKWave.

---

## Tools Used

* **SystemVerilog** — RTL design and verification
* **Icarus Verilog** — HDL simulation
* **GTKWave** — waveform analysis
* **Visual Studio Code** — development environment
* **Ubuntu WSL** — Linux development environment
* **Git** — version control
* **GitHub** — project repository

---

## Current Limitations

This is an educational processor implementation.

Currently:

* ADDI execution is implemented.
* R-type ADD execution is implemented.
* Basic ALU operations are implemented.
* Instruction fetching is implemented.
* Register read/write is implemented.
* LW, SW, and BEQ control signals are defined.

The following are not yet fully implemented:

* Data memory
* Load/store datapath
* Branch PC selection
* Complete instruction-set coverage
* Pipeline stages

Therefore, this project should be described as a **custom 32-bit educational RISC processor**, not as a complete RISC-V processor.

---

## Future Improvements

Possible future extensions include:

1. Add data memory.
2. Implement LW and SW instructions.
3. Implement BEQ branch execution.
4. Add additional arithmetic and logical instructions.
5. Add jump instructions.
6. Improve automated verification.
7. Add pipeline stages.
8. Add hazard detection and forwarding.
9. Develop a larger instruction-memory test program.
10. Perform synthesis and FPGA implementation.

---

## Author

**K. Chakradhar**

### Project

**32-bit RISC Processor Design and Verification**

### Repository

**Sumerix VLSI Internship**
