module mux16 (
    input logic [15:0] a,
    input logic [15:0] b,
    input logic sel,
    output logic [15:0] out
);

  always_comb begin
    if (!sel) begin
      out = a;
    end else begin
      out = b;
    end
  end

endmodule
