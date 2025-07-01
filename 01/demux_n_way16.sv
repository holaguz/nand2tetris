module demux_n_way16 #(
    parameter unsigned WAYS
) (
    input logic [15:0] in,
    input logic [$clog2(WAYS)-1:0] sel,
    output logic [15:0] out[WAYS]
);

  localparam unsigned DEPTH = $clog2(WAYS);

  always_comb begin
    for (int i = 0; i < WAYS; ++i) begin
      if (DEPTH'(i) == sel) begin
        out[i] = in;
      end else begin
        out[i] = 16'h0;
      end
    end
  end

endmodule
