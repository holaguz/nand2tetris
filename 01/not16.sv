/* verilog_lint: waive module-filename */
module not_16_gate (
    input  logic [15:0] in,
    output logic [15:0] out
);

  always_comb begin
    out = ~in;
  end

endmodule
