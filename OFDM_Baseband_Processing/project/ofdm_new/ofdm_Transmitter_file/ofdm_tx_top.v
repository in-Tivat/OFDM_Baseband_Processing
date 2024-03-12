`timescale 1ns / 1ps 
///////////////////////////////////////////////////////////////////////////////////
// Company:                                                                      
// Engineer: YWang                                                                    
//                                                                                   
// Create Date: 2023-03-10  11:36:53
// Design Name:                                                                    
// Module Name: ofdm_top.v                                                          
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
//                                                                                   
/////////////////////////////////////////////////////////////////////////////////// 
module   ofdm_tx_top(  
    //global
    input               sys_clk_in      ,
    input               sys_rst_n       ,

    //data out  ??I/O??
 (* mark_debug = "true" *)   output  [7:0]       Dout_Im         ,
 (* mark_debug = "true" *)   output  [7:0]       Dout_Re         ,
 (* mark_debug = "true" *)   output              Dout_Vld        ,
    output  [2:0]       Dout_TxPwr      , //??????

    //MAC  interface   
    output              mac_clk         ,//clock = 7.5MHz
    output              Phy_Status      ,//?MAC?????PHY?????1??????????0?????         
    input               Txstart_Req     ,//?MAC?????????????
    input   [20:0]      Tx_Param        ,//????????PSDU????Rate???????TxPWR  
    input   [7:0]       Din             ,//?1/2???2/3??,16-QAM?????OFDM?????18bytes??
    input               Din_Vld         ,//????
    output              Din_Req          //?MAC?????OFDM????????4us       
                
);      

//***********************  varible definition **********************************//
    wire    locked;
    wire    rst_n = sys_rst_n && locked;

    wire    cb_clk ; 
    wire    din_clk;
    wire    sys_clk; 


    wire                Train_Start_En;
    wire                Modem_Bit     ; 
    wire                Modem_Bit_Vld ; 
   
   
    wire    [5:0]       IFFT_Out_Index;
  (* mark_debug = "true" *)  wire    [7:0]       IFFT_Out_Re   ;
  (* mark_debug = "true" *)  wire    [7:0]       IFFT_Out_Im   ;
  (* mark_debug = "true" *)  wire                IFFT_Out_Vld  ;
   
    wire                Tx_Clr        ; 
    wire    [3:0]       Rate_Con      ; 
    wire                Signal_Flag   ; 
    wire    [6:0]       Scram_Seed    ;  
 (* mark_debug = "true" *)   wire    [7:0]       M_Dout_Re     ; 
 (* mark_debug = "true" *)   wire    [7:0]       M_Dout_Im     ; 
 (* mark_debug = "true" *)   wire                M_Dout_Vld    ; 
 (* mark_debug = "true" *)   wire    [7:0]       Cp_Out_Re     ;
 (* mark_debug = "true" *)   wire    [7:0]       Cp_Out_Im     ;
 (* mark_debug = "true" *)   wire                Cp_Out_Vld    ;


    //symbol_train module signal 
    wire [7:0]       Train_Im   ;
    wire [7:0]       Train_Re   ;
    wire             Train_Vld  ;
    wire [8:0]       Train_Index;
    wire             Train_Done ;



//*********************** logical functon **********************************//

    







//***********************  module instances **********************************//

    clk_wiz_0   u_pll
     (
      // Clock out ports
      .clk_80m (  cb_clk  ),
      .clk_60m (  din_clk  ),
      .clk_20m (  sys_clk  ),
      .clk_7_5m(  mac_clk   ),
      // Status and control signals
      .reset (~sys_rst_n),
      .locked ( locked ),
     // Clock in ports
      .clk_in1(sys_clk_in)
     );
 

//????????
    symbol_train  u_train (
        .clk                (sys_clk        ),
        .rst_n              (rst_n          ),
        .Tx_Clr             (Tx_Clr         ),
        .Start_En           (Train_Start_En ),    
        .Train_Im           (Train_Im       ),    
        .Train_Re           (Train_Re       ),    
        .Train_Vld          (Train_Vld      ),    
        .Train_Index        (Train_Index    ),
        .Train_Done         (Train_Done     )

    );
      
    OFDM_Data_Modem u_Modem(  
        .din_clk            (din_clk        ),//60M
        .cb_clk             (cb_clk         ),
        .sys_clk            (sys_clk        ),
        .rst_n              (rst_n          ), 
        .Tx_Clr             (Tx_Clr         ),
        .Rate_Con           (Rate_Con       ), 
        .Signal_Flag        (Signal_Flag    ),
        .Scram_Seed         (Scram_Seed     ), 
        .Data_Bit           (Modem_Bit      ),
        .Data_Bit_Vld       (Modem_Bit_Vld  ),
        .Dout_Re            (M_Dout_Re      ),
        .Dout_Im            (M_Dout_Im      ),
        .Dout_Vld           (M_Dout_Vld     )  
    ); 

    IFFT u_ifft(  
        .clk_80m            (cb_clk         ),//80M 
        .sys_clk            (sys_clk        ),//20M 
        .rst_n              (rst_n          ),   
        .Dout_Index         (IFFT_Out_Index ),
        .Dout_Re            (IFFT_Out_Re    ), 
        .Dout_Im            (IFFT_Out_Im    ),
        .Dout_Vld           (IFFT_Out_Vld   ),
        .Din_Re             (M_Dout_Re      ),
        .Din_Im             (M_Dout_Im      ),
        .Din_En             (M_Dout_Vld     )  
    ); 
 
    cp_add  u_cp_add(
        .clk                (sys_clk        ),
        .rst_n              (rst_n          ),
        .Din_Re             (IFFT_Out_Re    ),
        .Din_Im             (IFFT_Out_Im    ),
        .Din_En             (IFFT_Out_Vld   ),
        .Din_Index          (IFFT_Out_Index ),
        .Dout_Re            (Cp_Out_Re      ),
        .Dout_Im            (Cp_Out_Im      ),
        .Dout_Vld           (Cp_Out_Vld     )    	
    );	
    assign Dout_Im  =  Train_Vld ? Train_Re  : Cp_Out_Re  ;
    assign Dout_Re  =  Train_Vld ? Train_Im  : Cp_Out_Im  ;
    assign Dout_Vld =  Train_Vld ? Train_Vld : Cp_Out_Vld ;

        

//MCU control module 
    Trans_MCU u_Trans_MCU(  
        .rst_n                  (rst_n              ),
        .mac_clk                (mac_clk            ),
        .clk_20m                (sys_clk            ),
        .clk_60m                (din_clk            ), 
        .Phy_Status             (Phy_Status         ),
        .Txstart_Req            (Txstart_Req        ),
        .Tx_Param               (Tx_Param           ),
        .Din                    (Din                ),
        .Din_Vld                (Din_Vld            ),
        .Din_Req                (Din_Req            ), 
        .Tx_Clr                 (Tx_Clr             ), 
        .Train_Start_En         (Train_Start_En     ), 
        .Modem_Bit              (Modem_Bit          ), 
        .Modem_Bit_Vld          (Modem_Bit_Vld      ), 
        .Signal_Flag            (Signal_Flag        ), 
        .Rate_Con               (Rate_Con           ), 
        .TxPWR                  (Dout_TxPwr         ), 
        .Scram_Seed             (Scram_Seed         )   
    );  

 
                   
                   
endmodule          