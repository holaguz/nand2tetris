module demux (
    input  logic in,
    input  logic sel,
    output logic out_a,
    output logic out_b
);

  always_comb begin
    if (sel == 0) begin
      out_a = in;
      out_b = 'b0;
    end else begin
      out_a = 'b0;
      out_b = in;
    end
  end

endmodule
