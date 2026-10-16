    module h_counter(
    input clk,
    input rst,
    output reg [9:0] h_count,
    output h_sync,
    output reg line_done
);

    parameter hdisplay = 10'd640;
    parameter hfp    = 10'd16;
    parameter hsync    = 10'd96;
    parameter hbp      = 10'd48;
    parameter htotal   = 10'd800;

    assign h_sync = (h_count >= hdisplay+hfp && h_count < hdisplay+hfp+hsync)? 1'b0 : 1'b1;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            h_count <= 10'd0;
            line_done <= 0;
        end

        else begin
            line_done <= 0;

            if (h_count == htotal -1) begin
                h_count <= 10'd0;
                line_done <= 1;
            end 
            else begin 
                h_count <= h_count + 10'd1;
            end
        end
    end
endmodule



