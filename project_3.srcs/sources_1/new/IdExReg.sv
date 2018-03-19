`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2018 06:06:22 PM
// Design Name: 
// Module Name: IdExReg
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


module IdExReg #(
    parameter PC_W = 9, // Program Counter
    parameter INS_W = 32, // Instruction Width
    parameter RF_ADDRESS = 5, // Register File Address
    parameter DATA_W = 32 // Data WriteData
    )(
    input logic clk,
    
    input logic ALUSrc, MemtoReg, RegWrite, Branch,
    input logic [1:0] MemWrite, ALUOp,
    input logic [2:0] MemRead,
    input logic [PC_W-1:0] PC_IFID, PCPlus4_IFID,
    input logic [DATA_W-1:0] RD1, RD2, ExtImm,
//    input logic [2:0] Funct3_IFID,
//    input logic [RF_ADDRESS-1:0] RD_IFID, RS1_IFID, RS2_IFID,
    input logic [INS_W-1:0] Instr,
    input logic [3:0] ALU_CC,
    
    output logic ALUSrc_Out, MemtoReg_Out, RegWrite_Out, Branch_Out,
    output logic [1:0] MemWrite_Out, ALUOp_Out,
    output logic [2:0] MemRead_Out,
    output logic [PC_W-1:0] PC_IFID_Out, PCPlus4_IFID_Out,
    output logic [DATA_W-1:0] RD1_Out, RD2_Out, ExtImm_Out,
//    output logic [2:0] Funct3_IFID_Out,
//    output logic [RF_ADDRESS-1:0] RD_IFID_Out, RS1_IFID_Out, RS2_IFID_Out,
    output logic [INS_W-1:0] Instr_Out,
    output logic [3:0] ALU_CC_Out
    );

assign ALUSrc_Out = ALUSrc;
assign MemtoReg_Out = MemtoReg;
assign RegWrite_Out = RegWrite;
assign Branch_Out = Branch;
assign MemWrite_Out = MemWrite;
assign ALUOp_Out = ALUOp;
assign MemRead_Out = MemRead;
assign PC_IFID_Out = PC_IFID;
assign PCPlus4_IFID_Out = PCPlus4_IFID;
assign RD1_Out = RD1;
assign RD2_Out = RD2;
assign ExtImm_Out = ExtImm;
//assign Funct3_IFID_Out = Funct3_IFID;
//assign RD_IFID_Out = RD_IFID;
//assign RS1_IFID_Out = RS1_IFID;
//assign RS2_IFID_Out = RS2_IFID;
assign Instr_Out = Instr;
assign ALU_CC_Out = ALU_CC;

endmodule
