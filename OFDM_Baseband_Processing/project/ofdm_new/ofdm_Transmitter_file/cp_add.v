module cp_add(
        input                   clk         ,
        input                   rst_n       ,
        input       [7:0]       Din_Re      ,
        input       [7:0]       Din_Im      ,
        input                   Din_En      ,
        input       [5:0]       Din_Index   ,

        output reg  [7:0]       Dout_Re     ,
        output reg  [7:0]       Dout_Im     ,
        output reg              Dout_Vld        	
    );		 
 
	
    wire        wen1;                // ???ram??????
	wire        wen2;                // ???ram??????
    reg         Flag_Spam;
    reg         rd_ram_en;
    reg  [5:0]  rd_ram_addr;
    reg  [5:0]  rd_data_cnt;
    reg  [7:0]  First_Re1; 
    reg  [7:0]  First_Im1; 
    reg  [7:0]  First_Re2; 
    reg  [7:0]  First_Im2; 
    wire [7:0]  dout_Re1;        
	wire [7:0]  dout_Im1;
	wire [7:0]  dout_Re2;
	wire [7:0]  dout_Im2;


	assign wen1 = Din_En&&(~Flag_Spam);
	assign wen2 = Din_En&&Flag_Spam; 



    spram_64  spram_Re1(
        .rst_n          (rst_n          )  ,
	    .clka           (clk            )  , 
	    .wea            (wen1           )  ,
	    .addra          (Din_Index      )  ,
	    .dina           (Din_Re         )  ,
	    .douta          (               )  , 
	    .clkb           (clk            )  ,
	    .web            (1'b0       )  ,
	    .addrb          (rd_ram_addr    )  ,
	    .dinb           (               )  ,
	    .doutb          (dout_Re1       )  
    );
    spram_64  spram_Im1(
        .rst_n          (rst_n          )  ,
	    .clka           (clk            )  , 
	    .wea            (wen1           )  ,
	    .addra          (Din_Index      )  ,
	    .dina           (Din_Im         )  ,
	    .douta          (               )  , 
	    .clkb           (clk            )  ,
	    .web            (1'b0       )  ,
	    .addrb          (rd_ram_addr    )  ,
	    .dinb           (               )  ,
	    .doutb          (dout_Im1       )  
    );

    spram_64  spram_Re2(
        .rst_n          (rst_n          )  ,
	    .clka           (clk            )  , 
	    .wea            (wen2           )  ,
	    .addra          (Din_Index      )  ,
	    .dina           (Din_Re         )  ,
	    .douta          (               )  , 
	    .clkb           (clk            )  ,
	    .web            (1'b0       )  ,
	    .addrb          (rd_ram_addr    )  ,
	    .dinb           (               )  ,
	    .doutb          (dout_Re2       )  
    );

    spram_64  spram_Im2(
        .rst_n          (rst_n          )  ,
	    .clka           (clk            )  , 
	    .wea            (wen2           )  ,
	    .addra          (Din_Index      )  ,
	    .dina           (Din_Im         )  ,
	    .douta          (               )  , 
	    .clkb           (clk            )  ,
	    .web            (1'b0     )  ,
	    .addrb          (rd_ram_addr    )  ,
	    .dinb           (               )  ,
	    .doutb          (dout_Im2       )  
    );



    //  ??????ram
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin
            Flag_Spam  <= 0;  
        end    
        else  if( Din_Index ==63 ) begin    
            Flag_Spam  <= ~Flag_Spam;  
        end 
    end
    //rd_ram_en
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin
            rd_ram_en  <= 0;  
        end    
        else  if( Din_Index==62 ) begin    
            rd_ram_en  <= 1'b1;  
        end   
        else  if( rd_data_cnt>=63  ) begin    
            rd_ram_en  <= 1'b0;  
        end 
    end
    //rd_ram_addr
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin
            rd_ram_addr  <= 0;  
        end     
        else  if( rd_ram_en || (Din_Index==63)  ) begin    
            rd_ram_addr  <= rd_ram_addr + 1'b1;  
        end 
        else begin 
            rd_ram_addr <= 0;
        end
    end
    //rd_data_cnt
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin
            rd_data_cnt  <= 0;  
        end      
        else  if( rd_ram_en  ) begin    
            rd_data_cnt  <= rd_ram_addr;  
        end 
        else begin 
            rd_data_cnt  <= 0;
        end
    end

    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin
            First_Re1 <= 0;
            First_Im1 <= 0;
            First_Re2 <= 0;
            First_Im2 <= 0;
        end      
        else  if( Din_Index==0  ) begin    
            case(Flag_Spam)
            0:begin 
                First_Re1 <= Din_Re;
                First_Im1 <= Din_Im;
            end
            1:begin 
                First_Re2 <= Din_Re;
                First_Im2 <= Din_Im;
            end
            endcase
        end
    end

    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin
            Dout_Re  <= 0;
            Dout_Im  <= 0;
            Dout_Vld <= 0; 
        end      
        else  if( Din_Index == 48 ) begin    
            Dout_Vld <= 1;
            case(Flag_Spam) //
            0:begin 
                Dout_Re <= (First_Re2 + Din_Re)>>1;//???OFDM?????????OFDM?????????2
                Dout_Im <= (First_Im2 + Din_Im)>>1;//???OFDM?????????OFDM?????????2
            end
            1:begin 
                Dout_Re <= (First_Re1 + Din_Re)>>1;
                Dout_Im <= (First_Im1 + Din_Im)>>1;
            end
            endcase
        end
        else  if( Din_Index>48  ) begin    
            Dout_Re  <= Din_Re;
            Dout_Im  <= Din_Im;
            Dout_Vld <= 1; 
        end 
        else  if( rd_ram_en ) begin    
            Dout_Vld <= 1; 
            case(Flag_Spam)//??????ram??
            0:begin 
                Dout_Re <= dout_Re2;  
                Dout_Im <= dout_Im2;  
            end
            1:begin 
                Dout_Re <= dout_Re1;
                Dout_Im <= dout_Im1;
            end
            endcase  
        end 
        else begin 
            Dout_Vld <= 1'b0;
        end
    end
 		    			 				    

endmodule

