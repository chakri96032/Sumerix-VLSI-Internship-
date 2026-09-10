`timescale 1ns/1ps

module tb_up_counter_4bit;

logic clk;
logic reset;
logic [3:0] q;

up_counter_4bit uut (
    .clk(clk),
    .reset(reset),
    .q(q)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("up_counter_4bit.vcd");
    $dumpvars(0, tb_up_counter_4bit);

    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    #160;

    $finish;
end

endmodule