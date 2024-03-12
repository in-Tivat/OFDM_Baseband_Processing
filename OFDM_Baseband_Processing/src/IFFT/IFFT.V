`timescale 1ns / 1ps 
///////////////////////////////////////////////////////////////////////////////////
// Company:                                                                      
// Engineer: YWang                                                                    
//                                                                                   
// Create Date: 2023-03-15  10:15:13
// Design Name:                                                                    
// Module Name:       IFFT.V                                                    
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
module   IFFT(    
    input                   clk_80m    ,//80M 
    input                   sys_clk     ,//20M 
    input                   rst_n       ,   
    output reg [5:0]        Dout_Index  ,
    output   signed [7:0]   Dout_Re     , 
    output   signed [7:0]   Dout_Im     ,
    output reg              Dout_Vld    ,
    input signed [7:0]      Din_Re      ,
    input signed [7:0]      Din_Im      ,
    input  [0:0]            Din_En        
             
);              

 

    wire [15:0] infifo_din          ;
    wire [0:0]  infifo_wr_en        ;
    reg  [0:0]  infifo_rd_en        ;
    wire [15:0] infifo_dout         ;
    wire [0:0]  infifo_full         ;
    wire [0:0]  infifo_empty        ;
    wire [6:0]  infifo_rd_data_count;


    reg  rd_falg;
    reg  last_flag;
wire              fft_s_config_tready;
reg        [6:0]  cnt_num;
wire signed [31:0] fft_s_data_tdata;
reg               fft_s_data_tvalid; 
reg               fft_s_data_tlast;
wire              fft_s_data_tready;
wire signed [31:0] fft_m_data_tdata;
wire signed [7:0]  fft_m_data_tuser;
wire               fft_m_data_tvalid;
wire               fft_m_data_tready;
wire               fft_m_data_tlast;
wire                fft_event_frame_started;
wire                fft_event_tlast_unexpected;
wire                fft_event_tlast_missing;
wire                fft_event_status_channel_halt;
wire                fft_event_data_in_channel_halt;
wire                fft_event_data_out_channel_halt;




    assign infifo_din   = {Din_Im,Din_Re};
    assign infifo_wr_en = Din_En;
    fifo_generator_0 u_fifo_in
    (
        .wr_clk         (sys_clk             ),
        .rd_clk         (clk_80m            ),
        .din            (infifo_din          ),
        .wr_en          (infifo_wr_en        ),
        .rd_en          (infifo_rd_en        ),
        .dout           (infifo_dout         ),
        .full           (infifo_full         ),
        .empty          (infifo_empty        ),
        .rd_data_count  (infifo_rd_data_count)        
    );
 
    //infifo_rd_en  
    always @ (negedge rst_n or posedge clk_80m )	 begin
        if (!rst_n)   begin                              
            rd_falg  <= 0;  
        end
        else if( cnt_num>=63 ) begin
            rd_falg <= 0;  
        end
        else  if( infifo_rd_data_count>=63  ) begin		 
            rd_falg <= 1;  
        end
    end 
    always @ (negedge rst_n or posedge clk_80m )	 begin
        if (!rst_n)   begin                              
            infifo_rd_en  <= 0; 
            cnt_num <= 0; 
            last_flag <= 0;
        end
        else  if( cnt_num>=64 ) begin		 
            infifo_rd_en <= 0;
            last_flag <= 0;
            cnt_num <= 0; 
        end
        else  if( rd_falg && fft_s_data_tready && ~infifo_empty ) begin		 
            infifo_rd_en <= 1;  
            cnt_num <= cnt_num + 1;
            if ( cnt_num==63 ) last_flag <= 1;
        end
        else  begin
            infifo_rd_en <= 0;   
            last_flag <= 0;
        end
    end  

    always @ (negedge rst_n or posedge clk_80m )	 begin
        if (!rst_n)   begin           
            fft_s_data_tvalid <= 0; 
            fft_s_data_tlast <= 0;
        end
        else  if( infifo_rd_en  ) begin							                
            fft_s_data_tvalid <= 1; 
            fft_s_data_tlast <= last_flag;
        end
        else begin
            fft_s_data_tvalid <= 0; 
            fft_s_data_tlast <= last_flag;
        end
    end 
  
    assign fft_s_data_tdata = { {5{infifo_dout[15]}},infifo_dout[15:8],3'b0 , {5{infifo_dout[7]}},infifo_dout[7:0],3'b0  };





//fft ip 
    xfft_0 u_fft(
        .aclk(clk_80m),                                           
       // .aresetn(rst_n),                                         
        .s_axis_config_tdata(8'd1),                                
        .s_axis_config_tvalid(1'b1),                               
        .s_axis_config_tready(fft_s_config_tready),               
        //ä˝ä¸şćĽćśćśĺć°ćŽćśćŻäťčŽžĺ¤?
        .s_axis_data_tdata(fft_s_data_tdata),                      
        .s_axis_data_tvalid(fft_s_data_tvalid),                   
        .s_axis_data_tready(fft_s_data_tready),                    
        .s_axis_data_tlast(fft_s_data_tlast),                     
        //ä˝ä¸şĺé?é˘č°ąć°ćŽćśćŻä¸ťčŽžĺ¤
        .m_axis_data_tdata(fft_m_data_tdata),                      
        .m_axis_data_tuser(fft_m_data_tuser),                     
        .m_axis_data_tvalid(fft_m_data_tvalid),                   
        .m_axis_data_tready(fft_m_data_tready),                    
        .m_axis_data_tlast(fft_m_data_tlast),                     
        //ĺśäťčžĺşć°ćŽ
        .event_frame_started(fft_event_frame_started),                  // output wire event_frame_started
        .event_tlast_unexpected(fft_event_tlast_unexpected),            // output wire event_tlast_unexpected
        .event_tlast_missing(fft_event_tlast_missing),                  // output wire event_tlast_missing
        .event_status_channel_halt(fft_event_status_channel_halt),      // output wire event_status_channel_halt
        .event_data_in_channel_halt(fft_event_data_in_channel_halt),    // output wire event_data_in_channel_halt
        .event_data_out_channel_halt(fft_event_data_out_channel_halt)   // output wire event_data_out_channel_halt
    );
    

    assign fft_m_data_tready = 1'b1;
reg  [15:0] outfifo_din          ;
reg  [0:0]  outfifo_wr_en        ;
wire [0:0]  outfifo_rd_en        ;
wire [15:0] outfifo_dout         ;
wire [0:0]  outfifo_full         ;
wire [0:0]  outfifo_empty        ;
wire [6:0]  outfifo_rd_data_count;


always @ (negedge rst_n or posedge clk_80m)	 begin
    if (!rst_n)   begin                              
        outfifo_wr_en <= 0;
        outfifo_din   <= 0; 
    end
    else  if( fft_m_data_tvalid ) begin							    
        outfifo_wr_en <= 1;
        outfifo_din   <= {fft_m_data_tdata[23:16],fft_m_data_tdata[7:0]}; 
    end
    else begin
        outfifo_wr_en <= 0; 
    end
end 
 
    fifo_generator_0 u_fifo_out
    (
        .wr_clk         (clk_80m             ),
        .rd_clk         (sys_clk              ),
        .din            (outfifo_din          ),
        .wr_en          (outfifo_wr_en        ),
        .rd_en          (outfifo_rd_en        ),
        .dout           (outfifo_dout         ),
        .full           (outfifo_full         ),
        .empty          (outfifo_empty        ),
        .rd_data_count  (outfifo_rd_data_count)        
    );
  

    reg  out_flag; 
    reg [5:0] out_Index;

    always @ (negedge rst_n or posedge sys_clk)	 begin
        if (!rst_n)   begin                              
            out_flag <= 0; 
        end
        else if( outfifo_rd_en && (out_Index>=63)  )  begin
            out_flag <= 0; 
        end
        else  if( outfifo_rd_data_count>=63 ) begin							    
            out_flag <= 1; 
        end
    end 
    //out_Index
    always @ (negedge rst_n or posedge sys_clk)	 begin
        if (!rst_n)   begin                              
            out_Index <= 0; 
        end
        else if( outfifo_rd_en && (out_Index>=63)  )  begin
            out_Index <= 0; 
        end
        else  if( outfifo_rd_en ) begin							    
            out_Index <= out_Index + 1'b1; 
        end
    end 

    always @ (negedge rst_n or posedge sys_clk)	 begin
        if (!rst_n)   begin       
            Dout_Vld   <= 0;
            Dout_Index <= 0;
        end 
        else  if( outfifo_rd_en ) begin				 
            Dout_Vld   <= 1; 
            Dout_Index <= out_Index;
        end
        else begin
            Dout_Vld <= 0;  
            Dout_Index <= 0;
        end
    end  
       assign     outfifo_rd_en =  out_flag && ~outfifo_empty ;
       assign     Dout_Re  = outfifo_dout[7:0];
       assign     Dout_Im  = outfifo_dout[15:8];
             
                   
endmodule          

