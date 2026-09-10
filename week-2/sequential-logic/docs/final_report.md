# PROJECT TASK-2
## Combinational and Sequential RTL Design, FSMs, Counters, Shift Registers, Parameterized Verilog Design, Timing Concepts, and Advanced RTL Simulation

**Industry-Oriented Internship Program on VLSI Design and Semiconductor Engineering**

---

## 1. Introduction

Task-2 advances the RTL skills developed in Task-1 by focusing on sequential logic, counters, shift registers, parameterized RTL, finite state machines (FSMs), timing analysis, advanced testbench development, and engineering documentation.

The work in this project demonstrates practical RTL design and verification using SystemVerilog/Verilog HDL, Icarus Verilog for simulation, GTKWave for waveform inspection, Visual Studio Code for editing, and Git/GitHub for version control.

---

## 2. Tools Used

| Tool | Purpose |
|---|---|
| Ubuntu Linux through WSL | Development environment |
| SystemVerilog / Verilog HDL | RTL design |
| Icarus Verilog | RTL simulation |
| GTKWave | Waveform viewing and analysis |
| Visual Studio Code | Source-code editing |
| Git and GitHub | Version control and repository management |

---

## 3. Project Organization

The Week-2 work is organized under:

```text
week-2/sequential-logic/
├── rtl/
├── verification/
├── waveforms/
├── docs/
└── README.md
```

The `rtl` directory contains synthesizable design modules, `verification` contains testbenches and advanced testbench work, `waveforms` contains simulation waveform deliverables, and `docs` contains project documentation, diagrams, timing information, and related notes.

---

## 4. Sequential RTL Design

### 4.1 D Flip-Flop

A D Flip-Flop was implemented using a clocked `always_ff` block with a synchronous reset.

Main behavior:

- On the rising edge of `clk`, the output captures the input `d`.
- When `reset` is asserted, `q` is cleared to `0`.
- Non-blocking assignment is used for sequential logic.

RTL:

```systemverilog
module d_flip_flop (
    input logic clk,
    input logic reset,
    input logic d,
    output logic q
);

always_ff @(posedge clk) begin
    if (reset)
        q <= 1'b0;
    else
        q <= d;
end

endmodule
```

The D Flip-Flop was simulated with a dedicated testbench and its waveform was inspected using GTKWave.

### 4.2 8-bit Register

An 8-bit register was implemented with synchronous reset.

The testbench verified several data patterns, including:

```text
10101010
11110000
01010101
11001100
```

The register captures the input value on the active clock edge when reset is inactive.

### 4.3 8-bit Shift Register

An 8-bit serial-input shift register was implemented.

The shift operation is:

```text
q <= {q[6:0], serial_in};
```

A testbench applied a serial input sequence and the resulting waveform was inspected.

---

## 5. Counter Design

Five counter designs were implemented and simulated.

### 5.1 4-bit Up Counter

The counter starts at zero after reset and increments on each rising clock edge.

```systemverilog
module up_counter_4bit (
    input logic clk,
    input logic reset,
    output logic [3:0] q
);

always_ff @(posedge clk) begin
    if (reset)
        q <= 4'b0000;
    else
        q <= q + 1'b1;
end

endmodule
```

Expected counting behavior:

```text
0000 → 0001 → 0010 → 0011 → ... → 1111 → 0000
```

### 5.2 4-bit Down Counter

The down counter starts at `1111` after reset and decrements on each rising clock edge.

Expected behavior:

```text
1111 → 1110 → 1101 → ... → 0001 → 0000 → 1111
```

### 5.3 Mod-10 Counter

The Mod-10 counter counts from `0` through `9` and then returns to `0`.

Expected sequence:

```text
0000 → 0001 → 0010 → 0011 → 0100
→ 0101 → 0110 → 0111 → 1000 → 1001 → 0000
```

The design explicitly detects decimal 9 (`1001`) and returns to zero.

### 5.4 Ring Counter

The Ring Counter was initialized to:

```text
0001
```

The active bit rotates through the four positions.

Expected sequence:

```text
0001 → 0010 → 0100 → 1000 → 0001
```

### 5.5 Johnson Counter

The Johnson Counter was implemented using the inverted most-significant bit as feedback.

Expected sequence:

```text
0000
0001
0011
0111
1111
1110
1100
1000
0000
```

The complete sequence was verified through simulation and waveform inspection.

---

## 6. Parameterized RTL Design

Parameterized RTL was used to create reusable hardware modules rather than hard-coded designs.

### 6.1 Parameterized Register

The register uses:

```systemverilog
parameter WIDTH = 8
```

and can therefore be configured for different data widths.

The design was verified using:

- 8-bit configuration
- 16-bit configuration

This demonstrated that the same RTL can be reused for multiple widths.

### 6.2 Parameterized Counter

The parameterized counter was verified with:

- 4-bit configuration
- 8-bit configuration

The width is controlled using a Verilog parameter.

Example instantiation:

```systemverilog
parameterized_counter #(
    .WIDTH(8)
) uut (
    .clk(clk),
    .reset(reset),
    .q(q)
);
```

### 6.3 Parameterized Shift Register

The parameterized shift register was verified using:

- 8-bit configuration
- 4-bit configuration

The shift operation is controlled by the selected parameter width.

---

## 7. Traffic Light FSM

### 7.1 FSM Type

A Moore Finite State Machine was implemented for a Traffic Light Controller.

The controller contains three states:

```text
RED
GREEN
YELLOW
```

The outputs depend only on the current state.

### 7.2 State Transitions

The state sequence is:

```text
RED → GREEN → YELLOW → RED
```

