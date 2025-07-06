module RAM #(
    unsigned SIZE
) (
    input logic [15:0] in,
    input logic clk,
    input logic load,
    input logic [$clog2(SIZE)-1:0] address,
    output logic [15:0] out
);

  localparam unsigned WIDTH = $clog2(SIZE);

  logic [SIZE-1:0] reg_loads;
  logic [SIZE-1:0][15:0] reg_outs;

  genvar i;
  for (i = 0; i < SIZE; ++i) begin : gen_registers
    Register #(16) word (
        .in,
        .clk,
        .load(reg_loads[i]),
        .out (reg_outs[i])
    );
  end

  always_comb begin
    reg_loads = 'b0;
    if (load) reg_loads[address] = 1'b1;
  end

  assign out = reg_outs[address];

endmodule
