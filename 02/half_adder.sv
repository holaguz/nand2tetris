module half_adder (
    input  bit x,
    input  bit y,
    output bit sum,
    output bit carry
);

  always_comb begin
    sum   = x ^ y;
    carry = x & y;
  end

endmodule
