 
`timescale 1ns / 1ps 
///////////////////////////////////////////////////////////////////////////////////
// Company:                                                                      
// Engineer: YWang                                                                    
//                                                                                   
// Create Date: 2023-03-27  09:34:31
// Design Name:                                                                    
// Module Name:      data_scramler.v                                                     
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
//    ???
//   s(x) = x^7 + x^4 + 1                                                                                
/////////////////////////////////////////////////////////////////////////////////// 
 
module data_scramler( 
    input               clk         , //20m
    input               rst_n       , 
//    
    input               Scram_Din   ,  
    input               Scram_En    ,  
    input       [6:0]   Scram_Seed  ,//?????   
    input               Scram_Load  ,//????????????  ,?????
    input               Signal_Flag_In,
    output reg          Signal_Flag_Out,
    output reg          Scram_Dout  ,
    output reg          Scram_Vld   
);

    reg     [6:0]   shift_reg;
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin
            shift_reg <= 0;
            Scram_Dout <= 0;
            Scram_Vld  <= 0; 
        end 
        else if( Scram_Load ) begin 
            shift_reg <= Scram_Seed; 
            Scram_Vld <= 0; 
        end
        else if( Scram_En && ~Signal_Flag_In ) begin
            Scram_Dout <= shift_reg[6] + shift_reg[3] + Scram_Din; //s(x) = x^7 + x^4 + 1 
            Scram_Vld  <= 1; 
            shift_reg <= {shift_reg[5:0],(shift_reg[6]+shift_reg[3])};  
        end
        else if( Scram_En && Signal_Flag_In ) begin
            Scram_Dout <= Scram_Din; 
            Scram_Vld  <= 1; 
        end
        else begin  
            Scram_Vld  <= 0; 
        end
    end
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin 
            Signal_Flag_Out <= 0;
        end  
        else if( ~Signal_Flag_In ) begin 
            Signal_Flag_Out <= 0; 
        end
        else if(  Signal_Flag_In ) begin 
            Signal_Flag_Out <= 1;
        end 
    end

endmodule   