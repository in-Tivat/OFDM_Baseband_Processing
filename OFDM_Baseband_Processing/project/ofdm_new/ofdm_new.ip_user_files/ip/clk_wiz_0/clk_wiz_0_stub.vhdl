-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Mon Mar 20 09:42:18 2023
-- Host        : DESKTOP-FHBQHOK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/network_shared_file/xilinx_project/ofdm_new/ofdm_new.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.vhdl
-- Design      : clk_wiz_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz_0 is
  Port ( 
    clk_80m : out STD_LOGIC;
    clk_60m : out STD_LOGIC;
    clk_20m : out STD_LOGIC;
    clk_7_5m : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end clk_wiz_0;

architecture stub of clk_wiz_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_80m,clk_60m,clk_20m,clk_7_5m,reset,locked,clk_in1";
begin
end;
