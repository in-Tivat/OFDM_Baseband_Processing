create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 16384 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 2 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list u_test/u_pll/inst/clk_80m]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 4 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {u_test/u_Trans_MCU/Rate_Con[0]} {u_test/u_Trans_MCU/Rate_Con[1]} {u_test/u_Trans_MCU/Rate_Con[2]} {u_test/u_Trans_MCU/Rate_Con[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {u_test/u_Trans_MCU/Din[0]} {u_test/u_Trans_MCU/Din[1]} {u_test/u_Trans_MCU/Din[2]} {u_test/u_Trans_MCU/Din[3]} {u_test/u_Trans_MCU/Din[4]} {u_test/u_Trans_MCU/Din[5]} {u_test/u_Trans_MCU/Din[6]} {u_test/u_Trans_MCU/Din[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 21 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {u_test/u_Trans_MCU/Tx_Param[0]} {u_test/u_Trans_MCU/Tx_Param[1]} {u_test/u_Trans_MCU/Tx_Param[2]} {u_test/u_Trans_MCU/Tx_Param[3]} {u_test/u_Trans_MCU/Tx_Param[4]} {u_test/u_Trans_MCU/Tx_Param[5]} {u_test/u_Trans_MCU/Tx_Param[6]} {u_test/u_Trans_MCU/Tx_Param[7]} {u_test/u_Trans_MCU/Tx_Param[8]} {u_test/u_Trans_MCU/Tx_Param[9]} {u_test/u_Trans_MCU/Tx_Param[10]} {u_test/u_Trans_MCU/Tx_Param[11]} {u_test/u_Trans_MCU/Tx_Param[12]} {u_test/u_Trans_MCU/Tx_Param[13]} {u_test/u_Trans_MCU/Tx_Param[14]} {u_test/u_Trans_MCU/Tx_Param[15]} {u_test/u_Trans_MCU/Tx_Param[16]} {u_test/u_Trans_MCU/Tx_Param[17]} {u_test/u_Trans_MCU/Tx_Param[18]} {u_test/u_Trans_MCU/Tx_Param[19]} {u_test/u_Trans_MCU/Tx_Param[20]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {u_test/Cp_Out_Im[0]} {u_test/Cp_Out_Im[1]} {u_test/Cp_Out_Im[2]} {u_test/Cp_Out_Im[3]} {u_test/Cp_Out_Im[4]} {u_test/Cp_Out_Im[5]} {u_test/Cp_Out_Im[6]} {u_test/Cp_Out_Im[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {u_test/Dout_Im[0]} {u_test/Dout_Im[1]} {u_test/Dout_Im[2]} {u_test/Dout_Im[3]} {u_test/Dout_Im[4]} {u_test/Dout_Im[5]} {u_test/Dout_Im[6]} {u_test/Dout_Im[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 8 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {u_test/M_Dout_Im[0]} {u_test/M_Dout_Im[1]} {u_test/M_Dout_Im[2]} {u_test/M_Dout_Im[3]} {u_test/M_Dout_Im[4]} {u_test/M_Dout_Im[5]} {u_test/M_Dout_Im[6]} {u_test/M_Dout_Im[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 8 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {u_test/u_train/STS_Re[0]} {u_test/u_train/STS_Re[1]} {u_test/u_train/STS_Re[2]} {u_test/u_train/STS_Re[3]} {u_test/u_train/STS_Re[4]} {u_test/u_train/STS_Re[5]} {u_test/u_train/STS_Re[6]} {u_test/u_train/STS_Re[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 8 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {u_test/IFFT_Out_Re[0]} {u_test/IFFT_Out_Re[1]} {u_test/IFFT_Out_Re[2]} {u_test/IFFT_Out_Re[3]} {u_test/IFFT_Out_Re[4]} {u_test/IFFT_Out_Re[5]} {u_test/IFFT_Out_Re[6]} {u_test/IFFT_Out_Re[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 8 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {u_test/Dout_Re[0]} {u_test/Dout_Re[1]} {u_test/Dout_Re[2]} {u_test/Dout_Re[3]} {u_test/Dout_Re[4]} {u_test/Dout_Re[5]} {u_test/Dout_Re[6]} {u_test/Dout_Re[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 8 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {u_test/u_train/STS_Im[0]} {u_test/u_train/STS_Im[1]} {u_test/u_train/STS_Im[2]} {u_test/u_train/STS_Im[3]} {u_test/u_train/STS_Im[4]} {u_test/u_train/STS_Im[5]} {u_test/u_train/STS_Im[6]} {u_test/u_train/STS_Im[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 8 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {u_test/Cp_Out_Re[0]} {u_test/Cp_Out_Re[1]} {u_test/Cp_Out_Re[2]} {u_test/Cp_Out_Re[3]} {u_test/Cp_Out_Re[4]} {u_test/Cp_Out_Re[5]} {u_test/Cp_Out_Re[6]} {u_test/Cp_Out_Re[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 8 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {u_test/M_Dout_Re[0]} {u_test/M_Dout_Re[1]} {u_test/M_Dout_Re[2]} {u_test/M_Dout_Re[3]} {u_test/M_Dout_Re[4]} {u_test/M_Dout_Re[5]} {u_test/M_Dout_Re[6]} {u_test/M_Dout_Re[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 8 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {u_test/u_train/LTS_Im[0]} {u_test/u_train/LTS_Im[1]} {u_test/u_train/LTS_Im[2]} {u_test/u_train/LTS_Im[3]} {u_test/u_train/LTS_Im[4]} {u_test/u_train/LTS_Im[5]} {u_test/u_train/LTS_Im[6]} {u_test/u_train/LTS_Im[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 8 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {u_test/IFFT_Out_Im[0]} {u_test/IFFT_Out_Im[1]} {u_test/IFFT_Out_Im[2]} {u_test/IFFT_Out_Im[3]} {u_test/IFFT_Out_Im[4]} {u_test/IFFT_Out_Im[5]} {u_test/IFFT_Out_Im[6]} {u_test/IFFT_Out_Im[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 8 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {u_test/u_train/LTS_Re[0]} {u_test/u_train/LTS_Re[1]} {u_test/u_train/LTS_Re[2]} {u_test/u_train/LTS_Re[3]} {u_test/u_train/LTS_Re[4]} {u_test/u_train/LTS_Re[5]} {u_test/u_train/LTS_Re[6]} {u_test/u_train/LTS_Re[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list u_test/Cp_Out_Vld]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list u_test/u_Trans_MCU/Din_Req]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list u_test/u_Trans_MCU/Din_Vld]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list u_test/Dout_Vld]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list u_test/IFFT_Out_Vld]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list u_test/u_train/LTS_Vld]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list u_test/M_Dout_Vld]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list u_test/u_Trans_MCU/Modem_Bit]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list u_test/u_Trans_MCU/Modem_Bit_Vld]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list u_test/u_Trans_MCU/Phy_Status]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list u_test/u_Trans_MCU/Signal_Flag]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list u_test/u_train/STS_Vld]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list u_test/u_Trans_MCU/Tx_Clr]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list u_test/u_Trans_MCU/Txstart_Req]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_clk_80m]
