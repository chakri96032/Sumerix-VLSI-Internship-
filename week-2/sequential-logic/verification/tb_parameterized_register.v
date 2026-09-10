`timescale 1ns/1ps

module tb_parameterized_register;

logic clk;
logic reset;
logic [15:0] d;
logic [15:0] q;

parameterized_register #(
    .WIDTH(16)
) uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("parameterized_register.vcd");
    $dumpvars(0, tb_parameterized_register);

    clk = 0;
    reset = 1;
    d = 8'b00000000;

    #10;
    reset = 0;

   d = 16'b1010101010101010;
   #10;

   d = 16'b1111000011110000;
   #10;

   d = 16'b0101010101010101;
   #10;

    $finish;
end

endmodule