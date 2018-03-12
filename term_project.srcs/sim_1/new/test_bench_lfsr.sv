`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2017 08:27:14 PM
// Design Name: 
// Module Name: test_bench_lfsr
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


module test_bench_lfsr();
        logic clk, enable, reset;
        logic [3:0] r_num;
        
        always begin
             clk = 1; #5; clk = 0; #5;
        end
        
        RandomController uut(clk, enable, reset, r_num);
        
        initial begin
            enable = 1;
            res = 1; #20;
            res = 0; #300;
            enable = 0;
        end
endmodule
