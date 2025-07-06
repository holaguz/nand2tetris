`timescale 1ns / 100ps
// verilog_lint: waive macro-name-style
`define assert_out(expected) assert(out == expected);

module tb_RAM;
  tb_RAM8 tb_RAM8 ();

  initial begin
    $dumpfile("waveform.vcd");  // Specify the waveform file
    $dumpvars(0, tb_RAM);  // Dump all variables in the testbench
  end
endmodule

module tb_RAM8;
  localparam unsigned SIZE = 8;
  localparam unsigned WIDTH = $clog2(SIZE);
  localparam unsigned CLKPERIOD = 10;

  logic [15:0] in, out;
  logic [WIDTH-1:0] address;
  logic load, clk;

  RAM #(.SIZE) dut (.*);

  initial begin
    clk = 0;
    forever #(CLKPERIOD / 2) clk = ~clk;
  end

  initial begin
    $monitor("t: %04d - in=%b, load=%b, out=%b", $time, in, load, out);
    in = 0;
    load = 0;
    address = 0;
    #CLKPERIOD;
    `assert_out(0);
    in = 0;
    load = 0;
    address = 0;
    #CLKPERIOD;
    `assert_out(0);

    in = 16'd11111;
    load = 0;
    address = 0;
    #(CLKPERIOD / 2);
    `assert_out(0);
    in = 16'd11111;
    load = 0;
    address = 0;
    #(CLKPERIOD / 2);
    `assert_out(0);

    in = 16'd11111;
    load = 1;
    address = 1;
    #(CLKPERIOD / 2);
    `assert_out(0);
    in = 16'd11111;
    load = 1;
    address = 1;
    #(CLKPERIOD / 2);
    `assert_out(16'd11111);

    in = 16'd11111;
    load = 0;
    address = 0;
    #(CLKPERIOD / 2);
    `assert_out(0);
    in = 16'd11111;
    load = 0;
    address = 0;
    #(CLKPERIOD / 2);
    `assert_out(0);

    in = 16'd3333;
    load = 0;
    address = 3;
    #(CLKPERIOD / 2);
    `assert_out(0);
    in = 16'd3333;
    load = 0;
    address = 3;
    #(CLKPERIOD / 2);
    `assert_out(0);

    in = 16'd3333;
    load = 1;
    address = 3;
    #(CLKPERIOD / 2);
    `assert_out(0);
    in = 16'd3333;
    load = 1;
    address = 3;
    #(CLKPERIOD / 2);
    `assert_out(16'd3333);

    in = 16'd3333;
    load = 0;
    address = 3;
    #(CLKPERIOD / 2);
    `assert_out(16'd3333);
    in = 16'd3333;
    load = 0;
    address = 3;
    #(CLKPERIOD / 2);
    `assert_out(16'd3333);

    in = 16'd3333;
    load = 0;
    address = 1;
    #(CLKPERIOD / 2);
    `assert_out(16'd11111);
    in = 16'd3333;
    load = 0;
    address = 1;
    #(CLKPERIOD / 2);
    `assert_out(16'd11111);

    in = 16'd7777;
    load = 1;
    address = 7;
    #(CLKPERIOD / 2);
    `assert_out(16'd0);
    in = 16'd7777;
    load = 1;
    address = 7;
    #(CLKPERIOD / 2);
    `assert_out(16'd7777);

    in = 16'd7777;
    load = 0;
    address = 7;
    #(CLKPERIOD / 2);
    `assert_out(16'd7777);
    in = 16'd7777;
    load = 0;
    address = 7;
    #(CLKPERIOD / 2);
    `assert_out(16'd7777);

    in = 16'd7777;
    load = 0;
    address = 0;
    #1;
    `assert_out(16'd0);
    in = 16'd7777;
    load = 0;
    address = 1;
    #1;
    `assert_out(16'd11111);
    in = 16'd7777;
    load = 0;
    address = 2;
    #1;
    `assert_out(16'd0);
    in = 16'd7777;
    load = 0;
    address = 3;
    #1;
    `assert_out(16'd3333);
    in = 16'd7777;
    load = 0;
    address = 4;
    #1;
    `assert_out(16'd0);
    in = 16'd7777;
    load = 0;
    address = 5;
    #1;
    `assert_out(16'd0);
    in = 16'd7777;
    load = 0;
    address = 6;
    #1;
    `assert_out(16'd0);
    in = 16'd7777;
    load = 0;
    address = 7;
    #1;
    `assert_out(16'd7777);

    $display("All tests passed.");
    $finish;
  end
endmodule
