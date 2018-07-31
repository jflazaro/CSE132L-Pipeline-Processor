`timescale 1ns / 1ps
logic [7:0] a;

module tb_test1;
  initial begin
    $system("clear; echo; echo");
    a={7'hFF,1'b0};
    
    $display("a:%b signed:%d",a,$signed(a));
    #100;
    $system("echo; echo; echo");
  $finish;
  end
endmodule
