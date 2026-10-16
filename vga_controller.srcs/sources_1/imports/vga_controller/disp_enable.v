module disp_enable (
    input [9:0] h_count,
    input [9:0] v_count,
    output video_on
);

assign video_on = (h_count < 640) && (v_count < 480);
endmodule