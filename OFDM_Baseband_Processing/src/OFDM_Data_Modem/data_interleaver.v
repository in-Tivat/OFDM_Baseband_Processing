 
`timescale 1ns / 1ps 
///////////////////////////////////////////////////////////////////////////////////
// Company:                                                                      
// Engineer: YWang                                                                    
//                                                                                   
// Create Date: 2023-03-27  09:18:34
// Design Name:                                                                    
// Module Name:      data_interleaver.v                                                     
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
         
module data_interleaver
#(
    parameter   SIGNAL_INTV_TO_QAM_FRE = 4 // QAM_FRONT_FREQUENCY / QAM_BACK_FREQUENCY  80M/20M
)(    
    input               clk             ,  
    input               rst_n           , 
//    
    input               Intv_Din        ,   
    input               Intv_En         , 
    input       [1:0]   Intv_Con        ,//TYPE 48bit,96bit,192bit,288bit
    input               Signal_Flag_In  ,
 
    output reg  [1:0]   Map_Type        , 
    output reg          Intv_Dout       ,
    output reg          Intv_Vld        
);            
     
    reg             i;
    reg             wea  ;
    reg     [8:0]   addra; 
    reg             dina ;  
    wire             web  ;
    reg     [8:0]   addrb;  
    wire            doutb;

    reg     [8:0]   Cnt_Index;
    wire            Add_Cnt_Index;
    wire            End_Cnt_Index;
    reg     [8:0]   Cnt_Index_Max;

    reg     [1:0]   Intv_Con1;
    
    reg         Buf_A_Flag;
    reg         Buf_B_Flag;
    reg  [8:0]  Data_Buf_Len; 
    reg         Signal_Flag_Reg; 

    
    reg             Back_12Bits;
    reg     [3:0]   Cnt_Bit_12; 
    reg     [8:0]   Cnt_Bit; 
    
    reg [2:0]   Signal_Interval_Time;
    reg [5:0]   Signal_Bit_Cnt;
 
    localparam  N_48 =2'b00,
                N_96 =2'b01,
                N_192=2'b10,
                N_288=2'b11;


 

//*************************** Write Data Buffer ****************************//
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin 
            Cnt_Index   <= 0;        
        end    
        else if( End_Cnt_Index ) begin
            Cnt_Index <= 0;
        end
        else if( Add_Cnt_Index ) begin
            Cnt_Index <= Cnt_Index + 1'b1;
        end
    end
    assign Add_Cnt_Index = Intv_En;
    assign End_Cnt_Index = Add_Cnt_Index &&( Cnt_Index == Cnt_Index_Max-1);

    always@( * ) begin  
        case ( Intv_Con )
		N_48 :  Cnt_Index_Max = 48; 
        N_96 :  Cnt_Index_Max = 96;  
        N_192:  Cnt_Index_Max = 192;  
        N_288:  Cnt_Index_Max = 288;  
        default:Cnt_Index_Max = 48;
        endcase 
    end

    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin 
            wea   <= 0;
            addra <= 0;
            dina  <= 0;     
            i <= 0;
        end   
        else if( Add_Cnt_Index && (i==0) ) begin 
            case(Intv_Con)
            N_48:begin //N = 48  
                wea   <= 1;
                addra <= Cnt_Index[3:0] + (Cnt_Index[3:0]<<1) + Cnt_Index[8:4] ; //Cnt_Index *3
                dina  <= Intv_Din;   
            end 
            N_96:begin //N = 96
                wea   <= 1;
                addra <= (Cnt_Index[3:0]<<1)  + (Cnt_Index[3:0]<<2) + Cnt_Index[8:4] ; //Cnt_Index *6
                dina  <= Intv_Din;   
            end
            N_192:begin //N = 192
                wea   <= 1;
                addra <= (Cnt_Index[3:0]<<3)  + (Cnt_Index[3:0]<<2) + Cnt_Index[8:4]; //Cnt_Index *12
                dina  <= Intv_Din;  
            end
            N_288:begin //N = 288
                wea   <= 1;
                addra <= (Cnt_Index[3:0]<<4)  + (Cnt_Index[3:0]<<1) + Cnt_Index[8:4]; //Cnt_Index *18
                dina  <= Intv_Din;  
            end 
            default:;
            endcase
            if(End_Cnt_Index)  i <= 1;
        end 
        else if( Add_Cnt_Index && (i==1) ) begin 
            case(Intv_Con)
            N_48:begin //N = 48 
                wea   <= 1;
                addra <= Cnt_Index[3:0] + (Cnt_Index[3:0]<<1) + Cnt_Index[8:4] + 288; //Cnt_Index *6
                dina  <= Intv_Din;  
            end
            N_96:begin //N = 96
                wea   <= 1;
                addra <= (Cnt_Index[3:0]<<1)  + (Cnt_Index[3:0]<<2) + Cnt_Index[8:4] + 288; //Cnt_Index *6
                dina  <= Intv_Din; 
            end
            N_192:begin //N = 192
                wea   <= 1;
                addra <= (Cnt_Index[3:0]<<3)  + (Cnt_Index[3:0]<<2) + Cnt_Index[8:4] + 288; //Cnt_Index *12
                dina  <= Intv_Din;  
            end
            N_288:begin //N = 288
                wea   <= 1;
                addra <= (Cnt_Index[3:0]<<4)  + (Cnt_Index[3:0]<<1) + Cnt_Index[8:4] + 288; //Cnt_Index *18
                dina  <= Intv_Din;  
            end 
            default:;
            endcase
            if(End_Cnt_Index)  i <= 0;
        end 
        else begin
            wea <= 0; 
        end
    end

    sync_buffer  spram(
        .rst_n          (rst_n          )  ,
	    .clka           (clk            )  , 
	    .wea            (wea            )  ,
	    .addra          (addra          )  ,
	    .dina           (dina           )  ,
	    .douta          (               )  ,
       // . (                .          )
	    .clkb           (clk            )  ,
	    .web            (web           )  ,
	    .addrb          (addrb          )  ,
	    .dinb           (               )  ,
	    .doutb          (doutb          )  
    );
    assign web =1'b0;

    
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin 
            Buf_A_Flag   <= 0;       
        end 
        else if( Buf_A_Flag && (Cnt_Bit== Data_Buf_Len-1) ) begin
            Buf_A_Flag <= 0;  
        end
        else if( End_Cnt_Index && (i==0) ) begin
            Buf_A_Flag <= 1; 
        end 
    end
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin 
            Buf_B_Flag   <= 0;   
        end 
        else if( Buf_B_Flag && (Cnt_Bit== Data_Buf_Len-1)) begin
            Buf_B_Flag <= 0;  
        end
        else if( End_Cnt_Index && (i==1) ) begin
            Buf_B_Flag <= 1; 
        end 
    end
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin        
            Signal_Flag_Reg <=0;
            Data_Buf_Len <= 0;
        end 
        else if( Signal_Flag_Reg && (Signal_Bit_Cnt>=48-1 )&&(Signal_Interval_Time>=SIGNAL_INTV_TO_QAM_FRE-1 ) ) begin 
            Signal_Flag_Reg <= 0; 
        end
        else if( End_Cnt_Index    ) begin  
            Signal_Flag_Reg <= Signal_Flag_In; 
            Data_Buf_Len <= Cnt_Index_Max;
        end 
    end
//Intv_Con1
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin 
            Intv_Con1 <= 0;        
        end    
        else if( End_Cnt_Index  ) begin 
            Intv_Con1 <= Intv_Con ; 
        end   
    end 

  
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin 
            Signal_Interval_Time <= 0;   
        end    
        else if( Signal_Flag_Reg  ) begin 
             if( (Signal_Interval_Time>=SIGNAL_INTV_TO_QAM_FRE-1 ) )  begin  
                Signal_Interval_Time  <= 0 ;   
            end 
            else begin
                Signal_Interval_Time <= Signal_Interval_Time + 1'b1;   
            end
        end
    end 
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin 
            Signal_Bit_Cnt <= 0;   
        end    
        else if( Signal_Flag_Reg &&(Signal_Interval_Time>=SIGNAL_INTV_TO_QAM_FRE-1)    ) begin 
             if( Signal_Bit_Cnt>=Data_Buf_Len-1  )  begin  
                Signal_Bit_Cnt  <= 0 ;   
            end 
            else begin
                Signal_Bit_Cnt <= Signal_Bit_Cnt + 1'b1;   
            end
        end
    end 
    
  
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin 
            Cnt_Bit   <= 0;    
            Back_12Bits <= 0;  
            Cnt_Bit_12 <= 0;    
        end     
        else if( Buf_A_Flag || Buf_B_Flag ) begin
            begin 
                if( Cnt_Bit == Data_Buf_Len-1 )
                    Cnt_Bit <= 0; 
                else  
                    Cnt_Bit <= Cnt_Bit + 1'b1; 
            end
            begin 
                if( (Back_12Bits==1)&& Cnt_Bit_12==11) 
                    Back_12Bits <= 1'b0; 
                else if( Cnt_Bit_12==11 )
                    Back_12Bits <=  1'b1;  
                end
            begin
                if( Cnt_Bit_12==11) 
                    Cnt_Bit_12 <= 0; 
                else 
                    Cnt_Bit_12 <= Cnt_Bit_12 + 1'b1; 
            end
        end 
    end 



 
    reg  Rd_Buf_Vld;
     always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin 
            addrb <= 0;   
            Rd_Buf_Vld <= 0;  
        end  
        else if( Buf_A_Flag && ~Signal_Flag_Reg  )  begin 
            Rd_Buf_Vld <= 1'b1; 
            if(Back_12Bits==0) 
                addrb <= Cnt_Bit;
            else if(Back_12Bits==1) begin
                case(Cnt_Bit[1:0])
                2'b00: addrb <= {Cnt_Bit[8:2],2'b10};
                2'b01: addrb <= {Cnt_Bit[8:2],2'b11};
                2'b10: addrb <= {Cnt_Bit[8:2],2'b00};
                2'b11: addrb <= {Cnt_Bit[8:2],2'b01};
                default:;
                endcase
            end
        end 
        else if( Buf_B_Flag && ~Signal_Flag_Reg)  begin 
            Rd_Buf_Vld <= 1'b1;
            if(Back_12Bits==0) 
                addrb <= 288 + Cnt_Bit;
            else if(Back_12Bits==1) begin
                case(Cnt_Bit[1:0])
                2'b00: addrb <= 288 + {Cnt_Bit[8:2],2'b10};
                2'b01: addrb <= 288 + {Cnt_Bit[8:2],2'b11};
                2'b10: addrb <= 288 + {Cnt_Bit[8:2],2'b00};
                2'b11: addrb <= 288 + {Cnt_Bit[8:2],2'b01};
                default:;
                endcase
            end
        end    
        else if( Signal_Flag_Reg && ((Signal_Interval_Time>=SIGNAL_INTV_TO_QAM_FRE-1 )) ) begin 
            addrb <= Signal_Bit_Cnt;   
            Rd_Buf_Vld <= 1; 
        end
        else begin 
            Rd_Buf_Vld <= 0;
        end
    end 

 //output 

    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin 
            Intv_Dout <= 0;
            Intv_Vld  <= 0;     
        end    
        else if( Rd_Buf_Vld ) begin 
            Intv_Dout <= doutb;
            Intv_Vld  <= 1'b1 ;  
        end  
        else    begin  
            Intv_Vld  <= 1'b0 ;   
        end 
    end 

//Map_Type
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin 
            Map_Type <= 0;        
        end    
        else if((Buf_B_Flag || Buf_A_Flag) &&(Cnt_Bit==0)) begin 
            Map_Type <= Intv_Con1 ; 
        end   
    end 
 


endmodule   