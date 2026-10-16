module pixel_gen(
    input [9:0] h_count,
    input [9:0] v_count,
    input video_on,
    output reg [7:0] red,
    output reg [7:0] blue,
    output reg [7:0] green
);

always @(*) begin
    if(video_on) begin
        red   = 8'hFF;
        green = 8'hFF;
        blue  = 8'hFF;
    end
    else begin
        red   = 8'h0;
        green = 8'h0;
        blue  = 8'h0;
    end
end
endmodule
