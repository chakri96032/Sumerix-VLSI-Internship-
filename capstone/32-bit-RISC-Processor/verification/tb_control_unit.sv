`timescale 1ns/1ps

module tb_control_unit;

    logic [5:0] opcode;

    logic       reg_write;
    logic       mem_to_reg;
    logic       mem_write;
    logic       alu_src;
    logic       branch;
    logic [1:0] alu_op;

    control_unit uut (
        .opcode(opcode),
        .reg_write(reg_write),
        .mem_to_reg(mem_to_reg),
        .mem_write(mem_write),
        .alu_src(alu_src),
        .branch(branch),
        .alu_op(alu_op)
    );

    initial begin

        $dumpfile("control_unit.vcd");
        $dumpvars(0, tb_control_unit);

        // R-type
        opcode = 6'b000000;
        #10;

        // LW
        opcode = 6'b100011;
        #10;

        // SW
        opcode = 6'b101011;
        #10;

        // BEQ
        opcode = 6'b000100;
        #10;

        // ADDI
        opcode = 6'b001000;
        #10;

        $finish;

    end

    initial begin
        $monitor("Time=%0t | Opcode=%b | RegWrite=%b | MemToReg=%b | MemWrite=%b | ALUSrc=%b | Branch=%b | ALUOp=%b",
                 $time, opcode, reg_write, mem_to_reg,
                 mem_write, alu_src, branch, alu_op);
    end

endmodule
