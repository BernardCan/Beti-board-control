`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2017 09:38:58 AM
// Design Name: 
// Module Name: PlayController
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


module PlayController(
    //play controller
    input logic clk, reset, start_m, r_generate,
    //keypad
    output logic [3:0] keyb_row,
    input logic  [3:0] keyb_col,
    //7-segment
    output logic a, b, c, d, e, f, g, dp, 
    output logic [3:0] an,
    //step-motor
    output logic [3:0] phases
    );
    
    logic [3:0] key_code, r_num;
    logic bool, key_inst;
    
    RandomController r(clk, r_generate, reset, r_num);
    
    MotorController m(clk, start_m, r_num, phases);
    
    KeypadController k(clk, keyb_row, keyb_col, key_code, key_inst);
   
    always_comb begin
        if(key_code == r_num)
            bool <= 1'b1;
        else bool <= 1'b0;
    end
         
    SegmentController s(key_inst, bool, clk, reset, a, b, c, d, e, f, g, dp, an);
endmodule
