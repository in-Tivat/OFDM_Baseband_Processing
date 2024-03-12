/*
    卷积编码 (1,6,2) //1输入，深度6,2输出

    Sa(x) = x^6 + x^5 + x^3 + x^2 + 1
    Sb(x) = x^6 + x^3 + x^2 + x^1 + 1
*/
`timescale 1ns / 1ps 
///////////////////////////////////////////////////////////////////////////////////
// Company:                                                                      
// Engineer: YWang                                                                    
//                                                                                   
// Create Date: 2023-03-11  13:05:12
// Design Name:                                                                    
// Module Name:     data_conv_code.v                                                      
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

module data_conv_code( 
    input               clk         , //60M
    input               rst_n       , 
    input               Signal_Flag_In, 
    output reg         Signal_Flag_Out,
//    
    input               Conv_Din   , //bit输入 lsb在前，msb在后  
    input               Conv_En    , // 
    output reg  [1:0]   Conv_Dout  ,
    output reg          Conv_Vld   
); 
    reg     [5:0]   shift_reg;
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin
            shift_reg <= 0;
            Conv_Dout <= 0;
            Conv_Vld  <= 0; 
        end  
        else if( Conv_En ) begin
            Conv_Dout[0] <= shift_reg[5] + shift_reg[4] + shift_reg[2] + shift_reg[1] + Conv_Din; 
            Conv_Dout[1] <= shift_reg[5] + shift_reg[2] + shift_reg[1] + shift_reg[0] + Conv_Din; 
            Conv_Vld  <= 1;
            shift_reg <= {shift_reg[4:0],Conv_Din}; //移位寄存器  
        end
        else begin  
            Conv_Vld  <= 0; 
        end
    end
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin 
            Signal_Flag_Out <= 0;
        end  
        else if( Signal_Flag_In ) begin 
            Signal_Flag_Out <= 1'b1;
        end
        else if( ~Signal_Flag_In ) begin   
            Signal_Flag_Out <= 1'b0;
        end
    end

endmodule   