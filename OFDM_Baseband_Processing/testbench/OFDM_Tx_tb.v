`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/10 10:39:29
// Design Name: 
// Module Name: OFDM_Tx_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define OFDM_Tx_tb
`ifdef  OFDM_Tx_tb

module OFDM_Tx_tb;

parameter  T = 20;   

reg               sys_clk_in  ; 
reg               sys_rst_n   ; 
wire  [7:0]       Dout_Im     ; 
wire  [7:0]       Dout_Re     ; 
wire              Dout_Vld    ; 
wire  [2:0]       Dout_TxPwr  ;  
wire              mac_clk     ;  
wire              Phy_Status  ;
reg               Txstart_Req ; 
reg   [20:0]      Tx_Param    ; 
reg   [7:0]       Din         ; 
reg               Din_Vld     ; 

wire              Din_Req     ; 
  
initial begin
        sys_clk_in = 1'b0;   
end
//50Mhz 
always #(T/2) sys_clk_in = ~sys_clk_in;     

parameter TX_PARAMETER ={12'd360-3, 6'd36,3'd0} ;  
 
    ofdm_tx_top u_test(  
    //global
        .sys_clk_in             (sys_clk_in         ),
        .sys_rst_n              (sys_rst_n          ), 
        .Dout_Im                (Dout_Im            ),
        .Dout_Re                (Dout_Re            ),
        .Dout_Vld               (Dout_Vld           ),
        .Dout_TxPwr             (Dout_TxPwr         ),  
        . mac_clk               (mac_clk            ), 
        .Phy_Status             (Phy_Status         ),   
        .Txstart_Req            (Txstart_Req        ), 
        .Tx_Param               (Tx_Param           ), 
        .Din                    (Din                ), 
        .Din_Vld                (Din_Vld            ), 
        .Din_Req                (Din_Req            )  
                
    );   

      always@(posedge mac_clk ) begin
        if( Din_Req ) begin
            if( Din_Vld ) Din = Din + $random(Din+142);
            else Din = 8'h55;
            Din_Vld = 1;
        end  
        else 
            Din_Vld = 0; 
        end


 initial begin 
        sys_rst_n    = 1'b0;      
        Txstart_Req = 0;
        Tx_Param    = 0;
        Din         = 0;
        Din_Vld     = 0;
    #(20*T);
       sys_rst_n  = 1'b1;  
    
    #(500*T);
    @(posedge mac_clk);
        Txstart_Req =1;
        Tx_Param =TX_PARAMETER;
    @(posedge mac_clk);
    @(posedge mac_clk);
        Txstart_Req = 0;

    @(Phy_Status==1); 
    @(Phy_Status==0);
    @(posedge mac_clk); 

	#(20000*T)  ;
	$stop;

end


endmodule
`endif  