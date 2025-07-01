/* verilog_lint: waive module-filename */
module not_gate (
    input  bit in,
    output bit out
);

  always_comb begin
    out = !in;
  end

endmodule
