`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/07/2018 10:22:44 PM
// Design Name: 
// Module Name: imm_Gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module imm_Gen(
    input logic [31:0] inst_code,
    output logic [31:0] Imm_out);


always_comb
    case(inst_code[6:0])
        // Note: inst_code[31] is the sign bit.
	// Representing Signed Values with 2's Compliment
	
        7'b0000011 /*I-type load*/     : 
            if (inst_code[13:11] != (3'b100 || 3'b101)) // signed
                Imm_out = {inst_code[31]? 20'hFFFFF:20'b0 , inst_code[31:20]};
            else                                        // unsigned
                Imm_out = {20'b0 , inst_code[31:20]};
        7'b0010011 /*I-type addi*/     : 
            Imm_out = {inst_code[31]? 20'hFFFFF:20'b0 , inst_code[31:20]};
        7'b0100011 /*S-type*/          : 
            Imm_out = {inst_code[31]? 20'hFFFFF:20'b0 , inst_code[31:25], inst_code[11:7]};
	7'b0110111 /*LUI*/	       :
	    Imm_out = {inst_code[31:12] , 12'b0};
	7'b0010111 /*AUIPC*/	       :
	    Imm_out = {inst_code[31:12] , 12'b0};
	7'b1101111 /*JAL*/	       :
	    Imm_out = {inst_code[31]? 12'hFFF:12'b0 , inst_code[19:12] , inst_code[20] , 
	               inst_code[30:21] , 1'b0};
	7'b1100111 /*JALR*/	       :
	    Imm_out = {inst_code[31]? 20'hFFFFF:20'b0 , inst_code[31:20]};
	7'b1100011 /*B-type*/	       :
	    Imm_out = {inst_code[31]? 20'hFFFFF:20'b0 , inst_code[7] , inst_code[30:25] , 
            	       inst_code[11:8] , 1'b0};
        default                        : 
            Imm_out = {32'b0};
    endcase
    
endmodule
