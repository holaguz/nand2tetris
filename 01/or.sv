/* verilog_lint: waive module-filename */
module or_gate (
    input  bit a,
    input  bit b,
    output bit out
);

  always_comb begin
    out = a || b;
  end

endmodule
