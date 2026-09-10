# Parameterized Shift Register RTL Notes

## Objective
Move data serially through multiple register stages.

## Inputs
- clk
- reset
- serial_in

## Outputs
- q[WIDTH-1:0]

## RTL Behavior

if (reset)
    q <= 0;
else
    q <= {q[WIDTH-2:0], serial_in};

## Hardware Components
- Register chain
- Routing logic

## Applications
- Serial communication
- Data buffering
- Delay circuits
- SPI/UART interfaces
