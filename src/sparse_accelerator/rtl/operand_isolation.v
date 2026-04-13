module operand_isolation #(
    parameter WIDTH = 8
)(
    input  wire             clk,
    input  wire             gate_en, // When 1, gate the inputs
    input  wire [WIDTH-1:0] data_in,
    output reg  [WIDTH-1:0] data_out
);

    // Operand isolation logic to reduce switching activity
    // When gate_en is active, the output is held constant (0)
    // to prevent propagation of signal changes into downstream combinational logic.
    always @(posedge clk) begin
        if (gate_en)
            data_out <= {WIDTH{1'b0}};
        else
            data_out <= data_in;
    end

endmodule
