######################################################################
#
# File name : OFDM_Tx_tb_simulate.do
# Created on: Fri Mar 24 12:35:55 +0800 2023
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vsim -voptargs="+acc" -L xil_defaultlib -L fifo_generator_v13_2_5 -L xbip_utils_v3_0_10 -L axi_utils_v2_0_6 -L c_reg_fd_v12_0_6 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_6 -L xbip_dsp48_addsub_v3_0_6 -L xbip_addsub_v3_0_6 -L c_addsub_v12_0_14 -L c_mux_bit_v12_0_6 -L c_shift_ram_v12_0_14 -L xbip_bram18k_v3_0_6 -L mult_gen_v12_0_16 -L cmpy_v6_0_19 -L floating_point_v7_0_18 -L xfft_v9_1_5 -L unisims_ver -L unimacro_ver -L secureip -L xpm -lib xil_defaultlib xil_defaultlib.OFDM_Tx_tb xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {OFDM_Tx_tb_wave.do}

view wave
view structure
view signals

do {OFDM_Tx_tb.udo}

run 1000ns
