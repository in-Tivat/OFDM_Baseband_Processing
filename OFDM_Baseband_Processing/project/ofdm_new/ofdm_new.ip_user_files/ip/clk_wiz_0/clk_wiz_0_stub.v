// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Mon Mar 20 09:42:18 2023
// Host        : DESKTOP-FHBQHOK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/network_shared_file/xilinx_project/ofdm_new/ofdm_new.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_80m, clk_60m, clk_20m, clk_7_5m, reset, locked, 
  clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_80m,clk_60m,clk_20m,clk_7_5m,reset,locked,clk_in1" */;
  output clk_80m;
  output clk_60m;
  output clk_20m;
  output clk_7_5m;
  input reset;
  output locked;
  input clk_in1;
endmodule
