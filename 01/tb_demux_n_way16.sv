`timescale 1ns / 1ps

module tb_demux_n_way16;
  tb_demux_n_way #(.N(4)) tb_4_way_demux ();
  tb_demux_n_way #(.N(8)) tb_8_way_demux ();

endmodule

module tb_demux_n_way #(
    parameter unsigned N = 4
);
  localparam unsigned SEL_WIDTH = $clog2(N);

  logic [15:0] in;
  logic [15:0] out[N];
  logic [SEL_WIDTH-1:0] sel;

  demux_n_way16 #(
      .WAYS(N)
  ) dut (
      .in (in),
      .sel(sel),
      .out(out)
  );

  initial begin

    in = 16'h1234;

    /* Select each input */
    for (int i = 0; i < N; i++) begin
      sel = SEL_WIDTH'(i);
      #100;

      for (int j = 0; j < N; ++j) begin
        if (i == j) begin
          assert (out[j] == in)
          else $display("Test failed for i=%0d, %h!=%h", i, out[j], in);
        end else begin
          assert (out[j] == 16'h0)
          else $display("Test failed for i=%0d, %h!=%h", i, out[j], 16'h0);
        end

      end
    end

    // Indicate completion of tests
    $display("All tests for demux %0d-way completed", N);
  end

endmodule

