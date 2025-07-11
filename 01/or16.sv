/* verilog_lint: waive module-filename */
module or_16_gate (
    input  logic [15:0] a,
    input  logic [15:0] b,
    output logic [15:0] out
);

  always_comb begin
    out = a | b;
  end

endmodule
