module mux (
    input  logic a,
    input  logic b,
    input  logic sel,
    output logic out
);

  always_comb begin
    if (sel) begin
      out = b;
    end else begin
      out = a;
    end
  end

endmodule
