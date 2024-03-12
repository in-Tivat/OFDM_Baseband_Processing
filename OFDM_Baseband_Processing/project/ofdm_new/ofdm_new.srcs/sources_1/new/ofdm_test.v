`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/24 13:31:26
// Design Name: 
// Module Name: ofdm_test
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


module ofdm_test(
    input       rst_n,
    input       clk ,
    input       touch_key 
    
    
    );
    parameter KEY_WAIT_TIME = 16_00_00;
    wire  mac_clk;
    wire Din_Req;
    wire Txstart_Req;
    reg  Txstart_Req1,Txstart_Req2;
    
    reg  [19:0] cnt;
    reg touch_key_d0,touch_key_d1;
    
    reg Din_Vld;
    reg [7:0] Din;
    reg [31:0]  cnt_test;
    
    always @(posedge mac_clk or negedge rst_n) begin
    if(!rst_n) begin
        touch_key_d0 <= 1'b0;
        touch_key_d1 <= 1'b0;
    end
    else begin
        touch_key_d0 <= touch_key;
        touch_key_d1 <= touch_key_d0;
    end
end

    always @(posedge mac_clk or negedge rst_n) begin
        if(!rst_n)  begin
            cnt  <= 0; 
        end  
        else if( (cnt==KEY_WAIT_TIME) || (~touch_key_d1 & touch_key_d0) || touch_key )  begin
            cnt   <= 0; 
        end
        else  if( touch_key_d1 & ~touch_key_d0 ) begin 
            cnt  <= 1; 
        end
        else  if( cnt>0) begin 
            cnt  <= cnt + 1'b1; 
        end
    end
    
    always @(posedge mac_clk or negedge rst_n) begin
    if(!rst_n) begin 
        Txstart_Req1 <= 1'b0;
        Txstart_Req2 <= 1'b0;
    end
    else begin
        Txstart_Req1 <= Txstart_Req2;
        Txstart_Req2 <= (cnt==KEY_WAIT_TIME) ; 
    end
end
    assign Txstart_Req = (cnt==KEY_WAIT_TIME) || Txstart_Req2 || Txstart_Req1;
    
   
    
    always@(posedge mac_clk or negedge rst_n ) begin
        if( ~rst_n ) begin
            cnt_test <= 0;
        end  
        else 
            cnt_test <= cnt_test + 1; 
   end
   always@(posedge mac_clk or negedge rst_n ) begin
        if( ~rst_n ) begin
            Din <= 0;
            Din_Vld <= 0;
        end
        else if( Din_Req ) begin
            Din <= { cnt_test[19],cnt_test[0],cnt_test[3],cnt_test[2],cnt_test[10],cnt_test[15],cnt_test[20],cnt_test[26] };
            Din_Vld = 1;
        end  
        else 
            Din_Vld = 0; 
   end
    
    
    
    
    
    
    
    
    ofdm_tx_top u_test(  
    //global
        .sys_clk_in             (clk         ),
        .sys_rst_n              (rst_n          ), 
      //  .Dout_Im                (Dout_Im            ),
      //  .Dout_Re                (Dout_Re            ),
       // .Dout_Vld               (Dout_Vld           ),
       // .Dout_TxPwr             (Dout_TxPwr         ),  
         .mac_clk               (mac_clk            ) ,//c 
       // .Phy_Status             (Phy_Status         ),//å‘M 
        .Txstart_Req            (Txstart_Req        ),//ç”±M 
        .Tx_Param               ( {12'd90-3, 6'd36,3'd0}           ),//å¾…å 
        .Din                    (Din                ),//ä»? 
        .Din_Vld                (Din_Vld            ),//æ•°æ 
        .Din_Req                (Din_Req            ) //å‘M 
                
    ); 
    
    
endmodule
