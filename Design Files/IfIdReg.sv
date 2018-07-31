`timescale 1ns / 1ps
import pipeline_pkg::*;
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2018 11:12:56 AM
// Design Name: 
// Module Name: IfIdReg
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


module IfIdReg #(
    parameter PC_W = 9, // Program Counter
    parameter INS_W = 32 // Instruction Width
    )(
    input logic hazard, clk,
    
    input logic [PC_W-1:0] PC, PCPlus4,
    input logic [INS_W-1:0] Instr,
    
    output logic [PC_W-1:0] PC_Next, PCPlus4_Next,
    output logic [INS_W-1:0] Instr_Next
    );

//assign PC_Next = PC;
//assign PCPlus4_Next = PCPlus4;
//assign Instr_Next = Instr;

always @(posedge clk) begin
    if (hazard == 0) begin
        PC_Next <= PC;
        PCPlus4_Next <= PCPlus4;
        Instr_Next <= Instr;
    end
end
  
endmodule