Reset places the FSM in the `RED` state.

State table:

| Current State | Output | Next State |
|---|---|---|
| RED | Red = 1 | GREEN |
| GREEN | Green = 1 | YELLOW |
| YELLOW | Yellow = 1 | RED |

### 7.3 Moore FSM Implementation

The FSM uses:

- A clocked state register
- Combinational next-state logic
- Combinational output logic
- A default state transition for safe handling of undefined states

The state register uses non-blocking assignment, while combinational logic uses `always_comb`.

### 7.4 FSM Verification

The Traffic Light FSM testbench automatically checked the expected output states.

The verification sequence checked:

```text
GREEN
YELLOW
RED
GREEN
```

No `ERROR` messages were produced during the completed FSM verification.

---

## 8. Timing Analysis

The testbenches use:

```systemverilog
always #5 clk = ~clk;
```

This produces a clock period of:

```text
T = 10 ns
```

Therefore, the corresponding clock frequency is:

```text
f = 1 / T = 100 MHz
```

### Timing Concepts Covered

The documentation and waveform analysis cover:

- Rising-edge clock behavior
- Synchronous reset
- Setup time
- Hold time
- Relationship between clock transitions and sequential outputs

For synchronous sequential logic, the input is captured at the active clock edge when the required timing conditions are satisfied.

---

## 9. Advanced Testbench Development

A reusable testbench template was developed to demonstrate reusable verification practices.

The testbench includes:

- Automated clock generation
- Reset generation
- A reusable reset task
- Waveform dumping
- Simulation completion reporting

Example clock generation:

```systemverilog
always #5 clk = ~clk;
```

Reusable reset task:

```systemverilog
task automatic reset_dut;
begin
    reset = 1'b1;
    #10;
    reset = 1'b0;
end
endtask
```

The reusable testbench was successfully executed using Icarus Verilog.

---

## 10. Simulation and Verification Summary

| Design Area | Verification Result |
|---|---|
| D Flip-Flop | Simulation completed; waveform inspected |
| 8-bit Register | Simulation completed; waveform inspected |
| Shift Register | Simulation completed; waveform inspected |
| 4-bit Up Counter | Sequence verified |
| 4-bit Down Counter | Sequence verified |
| Mod-10 Counter | Sequence verified |
| Ring Counter | Sequence verified |
| Johnson Counter | Sequence verified |
| Parameterized Register | Multiple widths verified |
| Parameterized Counter | Multiple widths verified |
| Parameterized Shift Register | Multiple widths verified |
| Traffic Light FSM | Automatic checks PASS |
| Reusable Testbench | Execution PASS |

Waveform files and screenshots were produced for the completed simulations and organized under the Week-2 project directories.

---

## 11. Documentation Produced

The Week-2 project contains documentation supporting the RTL and verification work, including:

- RTL block diagrams
- FSM state transition diagram
- Truth/state tables
- Timing documentation
- RTL notes
- Simulation-results documentation
- GTKWave waveform screenshots
- README
- Daily progress log
- Project documentation PDF

These documents organize the design and verification evidence required for Task-2.

---

## 12. Engineering Practices

The project follows basic RTL engineering practices:

1. Sequential logic is implemented using clocked `always_ff` blocks.
2. Non-blocking assignments are used for sequential state and data updates.
3. Combinational logic is separated from sequential state updates.
4. Parameters are used where reusable widths are required.
5. Testbenches generate clocks and reset signals explicitly.
6. Waveforms are dumped during simulation for verification.
7. Automated checks are used in the Traffic Light FSM testbench.
8. Source files, verification files, waveforms, and documentation are organized in separate directories.
9. Git is used to track and synchronize the project with GitHub.

---

## 13. Task-2 Deliverables

The completed Week-2 project provides the following deliverables:

- [x] Verilog/SystemVerilog RTL source files
- [x] Testbench files
- [x] Simulation output and waveform files
- [x] GTKWave waveform screenshots
- [x] FSM state transition diagram
- [x] RTL block diagrams
- [x] Timing documentation and diagrams
- [x] Counter design documentation
- [x] Organized GitHub repository
- [x] README.md
- [x] Project Documentation PDF
- [x] Daily Progress Log

---

## 14. Repository Status

The Week-2 work is organized under:

```text
week-2/sequential-logic/
```

The project has been committed and pushed to the GitHub repository.

The final Git status was verified as:

```text
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
```

This confirms that the working tree is clean and the local branch is synchronized with the remote repository.

---

## 15. Conclusion

Task-2 demonstrates practical RTL design and simulation skills across sequential circuits, counters, parameterized hardware, and a Moore Finite State Machine.

The completed designs were simulated using Icarus Verilog, waveforms were inspected using GTKWave, and supporting engineering documentation was prepared.

The project demonstrates:

- Sequential RTL design
- Register and shift-register implementation
- Counter design
- Parameterized RTL design
- Moore FSM design
- Timing analysis
- Reusable testbench development
- Simulation-based verification
- Engineering documentation
- Git/GitHub project organization

The completed Week-2 work provides a structured foundation for progressing to more advanced RTL verification and digital subsystem development in subsequent internship tasks.

---

## 16. Submission Note

**Project:** Task-2 — Sequential RTL Design, Counters, Parameterized RTL, FSMs, Timing, and Advanced Simulation

**Primary Mini-Project:** Traffic Light Controller Using Moore FSM

**Simulation Tool:** Icarus Verilog

**Waveform Tool:** GTKWave

**Development Environment:** Ubuntu through WSL + Visual Studio Code

**Version Control:** Git and GitHub

**Status:** Ready for Task-2 submission
