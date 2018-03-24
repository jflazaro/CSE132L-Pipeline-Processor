`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2018 06:22:33 PM
// Design Name: 
// Module Name: mux_forwardA
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

// ForwardA:
// 00: Reg1_IDEX
// 10: ALUResult_EXM
// 01: WB_Data
module mux_forwardA(
    input logic [1:0] ForwardA,
    input logic [31:0] Reg1_IDEX, ALUResult_EXM, WB_Data,
    output logic [31:0] SrcA
    );

always_comb begin
    case (ForwardA)
        2'b00:
            SrcA = Reg1_IDEX;
        2'b10:
            SrcA = ALUResult_EXM;
        2'b01:
            SrcA = WB_Data;
        default:
            SrcA = Reg1_IDEX;
    endcase
end
endmodule
