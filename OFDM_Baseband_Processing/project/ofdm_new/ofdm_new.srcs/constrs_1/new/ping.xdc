create_clock -period 20.000 -name clk [get_ports clk]

set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports clk]
set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports rst_n]

set_property -dict {PACKAGE_PIN L20 IOSTANDARD LVCMOS33} [get_ports touch_key]

