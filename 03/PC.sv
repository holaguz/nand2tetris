module PC (
    input logic [15:0] in,
    input logic reset,
    input logic load,
    input logic inc,
    input logic clk,
    output logic [15:0] out
);

  logic [15:0] reg_in;
  logic update_reg;
  assign update_reg = load || inc || reset;

  Register #(
      .WIDTH(16)
  ) r (
      .in  (reg_in),
      .load(update_reg),
      .clk,
      .out
  );

  always_ff @(posedge clk) begin
    if (reset) reg_in <= 16'h0;
    else if (load) reg_in <= in;
    else if (inc) reg_in <= out + 16'h1;
    else reg_in <= out;
  end

endmodule
