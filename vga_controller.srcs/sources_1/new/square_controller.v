`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.07.2026 22:13:17
// Design Name: 
// Module Name: square_controller
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


module square_controller(
    input clk,
    input [9:0] h_count,
    input [9:0] v_count,
    output reg [9:0] sq_x = 100,
    output [9:0] sq_y
);
    assign sq_y = 150;
    
    always @(posedge clk) begin
        if (h_count == 799 && v_count == 524) begin 
            if (sq_x < 590) begin
                sq_x <= sq_x + 1;
            end

            else begin
                sq_x <= 0;
            end
        end
    end

endmodule
