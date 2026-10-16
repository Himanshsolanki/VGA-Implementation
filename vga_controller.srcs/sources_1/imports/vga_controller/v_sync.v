module v_sync (
    input [9:0] v_count,
    output v_sync
);

assign v_sync = (v_count >= 490) && (v_count < 492) ? 1'b0 : 1'b1;

endmodule