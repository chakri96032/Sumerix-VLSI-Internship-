`timescale 1ns/1ps

module tb_d_flip_flop;

logic clk;
logic reset;
logic d;
logic q;

d_flip_flop uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("d_flip_flop.vcd");
    $dumpvars(0, tb_d_flip_flop);

    clk = 0;
    reset = 1;
    d = 0;

    #10;
    reset = 0;

    d = 1;
    #10;

    d = 0;
    #10;

    d = 1;
    #10;

    $finish;
end

endmodule