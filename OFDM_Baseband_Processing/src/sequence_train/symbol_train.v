`timescale 1ns / 1ps 
///////////////////////////////////////////////////////////////////////////////////
// Company:                                                                      
// Engineer: YWang                                                                    
//                                                                                   
// Create Date: 2023-03-10  14:22:41
// Design Name:                                                                    
// Module Name: symbol_train.v                                                          
// Project Name:                                                                   
// Target Devices:                                                                  
// Tool versions:                                                                  
// Description:                                                                  
//                                                                                  
// Dependencies: 0                                                                  
//                                                                                  
// Revision:                                                                    
// Revision 0.01 - File Created                                                     
// Additional Comments:????????????????                                                     
//                                                                                   
/////////////////////////////////////////////////////////////////////////////////// 
module   symbol_train(  
    input               clk         ,   
    input               rst_n       ,   
    input               Tx_Clr      ,   
    input               Start_En    ,

    output  [7:0]       Train_Im    ,
    output  [7:0]       Train_Re    ,
    output              Train_Vld   ,
    output  [8:0]       Train_Index ,
    output              Train_Done           
);              

    wire                STS_Start_En;
 (* mark_debug = "true" *)   wire    [7:0]       STS_Im      ;
 (* mark_debug = "true" *)   wire    [7:0]       STS_Re      ;
 (* mark_debug = "true" *)   wire                STS_Vld     ;
    wire    [7:0]       STS_Index   ;
    wire                STS_Done    ;

    wire                LTS_Start_En;
 (* mark_debug = "true" *)   wire    [7:0]       LTS_Im      ;
 (* mark_debug = "true" *)   wire    [7:0]       LTS_Re      ;
 (* mark_debug = "true" *)   wire                LTS_Vld     ;      
    wire    [7:0]       LTS_Index   ;
    wire                LTS_Done    ;

    STS_generator  u_STS
    (
        .clk                (clk            ),
        .rst_n              (rst_n          ),
        .Tx_Clr             (Tx_Clr         ),
        .Start_En           (STS_Start_En   ),
        .STS_Im             (STS_Im         ),
        .STS_Re             (STS_Re         ),
        .STS_Vld            (STS_Vld        ),
        .STS_Index          (STS_Index      ),
        .STS_Done           (STS_Done       )

    );


    LTS_generator  u_LTS
    (
        .clk                (clk            ),
        .rst_n              (rst_n          ),
        .Tx_Clr             (Tx_Clr         ),
        .Start_En           (LTS_Start_En   ),
        .LTS_Im             (LTS_Im         ),
        .LTS_Re             (LTS_Re         ),
        .LTS_Vld            (LTS_Vld        ),
        .LTS_Index          (LTS_Index      ),
        .LTS_Done           (LTS_Done       )

    );



    assign Train_Im = STS_Vld ? STS_Im : LTS_Vld ? LTS_Im : 8'b0 ; 
    assign Train_Re = STS_Vld ? STS_Re : LTS_Vld ? LTS_Re : 8'b0 ; 
    assign Train_Vld = STS_Vld ? 1'b1 : LTS_Vld ? 1'b1 : 1'b0;
    assign Train_Index = STS_Index + LTS_Index;
    assign Train_Done = LTS_Done;

    assign STS_Start_En = Start_En;
    assign LTS_Start_En = STS_Done;

                   
endmodule          