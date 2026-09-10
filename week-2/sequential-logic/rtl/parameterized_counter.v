module parameterized_counter #(
    parameter WIDTH = 8
) (
    input logic clk,
    input logic reset,
    output logic [WIDTH-1:0] q
);

always_ff @(posedge clk) begin
    if (reset)
        q <= '0;
    else
        q <= q + 1'b1;
end

endmodule