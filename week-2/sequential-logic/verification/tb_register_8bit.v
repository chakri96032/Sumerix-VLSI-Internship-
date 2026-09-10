`timescale 1ns/1ps

module tb_register_8bit;

logic clk;
logic reset;
logic [7:0] d;
logic [7:0] q;

register_8bit uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("register_8bit.vcd");
    $dumpvars(0, tb_register_8bit);

    clk = 0;
    reset = 1;
    d = 8'b00000000;

    #10;
    reset = 0;

    d = 8'b10101010;
    #10;

    d = 8'b11110000;
    #10;

    d = 8'b01010101;
    #10;

    d = 8'b11001100;
    #10;

    $finish;
end

endmodule