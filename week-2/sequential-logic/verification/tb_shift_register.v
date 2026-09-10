`timescale 1ns/1ps

module tb_shift_register;

logic clk;
logic reset;
logic serial_in;
logic [7:0] q;

shift_register uut (
    .clk(clk),
    .reset(reset),
    .serial_in(serial_in),
    .q(q)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("shift_register.vcd");
    $dumpvars(0, tb_shift_register);

    clk = 0;
    reset = 1;
    serial_in = 0;

    #10;
    reset = 0;

    serial_in = 1;
    #10;

    serial_in = 0;
    #10;

    serial_in = 1;
    #10;

    serial_in = 1;
    #10;

    serial_in = 0;
    #10;

    $finish;
end

endmodule