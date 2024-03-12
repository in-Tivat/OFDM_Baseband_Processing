 
 `timescale 1ns / 1ps 
 ///////////////////////////////////////////////////////////////////////////////////
 // Company:                                                                      
 // Engineer: YWang                                                                    
 //                                                                                   
 // Create Date: 2023-03-27  09:22:08
 // Design Name:                                                                    
 // Module Name:       data_maping.v                                                    
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
 //          QAM??????
//     ????    ?????
//     BPSK        1       //signal ?????? ?1bit??????? ?48????
//     QPSK        1/?2
//     Qam16       1/?10   //data ???????4bit??????? ?48????
//     64QAM       1/?42

//     Qam16???
//     ??b0b1   Re/I       ??b2b3     Im/Q    //????b0?????????
//     00          -3          00          -3
//     01          -1          01          -1
//     11          1           11          1
//     10          3           10          3 
//     ????I/Q??????????

//     d = (I + jQ) * K(mod) (K?????)

//     signal ?????1bit?????????data????4bit?????????
// ?????????20M??????????????????????
// ?????????? signal ???????48????? ? data ????4?????????????48?????                                                                
/////////////////////////////////////////////////////////////////////////////////// 
                   
module data_maping( 
    input               cb_clk      ,//80M
    input               clk         , //20m
    input               rst_n       , 
    input               Tx_Clr      ,
//    
    input  [1:0]        Map_Type    ,
    input               Qam16_Din   ,  
    input               Qam16_En    ,    

    output reg  [7:0]   Qam16_Re    ,
    output reg  [7:0]   Qam16_Im    ,
    output reg          Qam16_Vld   ,
    output reg  [5:0]   Index_Out   
); 
     
    //80M
    reg   [5:0]     Map_Bits;
    reg   [5:0]     Map_Bits_Reg;
    reg   [1:0]     Map_Type_Reg;
    reg             Map_Bits_Vld_80M; 
    wire            Map_Vld_80M_20M;
    reg   [2:0]     Cnt_Bits_Max;
    reg   [2:0]     Cnt_Bits;
    wire            Add_Cnt_Bits;
    wire            End_Cnt_Bits;
    // 20M 
    reg             Map_Bits_Vld_20M;
    reg   [5:0]     Map_Bits_20M;
    reg   [1:0]     Map_Type_20M;
    always@(posedge cb_clk or negedge rst_n ) begin
        if(!rst_n || Tx_Clr) begin 
            Cnt_Bits <= 0;  
        end  
        else if( End_Cnt_Bits ) begin 
            Cnt_Bits <= 0;
        end
        else if( Add_Cnt_Bits ) begin   
            Cnt_Bits <= Cnt_Bits + 1'b1;
        end
    end
    assign Add_Cnt_Bits = Qam16_En;
    assign End_Cnt_Bits = Add_Cnt_Bits &&(Cnt_Bits==Cnt_Bits_Max-1);

    always@( * ) begin
       case(Map_Type)
            2'b00:Cnt_Bits_Max = 1; //PBSK
            2'b01:Cnt_Bits_Max = 2; //Qpsk
            2'b10:Cnt_Bits_Max = 4; //16-QAM
            2'b11:Cnt_Bits_Max = 6; //64-QAM
            default:Cnt_Bits_Max =1;
       endcase
    end

    always@(posedge cb_clk or negedge rst_n ) begin
        if(!rst_n) begin 
            Map_Bits <= 0;  
        end  
        else if( Add_Cnt_Bits ) begin 
            case(Map_Type)
            2'b00: 
                case(Cnt_Bits)
                0: Map_Bits[0] <= Qam16_Din;
                default:;
                endcase 
            2'b01:
                case(Cnt_Bits)
                0: Map_Bits[0] <= Qam16_Din;
                1: Map_Bits[1] <= Qam16_Din;
                default:;
                endcase 
            2'b10:
                case(Cnt_Bits)
                0: Map_Bits[0] <= Qam16_Din;
                1: Map_Bits[1] <= Qam16_Din;
                2: Map_Bits[2] <= Qam16_Din;
                3: Map_Bits[3] <= Qam16_Din;
                default:;
                endcase 
            2'b11:
                case(Cnt_Bits)
                0: Map_Bits[0] <= Qam16_Din;
                1: Map_Bits[1] <= Qam16_Din;
                2: Map_Bits[2] <= Qam16_Din;
                3: Map_Bits[3] <= Qam16_Din;
                4: Map_Bits[4] <= Qam16_Din;
                5: Map_Bits[5] <= Qam16_Din;
                default:;
                endcase 
            default:;
            endcase
        end 
    end

    //Map_Bits_Reg ,Map_Type_Reg
    always@(posedge cb_clk or negedge rst_n ) begin
        if(!rst_n) begin 
            Map_Bits_Reg <= 0;  
            Map_Type_Reg <= 0; 
            Map_Bits_Vld_80M <= 0; 
        end   
        else if(  End_Cnt_Bits  ) begin 
            Map_Bits_Reg <= Map_Bits;  
            Map_Type_Reg <= Map_Type;
            Map_Bits_Vld_80M <= 1'b1; 
        end 
        else begin
            Map_Bits_Vld_80M <= 1'b0;
        end
    end
    reg  Map_Bits_Vld_80M1,Map_Bits_Vld_80M2,Map_Bits_Vld_80M3;
    always@(posedge cb_clk or negedge rst_n ) begin
        if(!rst_n) begin  
            Map_Bits_Vld_80M1 <= 0;
            Map_Bits_Vld_80M2 <= 0;
            Map_Bits_Vld_80M3 <= 0;
        end   
        else  begin
            Map_Bits_Vld_80M1 <= Map_Bits_Vld_80M;
            Map_Bits_Vld_80M2 <= Map_Bits_Vld_80M1;
            Map_Bits_Vld_80M3 <= Map_Bits_Vld_80M2;
        end
    end

    assign Map_Vld_80M_20M = Map_Bits_Vld_80M3 || Map_Bits_Vld_80M2 || Map_Bits_Vld_80M1 || Map_Bits_Vld_80M;



//***************************************** ???? *************************************************//
//***************************************** ????????? *************************************************//

    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n) begin 
            Map_Bits_Vld_20M <= 0;
            Map_Bits_20M <= 0;
            Map_Type_20M <= 0;
        end   
        else if(  Map_Vld_80M_20M  ) begin 
            Map_Bits_Vld_20M <= 1'b1;
            Map_Bits_20M <= Map_Bits_Reg;
            Map_Type_20M <= Map_Type_Reg;
        end 
        else begin
            Map_Bits_Vld_20M <= 1'b0;
        end
    end


    always@(posedge clk or negedge rst_n ) begin
        if(!rst_n || Tx_Clr) begin 
            Qam16_Re  <= 0;
            Qam16_Im  <= 0;
            Qam16_Vld <= 0;
            Index_Out <= 6'b111_111;  
        end  
        else if( Map_Bits_Vld_20M ) begin 
            case(Map_Type_20M) 
                2'b00: begin    //Bpsk
                    case(Map_Bits_20M[0])
                        1'b0: Qam16_Re <= 8'b1100_0000; // 
                        1'b1: Qam16_Re <= 8'b0100_0000; 
                    default:Qam16_Re <= 0;
                    endcase
                    Qam16_Im <= 8'b00000000;
                    Qam16_Vld <= 1;
                    Index_Out <= Index_Out + 1;
                end
                2'b01: begin        //Qpsk
                    case(Map_Bits_20M[0])
                        1'b0: Qam16_Re <= 8'b1101_0011;  //-1 * 1/?2
                        1'b1: Qam16_Re <= 8'b0010_1101;  //1 * 1/?2    
                    default:Qam16_Re <= 0;
                    endcase
                    case(Map_Bits_20M[1])
                        1'b0: Qam16_Im <= 8'b1101_0011;
                        1'b1: Qam16_Im <= 8'b0010_1101; 
                    default: Qam16_Im <= 0;
                    endcase
                    Qam16_Vld <= 1;
                    Index_Out <= Index_Out + 1;
                end
                2'b10: begin       //16-qam
                    case(Map_Bits_20M[1:0])
                        2'b00: Qam16_Re <= 8'b11000011; //-3 * 1/?10
                        2'b10: Qam16_Re <= 8'b11101100;
                        2'b01: Qam16_Re <= 8'b00111101;
                        2'b11: Qam16_Re <= 8'b00010100;
                    default:Qam16_Re <= 0;
                    endcase
                    case(Map_Bits_20M[3:2])
                        2'b00: Qam16_Im <= 8'b11000011;
                        2'b10: Qam16_Im <= 8'b11101100;
                        2'b01: Qam16_Im <= 8'b00111101;
                        2'b11: Qam16_Im <= 8'b00010100;
                    default: Qam16_Im <= 0;
                    endcase
                    Qam16_Vld <= 1;
                    Index_Out <= Index_Out + 1;
                end
                2'b11: begin    //64-qam
                    case(Map_Bits_20M[2:0])
                        3'b000: Qam16_Re <= 8'b1011_1011; //-7 * 1/?42
                        3'b001: Qam16_Re <= 8'b1100_1111; //-5*1/?42
                        3'b011: Qam16_Re <= 8'b1110_0011; //-3*1/?42
                        3'b010: Qam16_Re <= 8'b1111_0111; //-1*1/?42
                        3'b110: Qam16_Re <= 8'b0100_0101; //7*1/?42
                        3'b111: Qam16_Re <= 8'b0011_0001;//5*1/?42
                        3'b101: Qam16_Re <= 8'b0001_1101;//3*1/?42
                        3'b100: Qam16_Re <= 8'b0000_1001;//1*1/?42
                    default:Qam16_Re <= 0;
                    endcase
                    case(Map_Bits_20M[5:3])
                        3'b000: Qam16_Im <= 8'b1011_1011; //-7 * 1/?42
                        3'b001: Qam16_Im <= 8'b1100_1111; //-5*1/?42
                        3'b011: Qam16_Im <= 8'b1110_0011; //-3*1/?42
                        3'b010: Qam16_Im <= 8'b1111_0111; //-1*1/?42
                        3'b110: Qam16_Im <= 8'b0100_0101; //7*1/?42
                        3'b111: Qam16_Im <= 8'b0011_0001;//5*1/?42
                        3'b101: Qam16_Im <= 8'b0001_1101;//3*1/?42
                        3'b100: Qam16_Im <= 8'b0000_1001;//1*1/?42
                    default: Qam16_Im <= 0;
                    endcase
                    Qam16_Vld <= 1;
                    Index_Out <= Index_Out + 1;
                end
                default:;
            endcase
        end
        else   begin  
            Qam16_Vld  <= 0;
            Index_Out <= 6'b111_111;
        end 
    end
 

endmodule   