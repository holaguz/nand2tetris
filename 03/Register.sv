module Register #(
    parameter unsigned WIDTH = 16
) (
    input logic [WIDTH-1:0] in,
    input logic load,
    input logic clk,
    output logic [WIDTH-1:0] out
);

  genvar i;
  for (i = 0; i < WIDTH; ++i) begin : gen_
    Bit Bit_ (
        .in (in[i]),
        .load,
        .clk,
        .out(out[i])
    );
  end

endmodule
