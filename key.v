module key (
    input clk,
    input rst,
    input [2:0]key_led,
    input key_mode,
    output  [2:0]key_led_reg,
    output  key_mode_reg
);
// reg [24:0]cnt;
reg [2:0]key_led_scan;
reg [2:0]key_led_scan_r;
reg key_mode_scan;
reg key_mode_scan_r;
assign key_led_reg[0] = key_led_scan_r[0] & (!key_led_scan[0]);
assign key_led_reg[1] = key_led_scan_r[1] & (!key_led_scan[1]);
assign key_led_reg[2] = key_led_scan_r[2] & (!key_led_scan[2]);
assign key_mode_reg = key_mode_scan_r & (!key_mode_scan);
always @(posedge clk or negedge rst) begin
    if(!rst)begin
        // key_led_reg <= 0;
        // key_mode_reg <= 0;
        key_led_scan <= 0;
        key_led_scan_r <= 0;
        key_mode_scan <= 0;
        key_mode_scan_r <= 0;
    end
    else begin
        key_led_scan <= key_led;
        key_mode_scan <= key_mode;
        key_led_scan_r <= key_led_scan;
        key_mode_scan_r <= key_mode_scan;
    end
end
endmodule //key