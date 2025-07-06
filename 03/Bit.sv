module Bit (
    input  logic in,
    input  logic load,
    input  logic clk,
    output logic out
);

  always_ff @(posedge clk) begin
    if (load) out <= in;
    else out <= out;
  end

endmodule
