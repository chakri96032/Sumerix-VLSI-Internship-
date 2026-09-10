# Parameterized Counter RTL Notes

## Objective
Design a reusable N-bit binary counter.

## Inputs
- clk
- reset

## Outputs
- q[WIDTH-1:0]

## RTL Behavior

if (reset)
    q <= 0;
else
    q <= q + 1;

## Hardware Components
- N-bit register
- N-bit adder
- feedback path

## Applications
- Event counting
- Frequency division
- Timers
- Digital clocks
