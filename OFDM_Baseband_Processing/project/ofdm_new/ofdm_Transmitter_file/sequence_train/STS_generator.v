`timescale 1ns / 1ps 
///////////////////////////////////////////////////////////////////////////////////
// Company:                                                                      
// Engineer: YWang                                                                    
//                                                                                   
// Create Date: 2023-03-10  14:53:45
// Design Name:                                                                    
// Module Name: STS_generator.v                                                          
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
module   STS_generator(  
    input                   clk         ,   
    input                   rst_n       ,   
    input                   Tx_Clr      ,   
    input                   Start_En    ,

    output reg [7:0]        STS_Im      ,
    output reg [7:0]        STS_Re      ,
    output reg              STS_Vld     ,
    output reg [7:0]        STS_Index   ,
    output reg              STS_Done             
);                 

    reg  [15:0] Short_Mem [15:0];
    reg  [3:0]  i,j;
    wire        STS_Req;

    assign STS_Req = Start_En || (STS_Index>0);

    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin  //时域样值Re       Im
            Short_Mem[0]  <= {8'b00001100,8'b00001100};
            Short_Mem[1]  <= {8'b11011110,8'b00000001};
            Short_Mem[2]  <= {8'b11111101,8'b11101100};
            Short_Mem[3]  <= {8'b00100100,8'b11111101};
            Short_Mem[4]  <= {8'b00011000,8'b00000000};
            Short_Mem[5]  <= {8'b00100100,8'b11111101};
            Short_Mem[6]  <= {8'b11111101,8'b11101100};
            Short_Mem[7]  <= {8'b11011110,8'b00000001};
            Short_Mem[8]  <= {8'b00001100,8'b00001100};
            Short_Mem[9]  <= {8'b00000001,8'b11011110};
            Short_Mem[10] <= {8'b11101100,8'b11111101};
            Short_Mem[11] <= {8'b11111101,8'b00100100};
            Short_Mem[12] <= {8'b00000000,8'b00011000};
            Short_Mem[13] <= {8'b11111101,8'b00100100};
            Short_Mem[14] <= {8'b11101100,8'b11111101};
            Short_Mem[15] <= {8'b00000001,8'b11011110};

            STS_Vld <= 0;
            STS_Index <=  0;
            STS_Done <= 0;
            STS_Re <= 0;
            STS_Im <= 0;
            i <= 0;
            j <= 0;
           end  
        else if( Tx_Clr  ) begin 
            i <= 0;
            j <= 0;
            STS_Vld <= 0;
            STS_Index <= 0;
            STS_Done <= 0;
        end
        else if( STS_Req && (STS_Index<161) ) begin
            STS_Index <= STS_Index + 1;
            STS_Vld <=  1'b1; 
            if(i<10)    begin
                if(j==15) begin 
                    j <= 0;
                    i <= i+ 1; 
                    STS_Re <= Short_Mem[j][15:8];  
                    STS_Im <= Short_Mem[j][7:0];
                end
                else  begin
                    if(i==0 && j==0) begin
                        STS_Re <= Short_Mem[j][15:8]>>1; //加窗，左移一 
                        STS_Im <= Short_Mem[j][7:0]>>1;//注意：Short_Mem【0】为正数
                    end
                    else begin
                        STS_Re <= Short_Mem[j][15:8];  
                        STS_Im <= Short_Mem[j][7:0];
                    end
                    j <= j + 1;
                end
            end
            else begin  //最后一位
                STS_Re <= Short_Mem[0][15:8]>>1; //加窗，左移一  第一个值
                STS_Im <= Short_Mem[0][7:0]>>1; 
                STS_Done <= 1'b1;
            end
        end 
        else begin 
            STS_Vld <= 1'b0;
        end
    end


                   
endmodule          