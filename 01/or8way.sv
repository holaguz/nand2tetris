module or8way (
    input logic [7:0] in,
    output logic out
);

  always_comb begin
    out = |in;
  end

endmodule
