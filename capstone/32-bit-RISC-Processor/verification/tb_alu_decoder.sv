`timescale 1ns/1ps

module tb_alu_decoder;

    logic [1:0] alu_op;
    logic [5:0] funct;
    logic [3:0] alu_control;

    alu_decoder uut (
        .alu_op(alu_op),
        .funct(funct),
        .alu_control(alu_control)
    );

    initial begin

        $dumpfile("alu_decoder.vcd");
        $dumpvars(0, tb_alu_decoder);

        // Load/Store -> ADD
        alu_op = 2'b00;
        funct = 6'b000000;
        #10;

        // Branch -> SUB
        alu_op = 2'b01;
        funct = 6'b000000;
        #10;

        // R-type ADD
        alu_op = 2'b10;
        funct = 6'b100000;
        #10;

        // R-type SUB
        funct = 6'b100010;
        #10;

        // R-type AND
        funct = 6'b100100;
        #10;

        // R-type OR
        funct = 6'b100101;
        #10;

        // R-type XOR
        funct = 6'b100110;
        #10;

        $finish;

    end

    initial begin
        $monitor("Time=%0t | ALU_OP=%b | Funct=%b | ALU_Control=%b",
                 $time, alu_op, funct, alu_control);
    end

endmodule
