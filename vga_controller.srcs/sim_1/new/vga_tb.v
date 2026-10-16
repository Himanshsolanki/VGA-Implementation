`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2026 16:34:14
// Design Name: 
// Module Name: vga_tb
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

module vga_tb;

reg clk;
reg rst;

wire h_sync;
wire v_sync;
wire [7:0] red;
wire [7:0] green;
wire [7:0] blue;
wire [9:0] h_count;
wire [9:0] v_count;

// Instantiate the VGA Controller
vga_controller uut (
    .clk(clk),
    .rst(rst),
    .h_sync(h_sync),
    .v_sync(v_sync),
    .red(red),
    .green(green),
    .blue(blue),
    .h_count(h_count),
    .v_count(v_count)
);

integer file;

// Generate 100 MHz clock
always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;

    file = $fopen("frame.ppm","w");
    if (file == 0) begin
        $display("ERROR: Could not open frame.ppm");
        $finish;
    end
    $fwrite(file,"P3\n");
    $fwrite(file,"640 480\n");
    $fwrite(file,"255\n");

    // Hold reset for a short time
    #20;
    rst = 0;

end

always @(posedge clk)
begin

    if(!rst)
    begin

        if(h_count < 640 && v_count < 480)
        begin

            $fwrite(file,"%0d %0d %0d\n",
                red,
                green,
                blue);

        end

        if(h_count == 799 && v_count == 524)
        begin
            $fclose(file);
            $finish;
        end

    end

end

endmodule
