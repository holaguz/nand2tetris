module mux_n_way16 #(
    parameter unsigned WAYS = 4
) (
    input logic [15:0] in[WAYS],
    input logic [$clog2(WAYS)-1:0] sel,
    output logic [15:0] out
);

  localparam unsigned DEPTH = $clog2(WAYS);

  always_comb begin
    out = in[sel];
  end

endmodule
