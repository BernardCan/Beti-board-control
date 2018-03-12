`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2017 03:05:24 PM
// Design Name: 
// Module Name: KeypadController
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


module KeypadController(
       input logic clk,
       
       //matrix  4x4 keypad
       output logic [3:0] keyb_row,
       input logic  [3:0] keyb_col,
       output logic [3:0] key_code,
       output logic key_inst
    );
    //matrix keypad scanner
    logic [3:0] key_value;
    logic key_valid;
    keypad4X4 keypad4X4_inst0(
        .clk(clk),
        .keyb_row(keyb_row), // just connect them to FPGA pins, row scanner
        .keyb_col(keyb_col), // just connect them to FPGA pins, column scanner
        .key_value(key_value), //user's output code for detected pressed key: row[1:0]_col[1:0]
        .key_valid(key_valid)  // user's output valid: if the key is pressed long enough (more than 20~40 ms), key_valid becomes '1' for just one clock cycle.
    );    
    
    // run an example function for each key of keypad.
    assign key_inst = key_valid;
    
    always@ (posedge clk)
    if (key_valid == 1'b1) begin
        case(key_value) 
        4'b00_00:
            key_code <= 4'b0000; //1
        4'b00_01:
            key_code <= 4'b0001; //2
        4'b00_10:  
            key_code <= 4'b0010; //3    
        4'b00_11:  
            key_code <= 4'b1100; //A            
        4'b01_00: 
            key_code <= 4'b0011; //4    
        4'b01_01:
            key_code <= 4'b0100; //5               
        4'b01_10:
            key_code <= 4'b0101; //6               
        4'b01_11:
            key_code <= 4'b1101; //B                  
        4'b10_00:
            key_code <= 4'b0110; //7     
        4'b10_01:
            key_code <= 4'b0111; //8    
        4'b10_10:
            key_code <= 4'b1000; //9    
        4'b10_11:
            key_code <= 4'b1110; //C            
        4'b11_00:
            key_code <= 4'b1010; //*    
        4'b11_01:
            key_code <= 4'b1001; //0     
        4'b11_10:
            key_code <= 4'b1011; //#    
        4'b11_11:
            key_code <= 4'b1111; //D                
        //default:
            //nothing
        
        endcase   
    end//if
    
endmodule
