`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2017 07:04:23 PM
// Design Name: 
// Module Name: SegmentController
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


module SegmentController(
        input logic trigger, bool, clk, res,
        //7-segment signals
        output logic a, b, c, d, e, f, g, dp, 
        output logic [3:0] an
    );
        logic [3:0] in0 = 4'h0; //initial value
        logic [3:0] in1 = 4'h0; //initial value
        logic [3:0] in2 = 4'h0; //initial value
        logic [3:0] in3 = 4'h0; //initial value
   
        // this module shows 4 decimal numbers on 4-digit 7-Segment.  
        // 4 digits are scanned with high speed, then you do not notice that every time 
        // only one of them is ON. dp is always off.
        SevSeg_4digit SevSeg_4digit_inst0(
            .clk(clk),
            .in3(in3), .in2(in2), .in1(in1), .in0(in0), //user inputs for each digit (hexadecimal)
            .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .dp(dp), // just connect them to FPGA pins (individual LEDs).
            .an(an)   // just connect them to FPGA pins (enable vector for 4 digits active low) 
        );
        
        always@ (posedge clk)
            if(res) in0 <= 4'd0;
            else
                if(trigger == 1'b1)begin
                    if(bool)begin 
                        if(in0 == 4'd9) in0 <= 4'd9;
                        else in0 <= in0 + 4'd1;
                    end
                    else begin
                        if(in0 == 4'd0) in0 <= 4'd0;
                        else in0 <= in0 - 4'd1;
                    end
                end
    
endmodule
