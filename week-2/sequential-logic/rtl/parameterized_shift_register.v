module parameterized_shift_register #(
    parameter WIDTH = 8
) (
    input logic clk,
    input logic reset,
    input logic serial_in,
    output logic [WIDTH-1:0] q
);

always_ff @(posedge clk) begin
    if (reset)
        q <= '0;
    else
        q <= {q[WIDTH-2:0], serial_in};
end

endmodule