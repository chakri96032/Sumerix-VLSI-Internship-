module instruction_memory (
    input  logic [31:0] address,
    output logic [31:0] instruction
);

logic [31:0] memory [0:15];

initial begin

    // ADDI R1, R0, 10
    memory[0] = 32'h2001000A;

    // ADDI R2, R0, 20
    memory[1] = 32'h20020014;

    // ADD R3, R1, R2
    memory[2] = 32'h00221820;

    memory[3]  = 32'h00000000;
    memory[4]  = 32'h00000000;
    memory[5]  = 32'h00000000;
    memory[6]  = 32'h00000000;
    memory[7]  = 32'h00000000;
    memory[8]  = 32'h00000000;
    memory[9]  = 32'h00000000;
    memory[10] = 32'h00000000;
    memory[11] = 32'h00000000;
    memory[12] = 32'h00000000;
    memory[13] = 32'h00000000;
    memory[14] = 32'h00000000;
    memory[15] = 32'h00000000;

end

always_comb begin
    instruction = memory[address[5:2]];
end

endmodule
