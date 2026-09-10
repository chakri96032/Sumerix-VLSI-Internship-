module control_unit (
    input  logic [5:0] opcode,

    output logic       reg_write,
    output logic       mem_to_reg,
    output logic       mem_write,
    output logic       alu_src,
    output logic       branch,
    output logic [1:0] alu_op
);

always_comb begin

    // Default values
    reg_write  = 1'b0;
    mem_to_reg = 1'b0;
    mem_write  = 1'b0;
    alu_src    = 1'b0;
    branch     = 1'b0;
    alu_op     = 2'b00;

    case (opcode)

        // R-type
        6'b000000: begin
            reg_write = 1'b1;
            alu_src   = 1'b0;
            alu_op    = 2'b10;
        end

        // LW
        6'b100011: begin
            reg_write  = 1'b1;
            mem_to_reg = 1'b1;
            alu_src    = 1'b1;
            alu_op     = 2'b00;
        end

        // SW
        6'b101011: begin
            mem_write = 1'b1;
            alu_src   = 1'b1;
            alu_op    = 2'b00;
        end

        // BEQ
        6'b000100: begin
            branch = 1'b1;
            alu_src = 1'b0;
            alu_op = 2'b01;
        end

        // ADDI
        6'b001000: begin
            reg_write = 1'b1;
            alu_src   = 1'b1;
            alu_op    = 2'b00;
        end

        default: begin
            // Keep default control signals
        end

    endcase

end

endmodule
