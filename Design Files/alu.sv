`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/07/2018 10:23:43 PM
// Design Name: 
// Module Name: alu
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


module alu#(
        parameter DATA_WIDTH = 32,
        parameter OPCODE_LENGTH = 4
        )(
        input logic [DATA_WIDTH-1:0]    SrcA,
        input logic [DATA_WIDTH-1:0]    SrcB,

        input logic [OPCODE_LENGTH-1:0]    Operation,
        output logic[DATA_WIDTH-1:0] ALUResult,
        output logic Zero
        );
    
        always_comb
        begin
            ALUResult = 'd0;
            Zero = 0;
            case(Operation)
            4'b0000:        //AND
                begin
                    ALUResult = SrcA & SrcB;
                    Zero = 0;
                end
            4'b0001:        //OR
                begin
                    ALUResult = SrcA | SrcB;
                    Zero = 0;
                end
            4'b0010:        //ADD
                begin
                    ALUResult = (SrcA) + (SrcB);
                    Zero = 0;
                end
            4'b0011:        //Subtract
                begin
                    ALUResult = $signed(SrcA) - $signed(SrcB);
                    Zero = 0;
                end
            4'b0100:        //XOR
                begin
                    ALUResult = SrcA ^ SrcB;
                    Zero = 0;
                end
            4'b0101:        //SLTI
                begin
                    ALUResult = ($signed(SrcA) < $signed(SrcB));
                    Zero = 0;
                end
            4'b0110:        //SLL
                begin
                    ALUResult = SrcA << SrcB[4:0];
                    Zero = 0;
                end
            4'b0111:        //SRL
                begin
                    ALUResult = SrcA >> SrcB[4:0];
                    Zero = 0;
                end
            4'b1000:        //SRA
                begin
                    ALUResult = $signed(SrcA) >>> $signed(SrcB[4:0]);
                    Zero = 0;
                end   
            4'b1001:        //BEQ
                begin
                    ALUResult = $signed(SrcA) - $signed(SrcB);
                    Zero = ($signed(SrcA) == $signed(SrcB)); 
                end
            4'b1010:        //BNE
                begin
                    ALUResult = $signed(SrcA) - $signed(SrcB);
                    Zero = ($signed(SrcA) != $signed(SrcB)); 
                end
            4'b1011:        //BLT
                begin
                    ALUResult = ($signed(SrcA) < $signed(SrcB)) ? 32'h1 : 32'hffffffff;
                    Zero = ($signed(SrcA) < $signed(SrcB)); 
                end
            4'b1100:        //BGE
                begin
                    ALUResult = ($signed(SrcA) >= $signed(SrcB)) ? 32'h1 : 32'hffffffff;
                    Zero = ($signed(SrcA) >= $signed(SrcB)); 
                end
            4'b1101:        //SLTIU
                begin
                    ALUResult = (SrcA < SrcB);
                    Zero = 0;
                end
            4'b1110:        //BLTU
                begin
                    ALUResult = (SrcA < SrcB) ? 32'h1 : 32'hffffffff;
                    Zero = (SrcA < SrcB);
                end
            4'b1111:        //BGEU
                begin
                    ALUResult = (SrcA >= SrcB) ? 32'h1 : 32'hffffffff;
                    Zero = (SrcA >= SrcB);
                end
            default:
                begin
                    ALUResult = 'b0;
                    Zero = 0;
                end
            endcase
        end
endmodule

