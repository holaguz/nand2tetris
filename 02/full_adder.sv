module full_adder (
    input  bit x,
    input  bit y,
    input  bit z,
    output bit sum,
    output bit carry
);

  bit s1, s2, c1, c2;

  half_adder ha1 (
      .x,
      .y,
      .sum  (s1),
      .carry(c1)
  );
  half_adder ha2 (
      .x(z),
      .y(s1),
      .sum,
      .carry(c2)
  );

  always_comb begin
    carry = c1 ^ c2;
  end

endmodule
