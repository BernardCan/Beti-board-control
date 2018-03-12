`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2017 12:59:10 AM
// Design Name: 
// Module Name: RandomController
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


module RandomController(
    input logic clk, enable, reset,
    output logic [3:0] r_num
);

    logic linear_feedback;
    logic [15:0] out = 16'b0000_0100_0000_0100;

    //-------------Code Starts Here-------
    assign linear_feedback = out[15] ^ out[14] ^ out[12] ^ out[3];

    always @(posedge clk) begin
        if(reset)
            out <= 16'b0000_0100_0000_0100;
        else
            if(enable)
                out <= {out[14], out[13], out[12], out[11], out[10],
                    out[9], out[8], out[7], out[6],
                    out[5], out[4], out[3], out[2],
                    out[1], out[0], linear_feedback};
        end 
        
    assign r_num = {out[3], out[2], out[1], out[0]};
    
 endmodule 

