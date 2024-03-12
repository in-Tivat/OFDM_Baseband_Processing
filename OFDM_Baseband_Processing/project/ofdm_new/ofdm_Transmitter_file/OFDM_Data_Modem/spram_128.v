`timescale 1ns / 1ps 
///////////////////////////////////////////////////////////////////////////////////
// Company:                                                                      
// Engineer: YWang                                                                    
//                                                                                   
// Create Date: 2023-03-27  09:39:06
// Design Name:                                                                    
// Module Name:     spram_128.v                                                      
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
 
/* allows simultaneous 1-read-1-write */
/* check read/write flag before calling */
module spram_128
(
    input           rst_n,
	input			clka, /*rst_n,*/
	input			wea,
	input [6:0]		addra,
	input [7:0] 	dina,
	output[7:0] 	douta,
    
	input			clkb,
	input			web,
	input [6:0]		addrb,
	input [7:0]  	dinb,
	output[7:0] 	doutb
);
    integer i;
	reg [7:0]	int_mem [127:0]; 

	reg  [7:0]	out_mema;
	reg  [7:0]	out_memb;

	
	 /*
	
    always @ (negedge rst_n)
		begin
			for(i=0;i<`LPVLC_MEM_BUF_SIZE;i=i+1) begin
                int_mem[i] <= 0; 
            end
		end
 */
        

	always @ (posedge clka  )
		begin
            if (wea)
				begin
					int_mem[addra] <= dina;
				end
			else
				begin
					out_mema <= int_mem[addra];
				end
		end

	always @ (posedge clkb)
		begin
			if (web)
				begin
					int_mem[addrb] <= dinb;
				end
			else
				begin
					out_memb <= int_mem[addrb];
				end
		end

	assign douta = (wea)? 8'b0 : out_mema;
	assign doutb = (web)? 8'b0 : out_memb;

endmodule




