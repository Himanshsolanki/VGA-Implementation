module v_counter (
    input clk,
    input rst,
    input line_done,
    output reg [9:0] v_count
);

    parameter vvisible = 480;
    parameter vfront   = 10;
    parameter vsync    = 2;
    parameter vback    = 33;

    parameter vtotal = vvisible + vfront + vsync + vback;

    always @(posedge rst or posedge clk) begin
        if (rst) begin
            v_count <= 10'd0;
        end

        else if (line_done) begin
            if (v_count == vtotal - 1)
                v_count <= 10'd0;
            else
                v_count <= v_count + 10'd1;
        end
    end
endmodule