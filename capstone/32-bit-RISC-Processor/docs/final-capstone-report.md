# 32-bit RISC Processor Design and Verification

## 1. Introduction

A processor is a digital system that executes instructions and performs
computational operations. A basic processor consists of several
interconnected components such as a Program Counter, instruction memory,
register file, control logic, and Arithmetic Logic Unit.

This project implements a simple 32-bit educational RISC processor using
SystemVerilog. The purpose of the project is to understand processor
architecture, RTL design, instruction decoding, datapath operation, and
functional verification.

The processor uses a custom instruction encoding inspired by the MIPS
instruction format. It is intended for educational purposes and is not a
complete RISC-V implementation.

---

## 2. Objectives

The main objectives of this project are:

* Design a basic 32-bit RISC processor.
* Implement processor components using SystemVerilog.
* Understand the interaction between CPU datapath components.
* Implement instruction fetching and decoding.
* Implement register-based arithmetic operations.
* Design an ALU supporting arithmetic and logical operations.
* Develop individual testbenches for processor modules.
* Integrate the modules into a complete processor.
* Verify processor functionality using simulation.
* Analyze simulation waveforms using GTKWave.
* Maintain the project using Git and GitHub.

---

## 3. Tools and Technologies

The following tools were used:

| Tool               | Purpose                        |
| ------------------ | ------------------------------ |
| SystemVerilog      | RTL design and verification    |
| Icarus Verilog     | HDL compilation and simulation |
| GTKWave            | Waveform analysis              |
| Visual Studio Code | Code development               |
| Ubuntu WSL         | Linux development environment  |
| Git                | Version control                |
| GitHub             | Source-code repository         |

---

## 4. Processor Architecture

The processor consists of the following major components:

1. Program Counter
2. Instruction Memory
3. Register File
4. Control Unit
5. ALU Decoder
6. Arithmetic Logic Unit

The basic datapath is:

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
                    │ Instruction Decode │
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
                         Writeback
```

---

## 5. RTL Module Design

### 5.1 Program Counter

The Program Counter stores the address of the current instruction.

The processor uses 32-bit addresses and increments the PC by 4 bytes
for each instruction.

Example:

```text
0x00000000
0x00000004
0x00000008
0x0000000C
```

A reset signal initializes the PC to zero.

---

### 5.2 Instruction Memory

Instruction Memory stores the processor instructions.

The current implementation contains 16 memory locations, with each
location storing one 32-bit instruction.

The instruction is selected using the address supplied by the Program
Counter.

---

### 5.3 Register File

The Register File contains:

```text
32 registers
32 bits per register
```

It provides two read ports and one write port.

Register `R0` always reads as zero.

The processor uses the register file to store intermediate and final
calculation results.

---

### 5.4 Arithmetic Logic Unit

The ALU performs arithmetic and logical operations.

Supported operations include:

| Operation | Function    |
| --------- | ----------- |
| ADD       | Addition    |
| SUB       | Subtraction |
| AND       | Bitwise AND |
| OR        | Bitwise OR  |
| XOR       | Bitwise XOR |
| LESS THAN | Comparison  |

The ALU also generates a zero flag.

---

### 5.5 ALU Decoder

The ALU Decoder converts the ALU operation information and instruction
function field into the control signal required by the ALU.

For R-type instructions, the function field determines the ALU operation.

---

### 5.6 Control Unit

The Control Unit examines the instruction opcode and generates control
signals for the datapath.

Control definitions are provided for:

* R-type
* ADDI
* LW
* SW
* BEQ

The current datapath fully executes the currently tested ADDI and R-type
ADD operations.

---

### 5.7 Top-Level Processor

The `risc_processor.sv` module connects all major components.

It performs:

```text
Instruction Fetch
       ↓
Instruction Decode
       ↓
Register Read
       ↓
ALU Operation
       ↓
