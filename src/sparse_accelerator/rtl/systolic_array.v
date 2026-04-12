module systolic_array #(
    parameter ROWS = 4,
    parameter COLS = 4,
    parameter DATA_WIDTH = 8,
    parameter ACC_WIDTH = 24
)(
    input  wire                   clk,
    input  wire                   rst_n,
    input  wire [DATA_WIDTH-1:0]  weights [ROWS-1:0][COLS-1:0],
    input  wire [DATA_WIDTH-1:0]  data_in [ROWS-1:0],
    output wire [ACC_WIDTH-1:0]   data_out [COLS-1:0],
    input  wire [ROWS-1:0]        zero_mask // Bitmask for zero data inputs
);

    wire [DATA_WIDTH-1:0] data_conn [ROWS-1:0][COLS:0];
    wire [ACC_WIDTH-1:0]  acc_conn  [ROWS:0][COLS-1:0];

    genvar i, j;
    generate
        for (i = 0; i < ROWS; i = i + 1) begin : row_gen
            assign data_conn[i][0] = data_in[i];
            for (j = 0; j < COLS; j = j + 1) begin : col_gen
                if (i == 0) assign acc_conn[0][j] = {ACC_WIDTH{1'b0}};
                
                pe_node #(
                    .DATA_WIDTH(DATA_WIDTH),
                    .ACC_WIDTH(ACC_WIDTH)
                ) pe (
                    .clk(clk),
                    .rst_n(rst_n),
                    .weight(weights[i][j]),
                    .data_in(data_conn[i][j]),
                    .acc_in(acc_conn[i][j]),
                    .data_out(data_conn[i][j+1]),
                    .acc_out(acc_conn[i+1][j]),
                    .is_zero(zero_mask[i])
                );
            end
        end
    endgenerate

    for (j = 0; j < COLS; j = j + 1) begin : out_gen
        assign data_out[j] = acc_conn[ROWS][j];
    end

endmodule
