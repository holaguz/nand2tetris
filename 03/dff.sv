module dff (
    input  logic d,
    input  logic clk,
    output logic q,
    output logic not_q
);

  always_ff @(posedge clk) begin
    q <= d;
  end

  assign not_q = ~q;

endmodule
