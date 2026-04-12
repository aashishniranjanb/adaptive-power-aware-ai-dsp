module pe_node #(
    parameter DATA_WIDTH = 8,
    parameter ACC_WIDTH = 24
)(
    input  wire                   clk,
    input  wire                   rst_n,
    input  wire [DATA_WIDTH-1:0]  weight,
    input  wire [DATA_WIDTH-1:0]  data_in,
    input  wire [ACC_WIDTH-1:0]   acc_in,
    output reg  [DATA_WIDTH-1:0]  data_out,
    output reg  [ACC_WIDTH-1:0]   acc_out,
    input  wire                   is_zero // Sparsity hint
);

    // Operand Isolation logic: If is_zero is high, we can skip the multiplication
    // to save power by gating the inputs to the multiplier.
    wire [DATA_WIDTH-1:0] gated_weight = is_zero ? {DATA_WIDTH{1'b0}} : weight;
    wire [DATA_WIDTH-1:0] gated_data   = is_zero ? {DATA_WIDTH{1'b0}} : data_in;

    reg [ACC_WIDTH-1:0] product;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_out <= {DATA_WIDTH{1'b0}};
            acc_out  <= {ACC_WIDTH{1'b0}};
            product  <= {ACC_WIDTH{1'b0}};
        end else begin
            data_out <= data_in;
            product  <= gated_weight * gated_data;
            acc_out  <= acc_in + product;
        end
    end

endmodule
