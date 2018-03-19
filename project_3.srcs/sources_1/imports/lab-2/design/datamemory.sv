`timescale 1ns / 1ps

module datamemory#(
    parameter DM_ADDRESS = 9 ,
    parameter DATA_W = 32      // NOTE: Must support 32, 16, 16u, 8, and 8u bit data.
    )(
    input logic clk,
	input logic [2:0] MemRead , // comes from control unit
    input logic [1:0] MemWrite , // Comes from control unit
    input logic [ DM_ADDRESS -1:0] a , // Read / Write address - 9 LSB bits of the ALU output
    input logic [ DATA_W -1:0] wd , // Write Data
    output logic [ DATA_W -1:0] rd // Read Data
    );
    
    logic [DATA_W-1:0] mem [(2**DM_ADDRESS)-1:0];
/*    
    always_comb 
    begin
       if(MemRead)
            rd = mem[a];
    end
        
    always @(posedge clk) 
    begin
       if (MemWrite)
            mem[a] = wd;
    end
*/
    
    always_comb 
    begin
    rd = rd;
    case (MemRead)
       3'b000: // 32
            rd = mem[a];
       3'b001: // 16
            rd = {mem[a][DATA_W-1] ? 16'hffff : 16'h0 , mem[a][15:0]}; //DATA_W-1:DATA_W-16
       3'b010: // 16u
            rd = {16'h0 , mem[a][15:0]}; //DATA_W-1:DATA_W-16
       3'b011: // 8
            rd = {mem[a][DATA_W-1] ? 24'hffffff : 24'h0 , mem[a][7:0]}; //DATA_W-1:DATA_W-8
       3'b100: // 8u
            rd = {24'h0 , mem[a][7:0]}; //DATA_W-1:DATA_W-8
	   default:
	        rd = 0;
    endcase
    end
    
    always @(posedge clk) begin
    mem[a] = mem[a];
    case (MemWrite)
       2'b00: // 32
            mem[a] = wd;
       2'b01: // 16
            mem[a] = {wd[15] ? 16'hffff : 16'h0 , wd[15:0]};
       2'b10: // 8
            mem[a] = {wd[7] ? 24'hffffff : 24'h0 , wd[7:0]};
       default:
            mem[a] = mem[a];
    endcase
    end
   
endmodule

