`timescale 1ns / 1ps 
///////////////////////////////////////////////////////////////////////////////////
// Company:                                                                      
// Engineer: YWang                                                                    
//                                                                                   
// Create Date: 2023-03-27  09:27:47
// Design Name:                                                                    
// Module Name:       data_pilot.v                                                    
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
//  ?????
//     4???????: -21 ,-7 , 7, 21;
//     4???????? 1 ?1 ?1 -1 
//     P0v - P126v = {1,1,1,1,-1,-1-1,1,-1?-1?-1?-1,1,1.????????}
//     P0V -p126v?OFDM????? P0v?????signal??? P1v?????data?? ?P2v????data?????P126v??126?data??
//     ? Pnv??????????? 1?????OFDM?????????
//     ?Pnv????? -1 ??????????????1 ??> -1 ; -1 ??> 1?.

//     P0v - P126v??????????? ???????????? 7?b111_1111???????????????????????????????

//     ?????IFFT????? ?
//         0 ?? ? 
//         1 - 26 ??IFFT????1-26
//         -26 - -1 ??IFFT????38-63
//         IFFT????27 - 37 ? 0???? 

//     ??48?????????IFFT????????
//           ??????   ????            ??IFFT????
//             0 - 4      -26 -- -22          38 - 42
//           ????1        -21                  43
//             5 -17      -20 -- -8            44 - 56
//           ????2        -7                  57
//             18-23       -6 -- -1            58 - 63
//    ????              0                    0
//             24-29       1  --  6            1 - 6
//           ????3       7                    7
//            30 - 42      8 -- 20             8 - 20
//           ????4       21                  21
//           43 - 47       22 -- 26            22 - 26 

//         ??            -32 -- -27          32 - 37    
//                         27 - 31              27-31                                                                           
/////////////////////////////////////////////////////////////////////////////////// 
 
module data_pilot( 
    input               clk         , 
    input               rst_n       , 
//    
    input       [7:0]   Pilot_DinRe    ,
    input       [7:0]   Pilot_DinIm    ,
    input               Pilot_En    ,  
    input       [5:0]   Pilot_Index  , 
    input               pilot_start ,  //??????? 

    output reg  [7:0]   Pilot_DoutRe      ,
    output reg  [7:0]   Pilot_DoutIm      ,
    output reg          Pilot_Vld      
);
   


    reg             Re_wea   ; 
    reg     [6:0]   Re_addra ; 
    reg     [7:0]   Re_dina  ; 
    reg             Im_wea   ; 
    reg     [6:0]   Im_addra ; 
    reg     [7:0]   Im_dina  ; 
    reg             wen_out  ;
    reg     [6:0]   out_addr ; 
    reg     [7:0]   din_b    ; 
    wire    [7:0]   Im_doutb ; 
    wire    [7:0]   Re_doutb ;

reg  [6:0]   Index_Out ;

//
    reg Pilot_En1;
    reg Pilot_En2;
    wire wr_done;
    always@(posedge clk  or negedge rst_n ) begin
        if(!rst_n) begin
            Pilot_En1 <= 0; 
            Pilot_En2 <= 0;
        end    
        else  begin 
            Pilot_En1 <= Pilot_En;
            Pilot_En2 <= Pilot_En1;
        end 
    end
    assign wr_done = Pilot_En1 && ~Pilot_En;

//************************ ?? **********************************//
    reg     [6:0]   shift_reg;
    wire            scram_out ;

    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin
            shift_reg <= 7'b111_1111; 
        end   
        else if( pilot_start ) begin 
            shift_reg <= 7'b111_1111; 
        end 
        else if( wr_done  ) begin  
            shift_reg <= {shift_reg[5:0],(shift_reg[6]+shift_reg[3])}; //??????
        end 
    end
    ////? scram_out== 0 ?????????? ? scram_out==1 ?????????
    assign scram_out = (shift_reg[6]+shift_reg[3]);  
//************************ 



    reg     [6:0]   cnt_symbol;
    reg             insert;
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin
            Re_addra <= 0; 
            Re_wea <= 0;
            Re_dina <= 0;
        end 
        else if( Pilot_En ) begin //??????
            Re_addra[6] <= cnt_symbol[0] ? 1 : 0;
            case(Pilot_Index)
                0,1,2,3,4 :						      
                    Re_addra[5:0] <= Pilot_Index+38 ; 					 
                5,6,7,8,9,10,11,12,13,14,15,16,17 :
                    Re_addra[5:0] <= Pilot_Index+39 ;
                18,19,20,21,22,23 : 
                    Re_addra[5:0] <= Pilot_Index+40 ;
                24,25,26,27,28,29 :
                    Re_addra[5:0] <= Pilot_Index-23 ; 
                30,31,32,33,34,35,36,37,38,39,40,41,42 :
                    Re_addra[5:0] <= Pilot_Index-22 ;
                43,44,45,46,47 : 
                    Re_addra[5:0] <= Pilot_Index-21 ;
            default:Re_addra[5:0] <= 0;
            endcase
            Re_dina <= Pilot_DinRe;
            Re_wea <= 1;
        end
        else  if( insert ) begin  //?????
            case(Re_addra[5:0])  //  ??    1,1,1,-1 >> 43  57   7  21 
                0  :begin
                    Re_addra[5:0] <= 7;
                    Re_dina <= scram_out ? 8'b11000000 : 8'b01000000;
                    Re_wea <= 1;
                end					 
                7  :begin
                    Re_addra[5:0] <= 21;
                    Re_dina <= scram_out ? 8'b01000000 : 8'b11000000;
                    Re_wea <= 1;
                end
                21 : begin
                    Re_addra[5:0] <= 43;
                    Re_dina <= scram_out ? 8'b11000000 : 8'b01000000;
                    Re_wea <= 1;
                end
                43 :begin
                    Re_addra[5:0] <= 57;
                    Re_dina <= scram_out ? 8'b11000000 : 8'b01000000;
                    Re_wea <= 1;
                end 
                57 :begin
                    Re_addra[5:0] <= 0; 
                    Re_wea <= 0;
                end 
            default: begin 
                    Re_addra[5:0] <= 0;
                    Re_wea <= 0;
            end
            endcase
        end
        else  begin
            Re_addra[6] <= cnt_symbol[0] ? 1 : 0;
            Re_wea <= 0;
            Re_addra[5:0] <= 0;
        end
    end

    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin
            insert <= 1; 
        end   
        else if( Re_addra[5:0]==57 ) begin 
            insert <= 0; 
        end 
        else if( wr_done || pilot_start ) begin   
            insert <= 1;  
        end 
    end

    //cnt_symbol
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin
            cnt_symbol <= 0; 
        end   
        else if( pilot_start ) begin  //
            cnt_symbol <= 0; 
        end 
        else if( wr_done ) begin   
            cnt_symbol <= cnt_symbol + 1;  
        end 
    end


//im
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin
            Im_addra <= 0; 
            Im_wea <= 0;
            Im_dina <= 0;
        end 
        else if( Pilot_En ) begin  
            Im_addra[6] <= cnt_symbol[0] ? 1 : 0;
            case(Pilot_Index)
                0,1,2,3,4 :						      
                    Im_addra[5:0] <= Pilot_Index+38 ; 					 
                5,6,7,8,9,10,11,12,13,14,15,16,17 :
                    Im_addra[5:0] <= Pilot_Index+39 ;
                18,19,20,21,22,23 : 
                    Im_addra[5:0] <= Pilot_Index+40 ;
                24,25,26,27,28,29 :
                    Im_addra[5:0] <= Pilot_Index-23 ; 
                30,31,32,33,34,35,36,37,38,39,40,41,42 :
                    Im_addra[5:0] <= Pilot_Index-22 ;
                43,44,45,46,47 : 
                    Im_addra[5:0] <= Pilot_Index-21 ;
            default:Im_addra[5:0] <= 0;
            endcase
            Im_dina <= Pilot_DinIm;
            Im_wea <= 1;
        end
        else   begin   
            Im_wea <= 0; 
            Im_addra[6] <= cnt_symbol[0] ? 1 : 0; 
            Im_addra[5:0] <= 0;
        end
    end



//************************************* output ************************************//
    reg   initialize ;
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin
            initialize  <= 1; 
        end   
        else if( out_addr==127 ) begin    
            initialize <= 0 ;
        end 
    end

    reg  rdy,rdy1,rdy2; 
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin
            rdy  <= 0; 
        end   
        else if( out_addr[5:0]==63  ) begin      
            rdy <= 0;
        end 
        else if( ~Pilot_En &&  Pilot_En2  ) begin     
            rdy <= 1;
        end 
    end

    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin
            wen_out  <= 0;
            out_addr <= 0;
            din_b    <= 0;
        end   
        else if( initialize ) begin   // ???buffer
            out_addr <= out_addr + 1; 
            wen_out <= 1; 
            din_b    <= 0;
        end 
        else if( rdy ) begin
            out_addr <= out_addr + 1; 
            wen_out <= 0;
        end
        else begin
            wen_out <= 0;
        end
    end

    
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin
            rdy1  <= 0; 
            rdy2  <= 0; 
        end    
        else  begin    
            rdy1  <= rdy; 
            rdy2  <= rdy1; 
        end 
    end

//Pilot_DoutRe Pilot_DoutIm   Pilot_Vld 
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin
            Pilot_DoutRe    <= 0;
            Pilot_DoutIm    <= 0;
            Pilot_Vld <= 0;  
        end    
        else  if( rdy1 ) begin    //????64???
            Pilot_DoutRe    <= Re_doutb;
            Pilot_DoutIm    <= Im_doutb;
            Pilot_Vld <= 1;  
        end 
        else 
            Pilot_Vld <= 0; 
    end
    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin 
            Index_Out <= 0;
        end    
        else  if( rdy1 ) begin    
            Index_Out <= Index_Out + 1'b1;
        end 
        else  
            Index_Out <= 0;
    end





    spram_128  spram_Re(
        .rst_n          (rst_n          )  ,
	    .clka           (clk          )  , /*rst_n,*/
	    .wea            (Re_wea            )  ,
	    .addra          (Re_addra          )  ,
	    .dina           (Re_dina           )  ,
	    .douta          (               )  ,
       // . (                .          )
	    .clkb           (clk          )  ,
	    .web            (wen_out              )  ,
	    .addrb          (out_addr          )  ,
	    .dinb           (din_b                )  ,
	    .doutb          (Re_doutb          )  
    );

    spram_128  spram_Im(
        .rst_n          (rst_n          )  ,
	    .clka           (clk          )  , /*rst_n,*/
	    .wea            (Im_wea            )  ,
	    .addra          (Im_addra          )  ,
	    .dina           (Im_dina           )  ,
	    .douta          (               )  ,
       // . (                .          )
	    .clkb           (clk          )  ,
	    .web            (wen_out              )  ,
	    .addrb          (out_addr          )  ,
	    .dinb           (din_b               )  ,
	    .doutb          (Im_doutb          )  
    );


endmodule   