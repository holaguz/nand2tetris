module adder_16 (
    input  [15:0] x,
    input  [15:0] y,
    output [15:0] sum
);

  wire [16:0] c;
  assign c[0] = 0;
  genvar i;

  generate
    for (i = 0; i < 16; ++i) begin : g_adder_chain
      full_adder fa (
          .x(x[i]),
          .y(y[i]),
          .z(c[i]),
          .sum(sum[i]),
          .carry(c[i+1])
      );
    end
  endgenerate
endmodule
