`timescale 1ns / 1ps

module tb_mux_n_way16;
  tb_mux_n_way #(.N(4)) tb_4_way_mux ();
  tb_mux_n_way #(.N(8)) tb_8_way_mux ();

endmodule

module tb_mux_n_way #(
    parameter unsigned N = 4
);
  localparam unsigned SEL_WIDTH = $clog2(N);

  logic [15:0] in[N];
  logic [15:0] out;
  logic [SEL_WIDTH-1:0] sel;

  mux_n_way16 #(
      .WAYS(N)
  ) dut (
      .in (in),
      .sel(sel),
      .out(out)
  );

  initial begin
    /* Setup the number of inputs */
    for (int i = 0; i < N; i++) begin
      in[i] = 16'h1111 + 16'(i);
    end

    /* Select each input */
    for (int i = 0; i < N; i++) begin
      sel = SEL_WIDTH'(i);
      #10;
      assert (out == in[i])
      else $error("Test failed for sel = %0d", i);
    end

    // Indicate completion of tests
    $display("All tests for Mux %0d-way completed", N);
  end

endmodule

