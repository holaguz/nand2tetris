module inc_16 (
    input  [15:0] in,
    output [15:0] out
);

  logic [15:0] one = 16'h1;
  adder_16 fa (
      .x  (in),
      .y  (one),
      .sum(out)
  );

endmodule
