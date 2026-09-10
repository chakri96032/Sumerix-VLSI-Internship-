`timescale 1ns/1ps

module tb_parameterized_shift_register;

logic clk;
logic reset;
logic serial_in;
logic [3:0] q;

parameterized_shift_register #(
    .WIDTH(4)
) uut (
    .clk(clk),
    .reset(reset),
    .serial_in(serial_in),
    .q(q)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("parameterized_shift_register_4bit.vcd");
    $dumpvars(0, tb_parameterized_shift_register);

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

    serial_in = 1;
    #10;

    $finish;
end

endmodule