Register Writeback
```

---

## 6. Instruction Set

The processor uses a custom 32-bit instruction format inspired by MIPS.

### R-Type Format

```text
| opcode | rs | rt | rd | shamt | funct |
|  6 bit | 5  | 5  | 5  |   5   |  6    |
```

### I-Type Format

```text
| opcode | rs | rt | immediate |
|  6 bit | 5  | 5  |    16     |
```

The currently tested instructions are:

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

---

## 7. Simulation Methodology

Each processor component was first developed as an independent RTL
module and tested using a dedicated SystemVerilog testbench.

After individual verification, the modules were integrated into the
top-level processor.

The complete processor was then compiled using Icarus Verilog.

Compilation command:

```bash
iverilog -g2012 -o risc_processor_sim rtl/program_counter.sv rtl/instruction_memory.sv rtl/register_file.sv rtl/alu.sv rtl/alu_decoder.sv rtl/control_unit.sv rtl/risc_processor.sv verification/tb_risc_processor.sv
```

The simulation was executed using:

```bash
vvp risc_processor_sim
```

The simulation generated a VCD waveform file for analysis using
GTKWave.

---

## 8. Test Program

The processor instruction memory contains the following test sequence:

| Address    | Instruction     | Machine Code |
| ---------- | --------------- | ------------ |
| 0x00000000 | ADDI R1, R0, 10 | 0x2001000A   |
| 0x00000004 | ADDI R2, R0, 20 | 0x20020014   |
| 0x00000008 | ADD R3, R1, R2  | 0x00221820   |

---

## 9. Simulation Results

Important simulation results were:

| Time  | PC         | Instruction | ALU Result |
| ----- | ---------- | ----------- | ---------- |
| 5000  | 0x00000000 | 0x2001000A  | 0x0000000A |
| 15000 | 0x00000004 | 0x20020014  | 0x00000014 |
| 25000 | 0x00000008 | 0x00221820  | 0x0000001E |

The hexadecimal value:

```text
0x0000001E
```

is decimal:

```text
30
```

Therefore, the ALU correctly calculated:

```text
10 + 20 = 30
```

---

## 10. Functional Verification

The final processor testbench automatically checks the register values.

Verification results:

```text
PASS: R1 = 10
PASS: R2 = 20
PASS: R3 = 30
```

The expected and actual values are:

| Register | Expected | Actual | Result |
| -------- | -------- | ------ | ------ |
| R1       | 10       | 10     | PASS   |
| R2       | 20       | 20     | PASS   |
| R3       | 30       | 30     | PASS   |

The verification therefore confirms the expected operation of the
currently implemented instruction sequence.

---

## 11. Waveform Analysis

The processor generates the waveform:

```text
waveforms/risc_processor.vcd
```

The waveform can be opened using GTKWave.

Important signals for analysis include:

* `clk`
* `reset`
* `uut.pc`
* `uut.instruction`
* `uut.alu_result`

The waveform demonstrates the relationship between the clock,
instruction fetching, program counter progression, and ALU results.

---

## 12. Verification of Individual Modules

Individual testbenches were also developed for the major processor
components.

The verification files include:

```text
tb_program_counter.sv
tb_instruction_memory.sv
tb_register_file.sv
tb_alu.sv
tb_alu_decoder.sv
tb_control_unit.sv
tb_risc_processor.sv
```

This modular verification approach makes it easier to identify errors
before integrating the complete processor.

---

## 13. Project Structure

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
│   ├── simulation-results.md
│   └── final-capstone-report.md
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

## 14. Current Limitations

The current implementation is an educational processor rather than a
complete commercial processor or complete RISC-V implementation.

Current limitations include:

* Data memory is not yet implemented.
* LW execution is not yet implemented in the complete datapath.
* SW execution is not yet implemented in the complete datapath.
* BEQ branch PC selection is not yet implemented.
* The instruction set is limited.
* The processor is not pipelined.
* Hazard detection and forwarding are not implemented.

The Control Unit contains definitions for LW, SW, and BEQ, but their
complete datapath functionality is future work.

---

## 15. Future Improvements

Future versions can include:

1. Implement data memory.
2. Implement LW and SW instructions.
3. Implement BEQ branch execution.
4. Add jump instructions.
5. Add more arithmetic and logical instructions.
6. Expand the instruction memory.
7. Improve automated verification.
8. Add a larger processor test program.
9. Introduce a pipelined architecture.
10. Implement hazard detection and forwarding.
11. Perform RTL synthesis.
12. Target an FPGA implementation.

---

## 16. Conclusion

This project successfully demonstrates the design and functional
verification of a basic 32-bit educational RISC processor using
SystemVerilog.

The project covers processor datapath design, instruction decoding,
register operations, ALU control, simulation, waveform analysis, and
automated verification.

The final processor test successfully demonstrated:

```text
R1 = 10
R2 = 20
R3 = 30
```

with all verification checks passing.

The project provides a foundation for extending the processor with
memory operations, branch instructions, additional instructions,
pipelining, and more advanced verification techniques.

---

## 17. Project Outcome

The completed project demonstrates practical understanding of:

* Digital processor architecture
* RTL design
* SystemVerilog
* Instruction encoding
* Datapath design
* Control logic
* ALU design
* Register-file design
* Functional verification
* Icarus Verilog simulation
* GTKWave waveform analysis
* Git and GitHub-based project management

**Final Verification Status: PASS**
