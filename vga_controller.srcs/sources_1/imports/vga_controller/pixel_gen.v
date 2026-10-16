module pixel_gen(
    input [9:0] h_count,
    input [9:0] v_count,
    input video_on,

    input [9:0] sq_x,
    input [9:0] sq_y,

    output reg [7:0] red,
    output reg [7:0] green,
    output reg [7:0] blue
);

always @(*) begin

    // Default background (black)
    red   = 8'd0;
    green = 8'd0;
    blue  = 8'd0;

    if (video_on) begin

        // Draw square
        if ((h_count >= sq_x) && (h_count < sq_x + 50) &&
            (v_count >= sq_y) && (v_count < sq_y + 50)) begin

            red   = 8'hFF;
            green = 8'h00;
            blue  = 8'h00;

        end

    end

end
endmodule
