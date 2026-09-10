module down_counter_4bit (
    input logic clk,
    input logic reset,
    output logic [3:0] q
);

always_ff @(posedge clk) begin
    if (reset)
        q <= 4'b1111;
    else
        q <= q - 1'b1;
end

endmodule