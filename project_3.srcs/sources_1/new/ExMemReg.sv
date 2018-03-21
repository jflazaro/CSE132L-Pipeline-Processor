`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2018 11:13:49 PM
// Design Name: 
// Module Name: ExMemReg
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


module ExMemReg #(
    parameter PC_W = 9, // Program Counter
    parameter RF_ADDRESS = 5, // Register File Address
    parameter DATA_W = 32 // Data WriteData
    )(
    input logic clk,
    
    input logic MemtoReg, RegWrite,
    input logic [2:0] MemRead,
    input logic [1:0] MemWrite,
    input logic [DATA_W-1:0] Zero, ALUResult, ALUResult_Inter, Reg2, 
    input logic [RF_ADDRESS-1:0] RDest,
    input logic [PC_W-1:0] PC, PCPlus4,
    input logic [6:0] opcode,
    
    output logic MemtoReg_EXM_Out, RegWrite_EXM_Out,
    output logic [2:0] MemRead_EXM_Out,
    output logic [1:0] MemWrite_EXM_Out,
    output logic [DATA_W-1:0] Zero_EXM_Out, ALUResult_EXM_Out, ALUResult_Inter_EXM_Out, Reg2_EXM_Out, 
    output logic [RF_ADDRESS-1:0] RDest_EXM_Out,
    output logic [PC_W-1:0] PC_EXM_Out, PCPlus4_EXM_Out,
    output logic [6:0] opcode_EXM_Out
    );

always @(posedge clk) begin
    MemtoReg_EXM_Out <= MemtoReg;
    RegWrite_EXM_Out <= RegWrite;
    MemRead_EXM_Out <= MemRead;
    MemWrite_EXM_Out <= MemWrite;
    Zero_EXM_Out <= Zero;
    ALUResult_EXM_Out <= ALUResult;
    ALUResult_Inter_EXM_Out <= ALUResult_Inter;
    Reg2_EXM_Out <= Reg2;
    RDest_EXM_Out <= RDest;
    PC_EXM_Out <= PC;
    PCPlus4_EXM_Out <= PCPlus4;
    opcode_EXM_Out <= opcode;
end

//assign MemtoReg_EXM_Out = MemtoReg;
//assign RegWrite_EXM_Out = RegWrite;
//assign MemRead_EXM_Out = MemRead;
//assign MemWrite_EXM_Out = MemWrite;
//assign Zero_EXM_Out = Zero;
//assign ALUResult_EXM_Out = ALUResult;
//assign ALUResult_Inter_EXM_Out = ALUResult_Inter;
//assign Reg2_EXM_Out = Reg2;
//assign RDest_EXM_Out = RDest;
//assign PC_EXM_Out = PC;
//assign PCPlus4_EXM_Out = PCPlus4;
//assign opcode_EXM_Out = opcode;

endmodule
