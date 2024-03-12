`timescale 1ns / 1ps 
///////////////////////////////////////////////////////////////////////////////////
// Company:                                                                      
// Engineer: YWang                                                                    
//                                                                                   
// Create Date: 2023-03-27  09:39:23
// Design Name:                                                                    
// Module Name:        sync_buffer.v                                                   
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
module sync_buffer
(
    input           rst_n,
	input			clka, /*rst_n,*/
	input			wea,
	input [8:0]		addra,
	input    		dina,
	output      	douta,
    
	input			clkb,
	input			web,
	input [8:0]		addrb,
	input       	dinb,
	output      	doutb
);
    	integer i;
	reg  [0:0]	int_mem [575:0];

	reg  	out_mema;
	reg  	out_memb;

	
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

	assign douta = (wea)? 0 : out_mema;
	assign doutb = (web)? 0 : out_memb;

endmodule




