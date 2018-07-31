`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/07/2018 10:10:33 PM
// Design Name: 
// Module Name: ALUController
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


module ALUController(
    
    //Inputs
    input logic [1:0] ALUOp,  //7-bit opcode field from the instruction
    input logic [6:0] Funct7, // bits 25 to 31 of the instruction
    input logic [2:0] Funct3, // bits 12 to 14 of the instruction
    input logic [6:0] Opcode, // bits 6 to 0 of the instruction
    
    //Output
    output logic [3:0] Operation //operation selection for ALU
);
 /*
  *ALU Operations:
              4'b0000:        //AND
              4'b0001:        //OR
              4'b0010:        //ADD
              4'b0011:        //Subtract
              4'b0100:        //XOR
              4'b0101:        //SLTI, Make sure DataMem Mux chooses ALU Output.
              4'b0110:        //SLL
              4'b0111:        //SRL
              4'b1000:        //SRA
              4'b1001:        //BEQ
              4'b1010:        //BNE
              4'b1011:        //BLT
              4'b1100:        //BGE
              4'b1101:        //SLTIU
              4'b1110:        //JAL/JALR
  * */

always_comb
begin
    Operation = 4'b0000;
    if (Opcode == 7'b1101111/*JAL*/ || Opcode == 7'b0110111/*LUI*/ || Opcode == 7'b0010111/*AUIPC*/)
        Operation = 4'b0010;
    else
    begin
    case (Funct3)
    3'b000:
        begin
        if (ALUOp == 2'b01)
            Operation = 4'b1001;
        else if (ALUOp == 2'b11)
            Operation = 4'b0010;
        else if (Funct7 == 7'b0100000)
            Operation = 4'b0011;
        else
            Operation = 4'b0010;
        end
    3'b001:
        begin
        if (ALUOp == 2'b01)
            Operation = 4'b1010;
        else if (ALUOp == 2'b00)
            Operation = 4'b0010;
        else
            Operation = 4'b0110;
        end
    3'b010:
        begin
        if (ALUOp == 2'b00)
            Operation = 4'b0010;
        else
            Operation = 4'b0101;
        end
    3'b011:
        Operation = 4'b1101;
    3'b100:
        begin
        if (ALUOp == 2'b01)
            Operation = 4'b1011;
        else if (Opcode == 7'b0000011)
            Operation = 4'b0010;//0100
        else
            Operation = 4'b0100;
        end
    3'b101:
        begin
        if (ALUOp == 2'b01)
            Operation = 4'b1100;
        else if (Opcode == 7'b0000011)
            Operation = 4'b0010;
        else
            if (Funct7 == 7'b0000000)
                Operation = 4'b0111;
            else if (Funct7 == 7'b0100000)
                Operation = 4'b1000;
        end
    3'b110:
        begin
        if (ALUOp == 2'b01)
            Operation = 4'b1110;
        else
            Operation = 4'b0001;
        end
    3'b111:
        begin
        if (ALUOp == 2'b01)
            Operation = 4'b1111;
        else
            Operation = 4'b0000;
        end
    default:
        Operation = 4'b0000;
    endcase
    end
end
endmodule



 /*
 // Change JAL,LUI,AUIPC in Controller
 
 //Operation[0]=AND||OR||XOR||SLT
 assign Operation[0]= ((ALUOp[1]) && (Funct7==7'b0000000) && (Funct3==3'b110)) || 
                      (ALUOp[1]==1'b1 && Funct3==3'b010) ||
                      (Funct3==3'b101 && Funct7==7'b0000000);
 assign Operation[1]=(Funct3==3'b000) ||                                                // JALR,BEQ,LB,SB,ADDI,ADD,SUB
                     (Funct3==3'b001) ||                                                // BNE,LH,SH,SLLI,SLL
                     (Funct3==3'b010) ||                                                // LW,SW,SLTI,SLT
                     (Funct3==3'b100) ||                                                // BLT,LBU,XORI,XOR
                     (Funct3==3'b101 && Funct7!=7'b0000000 && Funct7!=7'b0100000) ||    // BGE,LHU
                     (Funct3==3'b110) ||                                                // BLTU,ORI,OR
                     (Funct3==3'b111)                                                   // BGEU,ANDI,AND
                     ;                    
 assign Operation[2]= ((ALUOp[1]==1'b1) && (Funct7==7'b0100000) && (Funct3==3'b000)) || (Funct3==3'b101 && Funct7==7'b0100000);
 assign Operation[3]= (Funct3 == 3'b010 || Funct3 == 3'b100 || Funct3==3'b001 || Funct3==3'b101);
*/
