`timescale 1ns / 1ps

module riscv #(
    parameter DATA_W = 32)
    (input logic clk, reset, // clock and reset signals
    output logic [DATA_W-1:0] WB_Data //The ALU_Result
    /*output logic [DATA_W-1:0] ALU_Result,
    output logic Zero,
    output logic [2:0] MemRead,
    output logic [1:0] MemWrite,
    output logic [DATA_W-1:0] Reg1,Reg2,
    output logic [3:0] Operation,
    output logic [8:0] PC,
    output logic [DATA_W-1:0] ExtImm,
    output logic [1:0] ALUop*/
    );

logic [6:0] opcode;
logic [2:0] MemRead;
logic [1:0] MemWrite, ALUOp;
logic ALUSrc, MemtoReg, RegWrite, Branch;
logic [1:0] ALUop, ALUOp_IDEX;
logic [6:0] Funct7;
logic [2:0] Funct3;
logic [3:0] Operation;

    Controller c(opcode, Funct3, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUop);
    
    ALUController ac(ALUOp_IDEX, Funct7, Funct3, opcode, Operation);

    Datapath dp(Branch, clk, reset, RegWrite , MemtoReg, ALUSrc , ALUop, MemWrite, MemRead, Operation, opcode, Funct7, Funct3, WB_Data, ALUOp_IDEX/*, ALU_Result, Zero, Reg1, Reg2, PC, ExtImm*/);
        
endmodule
