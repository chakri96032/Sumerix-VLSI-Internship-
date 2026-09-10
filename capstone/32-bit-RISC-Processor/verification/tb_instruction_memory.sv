`timescale 1ns/1ps

module tb_instruction_memory;

    logic [31:0] address;
    logic [31:0] instruction;

    instruction_memory uut (
        .address(address),
        .instruction(instruction)
    );

    initial begin
        $dumpfile("instruction_memory.vcd");
        $dumpvars(0, tb_instruction_memory);

        address = 32'd0;
        #10;

        address = 32'd4;
        #10;

        address = 32'd8;
        #10;

        address = 32'd12;
        #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | Address=%0d | Instruction=%h",
                 $time, address, instruction);
    end

endmodule
