`timescale 1ns / 1ps 
///////////////////////////////////////////////////////////////////////////////////
// Company:                                                                      
// Engineer: YWang                                                                    
//                                                                                   
// Create Date: 2023-03-05  20:16:12
// Design Name:                                                                    
// Module Name:                                                           
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

/*
    删余�?? 
    3/4 码率  6bit�??2bit �?? 4b�?? �?? 3组卷积码 删除2bit   data符号采用3/4码率
    2/3 码率  4bit�??1bit �?? 3b�?? �?? 2组卷积码 删除1bit
    1/2 码率 不删�??   signal符号直接采用1/2码率，不删余

    输出时钟有问题？？？？？？？？？
*/


// signal :1/2码率 ；data�?? 2/3码率
// signal域数�?? 3clk�??个数�??
//Rate_Con 不对signal符号调制类型做配�??
module data_puncturing( 
    input               din_clk        ,//60M
    input               cb_clk         ,//80M
    input               rst_n          ,
    input   [3:0]       Rate_Con       ,
    input               Signal_Flag_In ,
    input   [1:0]       Punt_Din       , //bit输入 lsb在前，msb在最后�?? 输入144bit信号 组成�??个ofdm符号
    input               Punt_En        , //  
    output reg [1:0]    SymbolLen_Con  ,
    output reg          Signal_Flag_Out,
    output reg          Punt_Dout      ,
    output reg          Punt_Vld       
);
    
    reg [5:0]   Puncture_in;
    reg [5:0]   Puncture_reg1;
    reg [5:0]   Puncture_reg;
    reg [2:0]   Cnt_Index;  
    reg [2:0]   Cnt_Bit; 
    reg [2:0]   Cnt_Bit_Max;
    reg         Cache_Valid;
    reg         Cache_Valid_reg1; 
    reg         Cache_Valid_reg; 
    reg         Signal_Flag1,Signal_Flag2,Signal_Flag3,Signal_Flag4;
    wire [3:0]  RATE_CON ;

    //当为signal域时，强制设置Rate类型
    assign      RATE_CON = Signal_Flag_In ? 4'b1101 : Rate_Con;

    always@(posedge din_clk or negedge rst_n ) begin
        if(!rst_n) begin
            Puncture_in <= 0; 
            Cnt_Index <= 0;
            Cache_Valid <= 0;
        end  
        else if( Punt_En ) begin  //间隔3clk 有效
            case ( RATE_CON )
			4'b1101,4'b0101,4'b1001: begin
                Puncture_in[1:0] <= Punt_Din;	// Rate is 1/2 .
                Cache_Valid <= 1'b1;
                Cnt_Index <= 0;
            end
            4'b1111,4'b0111,4'b1011,4'b0011: begin
                Puncture_in <= {Puncture_in[3:0],Punt_Din};	 // Rate is 3/4 .
                if(Cnt_Index==2)  begin
                    Cnt_Index <= 0;
                    Cache_Valid <= 1'b1;
                    end
                else  begin
                    Cnt_Index <= Cnt_Index + 1'b1;
                    Cache_Valid <= 1'b0;
                  end
            end
            4'b0001: begin
                Puncture_in <= {Puncture_in[3:0],Punt_Din};			 // Rate is 2/3 .
                if(Cnt_Index==1) begin
                    Cnt_Index <= 0;
                    Cache_Valid <= 1'b1;
                    end
                else  begin
                    Cnt_Index <= Cnt_Index + 1'b1;
                    Cache_Valid <= 1'b0;
                    end
            end  
            default:;
            endcase
        end 
        else begin
            Cache_Valid <= 1'b0;
        end
    end
    always@(posedge din_clk or negedge rst_n ) begin
        if(!rst_n) begin
            Signal_Flag1 <= 0;
        end  
        else if( ~Signal_Flag_In ) begin
            Signal_Flag1 <= 1'b0;
        end
        else if( Signal_Flag_In ) begin
            Signal_Flag1 <= 1'b1;
        end
    end


//**********************  夸时钟域 ***********************************************//
//**********************  慢时钟域到快时钟域，直接打拍处理 *************************//
//打拍
    always@(posedge cb_clk or negedge rst_n ) begin
        if(!rst_n) begin
            Signal_Flag2 <= 0; 
            Signal_Flag3 <= 0;
            Signal_Flag4 <= 0;
            Puncture_reg <= 0; 
            Puncture_reg1 <= 0;
            Cache_Valid_reg <= 0;
            Cache_Valid_reg1 <= 0;
        end  
        else  begin 
            Signal_Flag2 <= Signal_Flag1;
            Puncture_reg1 <= Puncture_in;
            Cache_Valid_reg1 <= Cache_Valid;

            Signal_Flag3 <= Signal_Flag2 ;
            Puncture_reg <= Puncture_reg1;
            Cache_Valid_reg <= ~Cache_Valid_reg && Cache_Valid_reg1;//边沿�??�??

            Signal_Flag4 <= Signal_Flag3;
        end
    end  

//output Bit count max 
    always@( * ) begin    
        if( Signal_Flag3 || Signal_Flag4 ) begin 
            Cnt_Bit_Max <= 1;
        end
        else  begin 
            case ( RATE_CON )
			4'b1101,4'b0101,4'b1001: begin
                Cnt_Bit_Max <= 1;
            end
            4'b1111,4'b0111,4'b1011,4'b0011: begin
                Cnt_Bit_Max <= 3;
            end
            4'b0001: begin
                Cnt_Bit_Max <= 2;
            end 
            default: Cnt_Bit_Max <= 1;
            endcase
        end  
    end
//output Bit count
    always@(posedge cb_clk or negedge rst_n ) begin
        if(!rst_n) begin 
            Cnt_Bit <= 0; 
        end  
        else if( Cnt_Bit>=Cnt_Bit_Max ) begin
            Cnt_Bit <= 1'b0;
        end  
        else if( Cnt_Bit>0 ) begin
            Cnt_Bit <= Cnt_Bit + 1'b1;
        end 
        else if( Cache_Valid_reg ) begin
            Cnt_Bit <= 1'b1;
        end  
    end 
    
//output valid
    always@(posedge cb_clk or negedge rst_n ) begin
        if(!rst_n) begin
            Punt_Dout <= 0; 
            Punt_Vld <= 0; 
        end   
        else if( Cache_Valid_reg || (Cnt_Bit>0) )  begin 
            case(Cnt_Bit_Max)
            1:begin
                case ( Cnt_Bit )
                    0: begin
                        Punt_Dout <= Puncture_reg[0];
                        Punt_Vld  <= 1'b1;
                    end
                    1: begin
                        Punt_Dout <= Puncture_reg[1];
                        Punt_Vld  <= 1'b1;
                    end
                default:;
                endcase
            end
            2:begin
                case ( Cnt_Bit )
                    0: begin
                        Punt_Dout <= Puncture_reg[0];
                        Punt_Vld  <= 1'b1;
                    end
                    1: begin
                        Punt_Dout <= Puncture_reg[1];
                        Punt_Vld  <= 1'b1;
                    end
                    2: begin
                        Punt_Dout <= Puncture_reg[2];
                        Punt_Vld  <= 1'b1;
                    end
                default:;
                endcase
            end
            3:begin
                case ( Cnt_Bit )
                    0: begin
                        Punt_Dout <= Puncture_reg[0];
                        Punt_Vld  <= 1'b1;
                    end
                    1: begin
                        Punt_Dout <= Puncture_reg[1];
                        Punt_Vld  <= 1'b1;
                    end
                    2: begin
                        Punt_Dout <= Puncture_reg[2];
                        Punt_Vld  <= 1'b1;
                    end
                    3: begin
                        Punt_Dout <= Puncture_reg[5];
                        Punt_Vld  <= 1'b1;
                    end
                default: Punt_Vld <= 0;
                endcase
            end
            default: Punt_Vld <= 0;
            endcase
        end
        else begin 
            Punt_Vld <= 1'b0;
        end
    end
   
   //SymbolLen_Con
    always@(posedge cb_clk or negedge rst_n ) begin
        if(!rst_n) begin
            SymbolLen_Con <= 0;   
        end   
        else if( Signal_Flag3 || Signal_Flag4) begin 
            SymbolLen_Con <= 2'b00; 
        end
        else if( Cnt_Bit==0 ) begin 
            case ( RATE_CON )
			4'b1101,4'b1111: begin
                SymbolLen_Con <= 2'b00;  //Len==48
            end
            4'b0101,4'b0111: begin
                SymbolLen_Con <= 2'b01;   //Len ==96
            end
            4'b1001,4'b1011: begin
                SymbolLen_Con <= 2'b10;  //Len ==192
            end 
            4'b0001,4'b0011: begin
                SymbolLen_Con <= 2'b11;  //Len ==288  
            end
            default:SymbolLen_Con <= 2'b00;
            endcase
        end  
    end

    always@(posedge cb_clk or negedge rst_n ) begin
        if(!rst_n) begin
            Signal_Flag_Out <= 0;
        end   
        else if( Signal_Flag3 || Signal_Flag4) begin 
            Signal_Flag_Out <= 1;
        end
        else begin 
            Signal_Flag_Out <= 0;
        end  
    end

endmodule   


/*
   // /cnt_index
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin
            Index_Max <= 0; 
        end  
        else if( Signal_Flag_In ) begin  
			Index_Max <= 24; 
        end
        else begin 
            case ( RATE_CON )
			4'b1101:Index_Max <= 24; //不删
            4'b1111:Index_Max <= 36; //3�??1
            4'b0101:Index_Max <= 48; //不删		
            4'b0111:Index_Max <= 72; //3�??1
            4'b1001:Index_Max <= 96; //不删
            4'b1011:Index_Max <= 144;//3�??1
            4'b0001:Index_Max <= 192;//4�??1
            4'b0011:Index_Max <= 216;//3�??1	 
            default:Index_Max <= 0;
            endcase
        end
    end
*/