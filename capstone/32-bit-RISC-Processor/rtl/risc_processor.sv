module risc_processor (
    input logic clk,
    input logic reset
);

    // Program Counter
    logic [31:0] pc;

    program_counter pc_unit (
        .clk(clk),
        .reset(reset),
        .pc(pc)
    );

    // Instruction Memory
    logic [31:0] instruction;

    instruction_memory imem (
        .address(pc),
        .instruction(instruction)
    );

    // Instruction fields
    logic [5:0] opcode;
    logic [4:0] rs;
    logic [4:0] rt;
    logic [4:0] rd;
    logic [5:0] funct;

    logic [15:0] immediate;
    logic [31:0] sign_extended_immediate;

    assign opcode = instruction[31:26];
    assign rs     = instruction[25:21];
    assign rt     = instruction[20:16];
    assign rd     = instruction[15:11];
    assign funct  = instruction[5:0];

    assign immediate = instruction[15:0];

    assign sign_extended_immediate =
        {{16{immediate[15]}}, immediate};

    // Control Unit
    logic       reg_write;
    logic       mem_to_reg;
    logic       mem_write;
    logic       alu_src;
    logic       branch;
    logic [1:0] alu_op;

    control_unit control (
        .opcode(opcode),
        .reg_write(reg_write),
        .mem_to_reg(mem_to_reg),
        .mem_write(mem_write),
        .alu_src(alu_src),
        .branch(branch),
        .alu_op(alu_op)
    );

    // Register File
    logic [31:0] read_data1;
    logic [31:0] read_data2;
    logic [31:0] write_data;

    logic [4:0] write_register;

    // R-type writes to RD
    // ADDI writes to RT
    assign write_register =
        (opcode == 6'b001000) ? rt : rd;

    register_file registers (
        .clk(clk),
        .reset(reset),
        .write_enable(reg_write),
        .read_addr1(rs),
        .read_addr2(rt),
        .write_addr(write_register),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    // ALU Decoder
    logic [3:0] alu_control;

    alu_decoder decoder (
        .alu_op(alu_op),
        .funct(funct),
        .alu_control(alu_control)
    );

    // ALU input selection
    logic [31:0] alu_input_b;
    logic [31:0] alu_result;
    logic        zero;

    assign alu_input_b =
        alu_src ? sign_extended_immediate : read_data2;

    alu alu_unit (
        .a(read_data1),
        .b(alu_input_b),
        .alu_control(alu_control),
        .result(alu_result),
        .zero(zero)
    );

    // Writeback
    assign write_data = alu_result;

endmodule
