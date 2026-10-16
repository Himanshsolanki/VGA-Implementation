module vga_controller(
    input clk,
    input rst, 
    output h_sync,
    output v_sync,
    output [7:0] red,
    output [7:0] green,
    output [7:0] blue,
    output [9:0] h_count,
    output [9:0] v_count
);

    wire line_done;
    wire video_on;
    wire sq_x;
    wire sq_y;

square_controller square_ctrl (
    .clk(clk),
    .h_count(h_count),
    .v_count(v_count),
    .sq_x(sq_x),
    .sq_y(sq_y)
);

h_counter HC(
    .clk(clk),
    .rst(rst),
    .h_count(h_count),
    .line_done(line_done),
    .h_sync(h_sync)
);
v_counter VC(
    .clk(clk),
    .rst(rst),
    .line_done(line_done),
    .v_count(v_count)
);
v_sync VS(
    .v_count(v_count),
    .v_sync(v_sync)
);

disp_enable DE (
    .h_count(h_count),
    .v_count(v_count),
    .video_on(video_on)
);

pixel_gen PG(
    .h_count(h_count),
    .v_count(v_count),
    .video_on(video_on),
    .red(red),
    .green(green),
    .blue(blue),
    .sq_x(sq_x),
    .sq_y(sq_y)
);
endmodule
