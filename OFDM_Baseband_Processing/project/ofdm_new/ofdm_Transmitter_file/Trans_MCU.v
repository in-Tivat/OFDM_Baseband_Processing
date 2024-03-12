`timescale 1ns / 1ps 
///////////////////////////////////////////////////////////////////////////////////
// Company:                                                                      
// Engineer: YWang                                                                    
//                                                                                   
// Create Date: 2023-03-11  08:09:36
// Design Name:                                                                    
// Module Name: trans-mcu.v                                                          
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
module   Trans_MCU(  
    input               rst_n           ,
    input               mac_clk         , 
    input               clk_20m         ,
    input               clk_60m         ,//
    //MAC interface
  (* mark_debug = "true" *)  output reg          Phy_Status      ,//?MAC?????PHY??
 (* mark_debug = "true" *)   input               Txstart_Req     ,
 (* mark_debug = "true" *)   input   [20:0]      Tx_Param        ,
  (* mark_debug = "true" *)  input   [7:0]       Din             ,
 (* mark_debug = "true" *)   input               Din_Vld         ,
  (* mark_debug = "true" *)  output  reg         Din_Req         ,
    //module control signal
 (* mark_debug = "true" *)   output  reg         Tx_Clr          , 
    output  reg         Train_Start_En  ,//????????
(* mark_debug = "true" *)    output              Modem_Bit       ,//??bit???
(* mark_debug = "true" *)    output              Modem_Bit_Vld   ,//signa??data???????
 (* mark_debug = "true" *)   output              Signal_Flag     ,//singal??????? 
 (* mark_debug = "true" *)   output  reg [3:0]   Rate_Con        ,//????????
    output  reg [2:0]   TxPWR           ,//????
    output  reg [6:0]   Scram_Seed


);        


    // 7.5M 
    localparam      OFDM_SYMBOL_BYTES = 18;

    reg             Txstart_Req1;
    reg  [11:0]     Byte_Length;
    reg  [5:0]      Rate; 
    reg  [23:0]     Signal_Region;
    reg  [4:0]      Req_Byte_Cnt;
    wire            Add_Req_Byte_Cnt;
    wire            End_Req_Byte_Cnt;
    reg             MAC_Data_Req1;
    

    // 60M
    localparam  SYMBOL_PERIOD_TIME = 240; //60M???4us????
    localparam  SIGNAL_BIT_PERIOD = 6;//60M????10M???
    localparam      DATA_SYMBO_WAIT_TIME = 105;

    reg [8:0]       Symbol_Delay_Time;
    reg             Txstart_Req2,Txstart_Req3;
    reg             OFDM_Runing;
    reg             OFDM_Byte_Req;
    reg  [8:0]      Symbol_Period;
    wire            Add_Symbol_Period;
    wire            End_Symbol_Period;
    reg  [7:0]      OFDM_Symbol_Cnt; 
    reg  [7:0]      OFDM_Symbol_Cnt_Max; 
    wire            Add_OFDM_Symbol_Cnt;
    wire            End_OFDM_Symbol_Cnt;
    reg             Rd_Fifo_En;
    reg             Rd_Fifo_Vld;
    wire            Rd_Fifo_Data;
    reg [2:0]       Signal_Bit_Period;
    reg             Signal_Bit_Out;
    reg             Signal_Bit_Vld;
    reg [4:0]       Signal_Bit_Cnt;
    
    
// 20M
    
    
    reg             Train_Runing1;
    

//**************************************  mac 7.5M???  **************************************
    //Start_Req1
    always@(posedge mac_clk or negedge rst_n ) begin
        if(!rst_n) begin
            Txstart_Req1 <= 0; 
        end   
        else begin 
            Txstart_Req1 <= Txstart_Req;      
        end
    end 
    //?ofdM??????? ????????????
    always@(posedge mac_clk or negedge rst_n ) begin
        if(!rst_n) begin
            Tx_Clr <= 0; 
        end  
        else if( Txstart_Req  ) begin
            Tx_Clr <= 1'b1; 
        end 
        else begin 
            Tx_Clr <= 0;      
        end
    end 
    always@(posedge mac_clk or negedge rst_n ) begin
        if(!rst_n) begin
            Byte_Length <= 0;
            Rate <= 0; 
            Rate_Con <= 0;
            TxPWR <= 0; 
            Scram_Seed <= 0;
        end  
        else if( Txstart_Req ||Txstart_Req1 ) begin
            Byte_Length <= Tx_Param[20:9];
            Rate <= Tx_Param[8:3]; 
            TxPWR <= Tx_Param[2:0]; 
            Scram_Seed <= 7'b1011101;
            case(Tx_Param[8:3])
                6'd6 : Rate_Con <= 4'b1101 ;
                6'd9 : Rate_Con <= 4'b1111 ;
                6'd12: Rate_Con <= 4'b0101 ;
                6'd18: Rate_Con <= 4'b0111 ;
                6'd24: Rate_Con <= 4'b1001 ;
                6'd36: Rate_Con <= 4'b1011 ;
                6'd48: Rate_Con <= 4'b0010 ;
                6'd54: Rate_Con <= 4'b0011 ;
            default: Rate_Con <= 4'b0000;
            endcase
        end
    end
    //Signal_Region
    always@(posedge mac_clk or negedge rst_n ) begin
        if(!rst_n) begin
            Signal_Region <= 0; 
        end   
        else  begin
            Signal_Region <= {6'b0,{^Signal_Region[16:0]},Byte_Length,1'b0,
                            Rate_Con[0],Rate_Con[1],Rate_Con[2],Rate_Con[3]}; 
        end
    end
    //OFDM_Byte_Req
    always@(posedge mac_clk or negedge rst_n ) begin
        if(!rst_n) begin
            MAC_Data_Req1 <= 0; 
        end   
        else   begin
            MAC_Data_Req1 <= OFDM_Byte_Req;  //
        end
    end
    always@(posedge mac_clk or negedge rst_n ) begin
        if(!rst_n) begin
            Din_Req <= 0; 
        end   
        else if ( End_Req_Byte_Cnt )  begin
            Din_Req <= 1'b0;  //
        end
        else if ( ~MAC_Data_Req1 && OFDM_Byte_Req)  begin
            Din_Req <= 1'b1;  //
        end
    end
    //Req_Byte_Cnt 
    always@(posedge mac_clk or negedge rst_n ) begin
        if(!rst_n) begin
            Req_Byte_Cnt <= 0; 
        end  
        else if( End_Req_Byte_Cnt  ) begin
            Req_Byte_Cnt <= 0;  
        end
        else if( Add_Req_Byte_Cnt ) begin
            Req_Byte_Cnt <= Req_Byte_Cnt + 1'b1;  //
        end
    end
    assign Add_Req_Byte_Cnt = Din_Req   ;
    assign End_Req_Byte_Cnt = Add_Req_Byte_Cnt && (Req_Byte_Cnt== OFDM_SYMBOL_BYTES-1);  

    

//**************************************  60M???? **************************************
//????????
     
    reg  Txstart_Req_wait;
    always@(posedge clk_60m or negedge rst_n ) begin
        if(!rst_n) begin
            Txstart_Req_wait <= 0;  
        end  
        else begin 
            Txstart_Req_wait <= Txstart_Req1;    
        end
    end
    always@(posedge clk_60m or negedge rst_n ) begin
        if(!rst_n) begin
            Symbol_Delay_Time <= 0;  
        end  
        else if( Symbol_Delay_Time >= DATA_SYMBO_WAIT_TIME ) begin  
            Symbol_Delay_Time <= 0;  
        end  
        else if( Txstart_Req_wait && ~Txstart_Req1 ) begin  
            Symbol_Delay_Time <= 1;  
        end 
        else  if ( Symbol_Delay_Time>0 ) begin 
            Symbol_Delay_Time <= Symbol_Delay_Time + 1'b1;    
        end
    end
    //
    always@(posedge clk_60m or negedge rst_n ) begin
        if(!rst_n) begin
            Phy_Status <= 0; 
        end  
        else if( ~OFDM_Runing  ) begin
            Phy_Status <= 0;  
        end
        else if( Txstart_Req_wait && ~Txstart_Req1 ) begin
            Phy_Status <=  1'b1;   
        end
    end 

    //ofdm_start_en
    always@(posedge clk_60m or negedge rst_n ) begin
        if(!rst_n) begin
            Txstart_Req2 <= 0; 
            Txstart_Req3 <= 0;
        end  
        else  begin
            Txstart_Req2 <= (Symbol_Delay_Time >= DATA_SYMBO_WAIT_TIME); 
            Txstart_Req3 <= Txstart_Req2; 
        end
    end
    //OFDM_Runing
    always@(posedge clk_60m or negedge rst_n ) begin
        if(!rst_n) begin
            OFDM_Runing <= 0; 
        end  
        else if( End_OFDM_Symbol_Cnt ) begin
            OFDM_Runing <= 1'b0;  
        end
        else if( ~Txstart_Req2 & Txstart_Req3 ) begin
            OFDM_Runing <= 1'b1;  
        end
    end 
    //Symbol_Period
    always@(posedge clk_60m or negedge rst_n ) begin
        if(!rst_n) begin
            Symbol_Period <= 0; 
        end  
        else if( End_Symbol_Period  ) begin
            Symbol_Period <= 0;  
        end
        else if( Add_Symbol_Period ) begin
            Symbol_Period <= Symbol_Period + 1'b1;  //
        end
    end
    assign Add_Symbol_Period = OFDM_Runing;
    assign End_Symbol_Period = Add_Symbol_Period && (Symbol_Period==SYMBOL_PERIOD_TIME-1); 
    
    //OFDM_Symbol_Cnt
    always@(posedge clk_60m or negedge rst_n ) begin
        if(!rst_n) begin
            OFDM_Symbol_Cnt <= 0; 
        end  
        else if( End_OFDM_Symbol_Cnt  ) begin
            OFDM_Symbol_Cnt <= 0;  
        end
        else if( Add_OFDM_Symbol_Cnt ) begin
            OFDM_Symbol_Cnt <= OFDM_Symbol_Cnt + 1'b1;  
        end
    end
    assign Add_OFDM_Symbol_Cnt = OFDM_Runing && End_Symbol_Period;
    assign End_OFDM_Symbol_Cnt = Add_OFDM_Symbol_Cnt && (OFDM_Symbol_Cnt == OFDM_Symbol_Cnt_Max);
    //OFDM_Symbol_Cnt_Max
    always@(posedge clk_60m or negedge rst_n ) begin
        if(!rst_n) begin
            OFDM_Symbol_Cnt_Max <= 0; 
        end  
        else  begin
            OFDM_Symbol_Cnt_Max <= (Byte_Length+3)/OFDM_SYMBOL_BYTES ;  
        end
    end

    //OFDM_Byte_Req  ????????????????
    always@(posedge clk_60m or negedge rst_n ) begin
        if(!rst_n) begin
            OFDM_Byte_Req <= 0; 
        end 
        else if( (Symbol_Period==SYMBOL_PERIOD_TIME-60)&& (OFDM_Symbol_Cnt!= OFDM_Symbol_Cnt_Max)  ) begin
            OFDM_Byte_Req <= 1'b1;   
        end 
        else if( Symbol_Period==SYMBOL_PERIOD_TIME-50  ) begin
            OFDM_Byte_Req <= 1'b0;  
        end
    end
    //Rd_Fifo_En
    always@(posedge clk_60m or negedge rst_n ) begin
        if(!rst_n) begin
            Rd_Fifo_En <= 0;  
        end  
        else if( Symbol_Period==(OFDM_SYMBOL_BYTES<<3)-2 ) begin  
            Rd_Fifo_En <= 1'b0;  
        end  
        else if( (Symbol_Period==SYMBOL_PERIOD_TIME-2)&&(OFDM_Symbol_Cnt != OFDM_Symbol_Cnt_Max) ) begin  
            Rd_Fifo_En <= 1'b1;  
        end  
    end
    always@(posedge clk_60m or negedge rst_n ) begin
        if(!rst_n) begin
            Rd_Fifo_Vld <= 0;  
        end    
        else   begin  
            Rd_Fifo_Vld <= Rd_Fifo_En;  
        end  
    end  

    //Signal_Flag_Reg1
    reg Signal_Flag_Reg1,Signal_Flag_Reg2;
    always@(posedge clk_60m or negedge rst_n ) begin
        if(!rst_n) begin
            Signal_Flag_Reg1 <= 0;  
        end  
        else if( ~Txstart_Req2 & Txstart_Req3 ) begin  
            Signal_Flag_Reg1 <= 1'b1;  
        end 
        else if( (Signal_Bit_Cnt>=23)&&(Signal_Bit_Period==SIGNAL_BIT_PERIOD-1 ) ) begin  
            Signal_Flag_Reg1 <= 1'b0;  
        end   
    end 
     
    //  Signal_Bit_Period
    always@(posedge clk_60m or negedge rst_n ) begin
        if(!rst_n) begin
            Signal_Bit_Period <= 0;  
        end    
        else if( Signal_Bit_Period==SIGNAL_BIT_PERIOD-1 )  begin  
            Signal_Bit_Period <= 0;  
        end    
        else if( Signal_Flag_Reg1 )  begin  
            Signal_Bit_Period <= Signal_Bit_Period + 1'b1;  
        end  
    end  
    always@(posedge clk_60m or negedge rst_n ) begin
        if(!rst_n || Tx_Clr ) begin
            Signal_Bit_Vld <= 0;  
            Signal_Bit_Out <= 0;
            Signal_Bit_Cnt <= 0;
        end    
        else if( Signal_Flag_Reg1 && (Signal_Bit_Period==SIGNAL_BIT_PERIOD-1) )  begin  
            Signal_Bit_Vld <= 1;  
            Signal_Bit_Out <= Signal_Region[Signal_Bit_Cnt];
            Signal_Bit_Cnt <= Signal_Bit_Cnt + 1'b1;
        end    
        else    begin  
            Signal_Bit_Vld <= 1'b0;   
        end  
    end
    //
    reg Signal_Bit_Vld1;//Signal_Bit_Vld2;
    reg Signal_Bit_Out1;//Signal_Bit_Out2;
    always@(posedge clk_60m or negedge rst_n ) begin
        if(!rst_n) begin
            Signal_Flag_Reg2 <= 0;   
        end   
        else   begin  
            Signal_Flag_Reg2 <= Signal_Flag_Reg1 || Signal_Bit_Vld  || Signal_Bit_Vld1 ;   
        end   
    end
    always@(posedge clk_60m or negedge rst_n ) begin
        if(!rst_n) begin
            Signal_Bit_Vld1 <= 0; 
         //   Signal_Bit_Vld2 <= 0; 
            Signal_Bit_Out1 <= 0;
         //   Signal_Bit_Out2 <= 0; 
        end   
        else   begin  
            Signal_Bit_Vld1 <= Signal_Bit_Vld; 
           // Signal_Bit_Vld2 <= Signal_Bit_Vld1; 
            Signal_Bit_Out1 <= Signal_Bit_Out;
           // Signal_Bit_Out2 <= Signal_Bit_Out1;  
        end   
    end

    assign Signal_Flag =  Signal_Flag_Reg2  ;
    assign Modem_Bit     = Signal_Flag ? Signal_Bit_Out1 : Rd_Fifo_Data;
    assign Modem_Bit_Vld = Signal_Flag ? Signal_Bit_Vld1 : Rd_Fifo_Vld ;
    
 wire full ;
 wire empty;
 
    fifo_generator_1  u_Byte_To_Bit(
        .wr_clk          (mac_clk    ), 
        .rd_clk          (clk_60m    ), 
        .wr_rst          (~rst_n     ),
        .rd_rst          (~rst_n     ),
        .din             (Din        ), 
        .wr_en           (Din_Vld    ), 
        .rd_en           (Rd_Fifo_En ), 
        .dout            (Rd_Fifo_Data), 
        .full            (full    ), 
        .empty           (empty  )
    );   

//************************************** 20M??? **************************************
// Train_Start_En
    always@(posedge clk_20m or negedge rst_n ) begin
        if(!rst_n) begin
            Train_Runing1 <= 0;  
        end  
        else begin 
            Train_Runing1 <= Txstart_Req1 ;    
        end
    end
    //Train_Start_En  
    always@(posedge clk_20m or negedge rst_n ) begin
        if(!rst_n) begin
            Train_Start_En <= 0;  
        end  
        else if( Train_Runing1 && ~Txstart_Req1 ) begin  
            Train_Start_En <= 1'b1;  
        end  
        else begin 
            Train_Start_En <= 0;    
        end
    end
  
                   
endmodule          