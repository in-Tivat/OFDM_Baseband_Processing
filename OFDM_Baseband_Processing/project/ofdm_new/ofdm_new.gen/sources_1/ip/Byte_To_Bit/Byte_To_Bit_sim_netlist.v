// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Mon Mar 20 09:40:57 2023
// Host        : DESKTOP-FHBQHOK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/network_shared_file/xilinx_project/ofdm_new/ofdm_new.gen/sources_1/ip/Byte_To_Bit/Byte_To_Bit_sim_netlist.v
// Design      : Byte_To_Bit
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Byte_To_Bit,fifo_generator_v13_2_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_5,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module Byte_To_Bit
   (wr_clk,
    wr_rst,
    rd_clk,
    rd_rst,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *) input wr_clk;
  input wr_rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *) input rd_clk;
  input rd_rst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [0:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;

  wire [7:0]din;
  wire [0:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [3:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [6:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [3:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "4" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "1" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "13" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "12" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "7" *) 
  (* C_RD_DEPTH = "128" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "7" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "4" *) 
  (* C_WR_DEPTH = "16" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "4" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  Byte_To_Bit_fifo_generator_v13_2_5 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[3:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[6:0]),
        .rd_en(rd_en),
        .rd_rst(rd_rst),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(1'b0),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[3:0]),
        .wr_en(wr_en),
        .wr_rst(wr_rst),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "4" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module Byte_To_Bit_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [3:0]src_in_bin;
  input dest_clk;
  output [3:0]dest_out_bin;

  wire [3:0]async_path;
  wire [2:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[1] ;
  wire [3:0]dest_out_bin;
  wire [2:0]gray_enc;
  wire src_clk;
  wire [3:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [3]),
        .I3(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[3]),
        .Q(async_path[3]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "7" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module Byte_To_Bit_xpm_cdc_gray__parameterized1
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [6:0]src_in_bin;
  input dest_clk;
  output [6:0]dest_out_bin;

  wire [6:0]async_path;
  wire [5:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [6:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [6:0]\dest_graysync_ff[1] ;
  wire [6:0]dest_out_bin;
  wire [5:0]gray_enc;
  wire src_clk;
  wire [6:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(binval[1]),
        .O(binval[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(\dest_graysync_ff[1] [6]),
        .I4(\dest_graysync_ff[1] [4]),
        .I5(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [6]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [6]),
        .I3(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[6]),
        .Q(async_path[6]),
        .R(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
QGLtnqZzRetDH6gCWT4Js6wuLlZfrNx/VJp3sfR2NF+cxypO5AxN0oDKLJJtmdrtE/ueNDg+Qf7Z
TqBNRojORA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
B6Ger3hRvfjHkaJ+W8639Kl3TzC9TogLuklOXEiMNdc4Im+DjEUzxb3DKlzu0VW3zxZqjJ3+wsW/
LnRmPCESi5Y9eRJaLFXg79EMfoj4X+nTdHAP6yCfltBADKegZ12gpnB/8ey5yn2KA74LUtPC7jna
iyjqSfsWLGnz6UdXzwk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BX+DxgMPRyZbYojCUR9Sk8Lq+3ZigBz4yMFHQkmurfdfDzyTPJCE827eGiPyTenK1QPVhEtf9g06
0BFXq/0COPuU1BWJwdkz1c4dE6/exDwhvEh+hPx3vRY6z8fDEf6aGVIXrHDvrmddehe7yMSIpo+k
aXHR06EEdfHCFY4TggYwhcJVXjkE+ApsVuyfmEfPmYjo8hCWyQyBsUWIOY03q1+MvUjjsmTwgs9g
fh5MY9ToaLfoJxPKdCpsqrBX4LJ+VDGFlAqIcqHTE2jCmPiToZAFXB7fzf1wDjFCBlJyFVDBGi0i
m+CouLSb7X1mvVhdDZgNrZDJMV688Bu3o54vew==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DaIU/Ddc8USbZ2mURzujJDWDH1JbHl5tFVOOQ2aVaUPIA71yyE38OXVLEtF8rNmujYH30nEeQ+FV
LVJ16aaHw+iiuaqorTM3K5KLohVlN+WlcEtSXHuPNHjw8ddqtzpaX7pH1zqZH+YmfCL5oaNLqDH4
rkBnUl0/Gm/hzSwKjYhXGQFYQ+gGP99OjXakzrAqZzp/Iq4gt+Z5902/JV9thd/isHQImJ0QyK8M
EKM579iPAfXGes2mbiNYHcvDmSPYmW1zlhOE++N1EKeea7j/msnKeyhlC+hGE4Xfn4TVvqgQexCT
rp/wS/MosY6WH1aKFQlFH2hEppA7KXUaQlvG+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XmWoAt4X8hrCJ5yTyug4ajJW5UhfkLNibzjihWzZ4Cr9hQSvWZoTc8rjGsLPbz6Le+/9iI5KxecS
eR0wiAO+G2IkwhZgVBeZdKoFnlnTVAyLjk9wMAFXNyJZM6b1NDbfXlPcUsC6JePvPlwwdWknkSsC
r3KvgkWAS+O3xvRmaNw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hw3Y+rShKrXiUViyNU1/O2qv6TgheLHBnFMj1i9MUGrHYqh9pLfLYUgWR7S2vj4jv4S+Ks0BpP4p
dKEqVAFmTCfQNEUHaVcFPkOHgig6L4mhLY6HUUKJoRgiQepgLi/W3V+ZZPQSQFkB3CU4MsJzhXvR
yLcpDriZy8cnAHD87Zi5DrNGBzj3kigJeM0du6lCQbxtF5aEdoaNP+YTnIFtcqYhoYnswQlYt0sV
HKgFA8VzqzL5WYnpH7+1IKmFkJBHkyqHCa9wPK0qCKnxkuDj70YzPVqQ+cocdKU+/gNdpCOdZlci
F2HTxrgfrXndJru3TiDqu4UavqAe0MNuFp3t0w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XPVggoWL6aXz+MpODTOZhEUQDa0vfEnUDaYeEHXm2vGyqKJujN2c/FFAFBeBYdJATLsIsQ+BqoPc
pBbcFYXDBfOtFIW2dH6Y1OoD65KyJ/hAq8coa21kFgq4hFat5vzZ2iIfkCpTUr4vDZO7Xne8cZO9
WsHffoTCt5rS59wWm2b8I5R8Eh2TUbQg3RCyrcnD66cvcEnlXe1CNMQ4/loVJpA4IBinBf820Wjc
vw2fZbGI0jXC+ACSHOviH63Xwmn+aRV5Ppkup7IYoon/ieKapRQeASu3TTY37xSBXiInSdtMTzJ6
+4GfO4eSHVriCk/sWbuTBzfRzoSShrnHjzz5LA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L78XuiswVcgO2gtebzL7SA9BC/jJGAM0v6S9pzmyqL+QYzRneiYeGyDmsW33jEVVSTuNjTXkBLY7
yTOKQruatwe4V0OLi6174saSAmPgerSV1GyLP7KhmusLV/N61avC9TPam+tekhKeE0tds4EnJ3et
4JdLh+SE4Z4pcuqCjB5MFneIYKKWDx7siU6oesAQtoSJOesfMchX63MhOjOHFP/ch+1gHv3T45hg
IGF7V7TrdREVE4f9631tlVJ1o2Dypsmo/76Itz5WCGlTMjAnWXN8IXxKN+PZ3dyt1wjrZm2P/td+
xiGszFnSLrRvw/HferwtSmRx8q0fiHZ88roGTw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kDX5kq2QEe25429T6vQqBCFvV1McKTJRYfK99ymVNK2GGvGLXSzgwJHwB2fj9rM0wme3zYYY0vQR
x+9F4L7KLlOVY6qY3LB59uDzyXBI3mMZaS905HXHJkdZHWtQWpfHhl27LqL+8FSluaD6F+KFfYOV
CwIOVuCIp/XjxFXpNBik7YiPt4kHOlDA97IXNLnYUn/g1csGqeNWce4UTne50ggWvLYGbTFGmTjT
N67TpUiGRVRCSv8Tax72GWFIMFZk3Tlp68ZUSQEybZMWX1U9XdMdtxfvNGhf8mi5jQJ2SupSzKu4
T/+53IN9T8aLePAiGBKKG1ZBj4y1ZyYA7XYvjw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 76944)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
