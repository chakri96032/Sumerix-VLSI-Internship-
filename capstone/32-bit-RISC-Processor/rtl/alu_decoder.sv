module alu_decoder (
    input  logic [1:0] alu_op,
    input  logic [5:0] funct,

    output logic [3:0] alu_control
);

always_comb begin

    case (alu_op)

        // Load / Store
        2'b00:
            alu_control = 4'b0000;   // ADD

        // Branch
        2'b01:
            alu_control = 4'b0001;   // SUB

        // R-type instructions
        2'b10: begin
            case (funct)

                6'b100000: alu_control = 4'b0000; // ADD
                6'b100010: alu_control = 4'b0001; // SUB
                6'b100100: alu_control = 4'b0010; // AND
                6'b100101: alu_control = 4'b0011; // OR
                6'b100110: alu_control = 4'b0100; // XOR

                default:   alu_control = 4'b0000;

            endcase
        end

        default:
            alu_control = 4'b0000;

    endcase

end

endmodule
