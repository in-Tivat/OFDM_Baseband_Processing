`timescale 1ns / 1ps 
///////////////////////////////////////////////////////////////////////////////////
// Company:                                                                      
// Engineer: YWang                                                                    
//                                                                                   
// Create Date: 2023-03-11  10:51:17
// Design Name:                                                                    
// Module Name: OFDM_Data_Modem.v                                                          
// Project Name:                                                                   
// Target Devices:                                                                  
// Tool versions:                                                                  
// Description:                                                                  
//                                                                                  
// Dependencies: 0                                                                  
//                                                                                  
// Revision:                                                                    
// Revision 0.01 - File Created                                                     
// Additional Comments:                                                        
//??signal?????? 1/2??????BPSK???????
//144bit-288--192--48
// 60-->120-->80-->20
// 24bit--48
//??? 60M->80M->20M                                                                             
///////////////////////////////////////////////////////////////////////////////////  
 
module   OFDM_Data_Modem
    #(
        parameter  SIGNAL_INTV_TO_QAM_FRE = 4
    )(  
    input               din_clk     ,//60M
    input               cb_clk      ,
    input               sys_clk     ,
    input               rst_n       ,
    //control signal    
    input               Tx_Clr      ,
    input [3:0]         Rate_Con    , 
    input               Signal_Flag ,
    input [6:0]         Scram_Seed  ,
    //data signal   
    input               Data_Bit    ,
    input               Data_Bit_Vld,
    output[7:0]         Dout_Re     ,
    output[7:0]         Dout_Im     ,
    output              Dout_Vld      

);              
  

//1.??
    wire        Scram_Din   ;
    wire        Scram_En    ;
    wire        Scram_Dout  ;
    wire        Scram_Vld   ;
    wire        Signal_Scram_Out;
    assign Scram_Din = Data_Bit;
    assign Scram_En = Data_Bit_Vld ;
    
    data_scramler  u_scram(   
        .clk                (din_clk            ),
        .rst_n              (rst_n              ), 
        .Scram_Din          (Scram_Din          ), 
        .Scram_En           (Scram_En           ), 
        .Scram_Seed         (Scram_Seed         ), 
        .Scram_Load         (Tx_Clr             ), 
        .Signal_Flag_In     (Signal_Flag        ),
        .Signal_Flag_Out    (Signal_Scram_Out   ),    
        .Scram_Dout         (Scram_Dout         ),
        .Scram_Vld          (Scram_Vld          ) 
    );
//2.????
    wire        Conv_Din   ;
    wire        Conv_En    ;
    wire [1:0]  Conv_Dout  ;
    wire        Conv_Vld   ;
    wire        Signal_Conv_Out;
    assign Conv_Din = Scram_Dout;
    assign Conv_En  = Scram_Vld ;
    data_conv_code u_conv( 
        .clk                (din_clk            ), //60M
        .rst_n              (rst_n              ),  
        .Conv_Din           (Conv_Din           ), //bit输入 lsb在前，msb在最后�?? 输入144bit信号 组成�??个ofdm符号
        .Signal_Flag_In     (Signal_Scram_Out   ),
        .Signal_Flag_Out    (Signal_Conv_Out    ),
        .Conv_En            (Conv_En            ), // 
        .Conv_Dout          (Conv_Dout          ),
        .Conv_Vld           (Conv_Vld           ) 
    );
//3.??
    wire [1:0]  Punt_Din ;
    wire        Punt_En  ;
    wire        Punt_Dout;
    wire        Punt_Vld ;
    wire        Signal_Punt_Out;
    wire  [1:0] SymbolLen_Con;
    assign Punt_Din = Conv_Dout ;
    assign Punt_En  = Conv_Vld  ;
    data_puncturing  u_punt( 
        .din_clk            (din_clk            ) , 
        .cb_clk             (cb_clk             ),  
        .rst_n              (rst_n              ) , 
        .Rate_Con           (Rate_Con           ),
        .Signal_Flag_In     (Signal_Conv_Out    ),
        .SymbolLen_Con      (SymbolLen_Con      ),
        .Signal_Flag_Out    (Signal_Punt_Out    ),
        .Punt_Din           (Punt_Din           ),  
        .Punt_En            (Punt_En            ),  
        .Punt_Dout          (Punt_Dout          ),
        .Punt_Vld           (Punt_Vld           )
    );
//4.??
    wire        Intv_Din ;
    wire        Intv_En  ;
    wire        Intv_Dout;
    wire        Intv_Vld ;
    wire [1:0]  Map_Type;
    assign Intv_Din = Punt_Dout;
    assign Intv_En  = Punt_Vld ;
    data_interleaver 
    #(
        .SIGNAL_INTV_TO_QAM_FRE(SIGNAL_INTV_TO_QAM_FRE)
    )
    u_intv( 
        .clk                (cb_clk             ), 
        .rst_n              (rst_n              ), 
        .Intv_Con           (SymbolLen_Con      ), 
        .Signal_Flag_In     (Signal_Punt_Out    ), 
        .Map_Type           (Map_Type           ), 
        .Intv_Din           (Intv_Din           ), 
        .Intv_En            (Intv_En            ), 
        .Intv_Dout          (Intv_Dout          ), 
        .Intv_Vld           (Intv_Vld           )
    );
//5.?????
    wire        Qam16_Din;
    wire        Qam16_En ;
    wire [7:0]  Qam16_Re ; 
    wire [7:0]  Qam16_Im ; 
    wire        Qam16_Vld; 
    wire [5:0]  Index_Out;
    assign Qam16_Din = Intv_Dout;
    assign Qam16_En  = Intv_Vld ;
    data_maping u_Qam16( 
        .cb_clk             (cb_clk             ), 
        .clk                (sys_clk            ), 
        .Tx_Clr             (Tx_Clr             ), 
        .rst_n              (rst_n              ), 
        .Map_Type           (Map_Type           ), 
        .Qam16_Din          (Qam16_Din          ), 
        .Qam16_En           (Qam16_En           ), 
        .Index_Out          (Index_Out          ), 
        .Qam16_Re           (Qam16_Re           ), 
        .Qam16_Im           (Qam16_Im           ),
        .Qam16_Vld          (Qam16_Vld          ) 
    );
   

//6.????
    wire [7:0]      Pilot_DinRe ;
    wire [7:0]      Pilot_DinIm ;
    wire            Pilot_En    ;
    wire [7:0]      Pilot_DoutRe;
    wire [7:0]      Pilot_DoutIm;
    wire            Pilot_Vld   ; 
    assign Pilot_DinRe = Qam16_Re ;
    assign Pilot_DinIm = Qam16_Im ;
    assign Pilot_En    = Qam16_Vld;
    data_pilot  u_pilot(     
        .clk                (sys_clk            ) , 
        .rst_n              (rst_n              ) , 
        .Pilot_Index        (Index_Out          ) , 
        .Pilot_DinRe        (Pilot_DinRe        ) , 
        .Pilot_DinIm        (Pilot_DinIm        ) , 
        .Pilot_En           (Pilot_En           ) , 
        .pilot_start        (Tx_Clr             ) , 
        .Pilot_DoutRe       (Pilot_DoutRe       ) , 
        .Pilot_DoutIm       (Pilot_DoutIm       ) ,
        .Pilot_Vld          (Pilot_Vld          )   
    );


    assign Dout_Re  = Pilot_DoutRe;
    assign Dout_Im  = Pilot_DoutIm;
    assign Dout_Vld = Pilot_Vld   ;




endmodule          