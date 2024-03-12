`timescale 1ns / 1ps 
///////////////////////////////////////////////////////////////////////////////////
// Company:                                                                      
// Engineer: YWang                                                                    
//                                                                                   
// Create Date: 2023-03-10  14:53:45
// Design Name:                                                                    
// Module Name: LTS_generator.v                                                          
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
module   LTS_generator(  
    input                   clk         ,   
    input                   rst_n       ,   
    input                   Tx_Clr      ,   
    input                   Start_En    ,

    output reg [7:0]        LTS_Im      ,
    output reg [7:0]        LTS_Re      ,
    output reg              LTS_Vld     ,
    output reg [7:0]        LTS_Index   ,
    output reg              LTS_Done             
);                 

    reg  [15:0] Long_Mem [63:0];
    reg  [6:0]  i,j;
    wire        LTS_Req;

    assign LTS_Req = Start_En || (LTS_Index>0);

    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin  //时域样值 Re      Im
            Long_Mem[0]  <= {8'b00101000 , 8'b00000000};
	        Long_Mem[1]  <= {8'b11111111 , 8'b11100001};
	        Long_Mem[2]  <= {8'b00001010 , 8'b11100100};
	        Long_Mem[3]  <= {8'b00011001 , 8'b00010101};
	        Long_Mem[4]  <= {8'b00000101 , 8'b00000111};
	        Long_Mem[5]  <= {8'b00001111 , 8'b11101010};
	        Long_Mem[6]  <= {8'b11100011 , 8'b11110010};
	        Long_Mem[7]  <= {8'b11110110 , 8'b11100101};
	        Long_Mem[8]  <= {8'b00011001 , 8'b11111001};
	        Long_Mem[9]  <= {8'b00001110 , 8'b00000001};
	        Long_Mem[10] <= {8'b00000000 , 8'b11100011};
	        Long_Mem[11] <= {8'b11011101 , 8'b11110100};
	        Long_Mem[12] <= {8'b00000110 , 8'b11110001};
	        Long_Mem[13] <= {8'b00001111 , 8'b11111100};
	        Long_Mem[14] <= {8'b11111010 , 8'b00101001};
	        Long_Mem[15] <= {8'b00011111 , 8'b11111111};
	        Long_Mem[16] <= {8'b00010000 , 8'b11110000};
	        Long_Mem[17] <= {8'b00001001 , 8'b00011001};
	        Long_Mem[18] <= {8'b11110001 , 8'b00001010};
	        Long_Mem[19] <= {8'b11011110 , 8'b00010001};
	        Long_Mem[20] <= {8'b00010101 , 8'b00011000};
	        Long_Mem[21] <= {8'b00010010 , 8'b00000100};
	        Long_Mem[22] <= {8'b11110001 , 8'b00010101};
	        Long_Mem[23] <= {8'b11110010 , 8'b11111010};
	        Long_Mem[24] <= {8'b11110111 , 8'b11011001};
	        Long_Mem[25] <= {8'b11100001 , 8'b11111100};
	        Long_Mem[26] <= {8'b11011111 , 8'b11111011};
	        Long_Mem[27] <= {8'b00010011 , 8'b11101101};
	        Long_Mem[28] <= {8'b11111111 , 8'b00001110};
	        Long_Mem[29] <= {8'b11101000 , 8'b00011101};
	        Long_Mem[30] <= {8'b00010111 , 8'b00011011};
	        Long_Mem[31] <= {8'b00000011 , 8'b00011001};
	        Long_Mem[32] <= {8'b11011000 , 8'b00000000};
	        Long_Mem[33] <= {8'b00000011 , 8'b11100111};
	        Long_Mem[34] <= {8'b00010111 , 8'b11100101};
	        Long_Mem[35] <= {8'b11101000 , 8'b11100011};
	        Long_Mem[36] <= {8'b11111111 , 8'b11110010};
	        Long_Mem[37] <= {8'b00010011 , 8'b00010011};
	        Long_Mem[38] <= {8'b11011111 , 8'b00000101};
	        Long_Mem[39] <= {8'b11100001 , 8'b00000100};
	        Long_Mem[40] <= {8'b11110111 , 8'b00100111};
	        Long_Mem[41] <= {8'b11110010 , 8'b00000110};
	        Long_Mem[42] <= {8'b11110001 , 8'b11101011};
	        Long_Mem[43] <= {8'b00010010 , 8'b11111100};
	        Long_Mem[44] <= {8'b00010101 , 8'b11101000};
	        Long_Mem[45] <= {8'b11011110 , 8'b11101111};
	        Long_Mem[46] <= {8'b11110001 , 8'b11110110};
	        Long_Mem[47] <= {8'b00001001 , 8'b11100111};
	        Long_Mem[48] <= {8'b00010000 , 8'b00010000};
	        Long_Mem[49] <= {8'b00011111 , 8'b00000001};
	        Long_Mem[50] <= {8'b11111010 , 8'b11010111};
	        Long_Mem[51] <= {8'b00001111 , 8'b00000100};
	        Long_Mem[52] <= {8'b00000110 , 8'b00001111};
	        Long_Mem[53] <= {8'b11011101 , 8'b00001100};
	        Long_Mem[54] <= {8'b00000000 , 8'b00011101};
	        Long_Mem[55] <= {8'b00001110 , 8'b11111111};
	        Long_Mem[56] <= {8'b00011001 , 8'b00000111};
	        Long_Mem[57] <= {8'b11110110 , 8'b00011011};
	        Long_Mem[58] <= {8'b11100011 , 8'b00001110};
	        Long_Mem[59] <= {8'b00001111 , 8'b00010110};
	        Long_Mem[60] <= {8'b00000101 , 8'b11111001};
	        Long_Mem[61] <= {8'b00011001 , 8'b11101011};
	        Long_Mem[62] <= {8'b00001010 , 8'b00011100};
	        Long_Mem[63] <= {8'b11111111 , 8'b00011111};

            LTS_Vld <= 0;
            LTS_Index <=  0;
            LTS_Done <= 0;
            LTS_Re <= 0;
            LTS_Im <= 0;
            i <= 0;
            j <= 0;
           end  
        else if( Tx_Clr  ) begin 
            i <= 0;
            j <= 0;
            LTS_Vld <= 0;
            LTS_Index <= 0;
            LTS_Done <= 0;
        end
        else if( LTS_Req && (LTS_Index<161) ) begin
            LTS_Index <= LTS_Index + 1;
            LTS_Vld <=  1'b1; 
            if(i==0)    begin
                if(j==31) begin 
                    j <= 0;
                    i <= i+ 1; 
                    LTS_Re <= Long_Mem[j+32][15:8];  
                    LTS_Im <= Long_Mem[j+32][7:0];
                end
                else  begin
                    if(i==0 && j==0) begin
                        LTS_Re <= 8'b11101100; //短训练序列到长训练序列的窗口函数
                        LTS_Im <= Long_Mem[j+32][7:0];
                    end
                    else begin
                        LTS_Re <= Long_Mem[j+32][15:8];  
                        LTS_Im <= Long_Mem[j+32][7:0];
                    end
                    j <= j + 1;
                end
            end
            else if( i==1 || i==2 )    begin
                if(j==63) begin 
                    j <= 0;
                    i <= i+ 1; 
                    LTS_Re <= Long_Mem[j][15:8];  
                    LTS_Im <= Long_Mem[j][7:0];
                end
                else  begin 
                    LTS_Re <= Long_Mem[j][15:8];  
                    LTS_Im <= Long_Mem[j][7:0]; 
                    j <= j + 1;
                end
            end
            else begin  //  加窗处理
                LTS_Re <= Long_Mem[0][15:8]>>1; //加窗，左移一位  
                LTS_Im <= Long_Mem[0][7:0]>>1; 
                LTS_Done <= 1'b1;
            end
        end 
        else begin 
            LTS_Vld <= 1'b0;
        end
    end


                   
endmodule          

    


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	





























































