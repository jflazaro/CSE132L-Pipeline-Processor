`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2018 06:22:33 PM
// Design Name: 
// Module Name: mux_forwardB
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

// ForwardB:
// 00: Reg2_IDEX
// 10: ALUResult_EXM
// 01: WB_Data
module mux_forwardB(
    input logic [1:0] ForwardB,
    input logic [31:0] Reg2_IDEX, ALUResult_EXM, WB_Data,
    output logic [31:0] SrcB
    );

always_comb begin
    case (ForwardB)
        2'b00:
            SrcB = Reg2_IDEX;
        2'b10:
            SrcB = ALUResult_EXM;
        2'b01:
            SrcB = WB_Data;
        default:
            SrcB = Reg2_IDEX;
    endcase
end
endmodule
