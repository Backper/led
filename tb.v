`timescale 1ns/1ps
module tb (
    
);
reg clk;
reg rst;
reg[2:0]key_led;
reg key_mode;
wire[2:0]count;
wire key_mode_out;
wire[2:0]key_led_out;
key_counter counter(
    .clk(clk),
    .rst(rst),
    .key_mode(key_mode_out),
    .count(count)
);
key key(
    .clk(clk),
    .rst(rst),
    .key_led(key_led),
    .key_mode(key_mode),
    .key_led_reg(key_led_out),
    .key_mode_reg(key_mode_out)
);
always #1 clk = ~clk;
initial begin
    clk = 0;
    rst = 0;
    #20 key_mode = 1'b1;
    #20 key_led = 3'b111;
    #20 rst = 1;
    #2000 key_led = 3'b011;
    #2000 key_led = 3'b111;
    #2000 key_led = 3'b101;
    #2000 key_led = 3'b111;
    #2000 key_led = 3'b110;
    #2000 key_led = 3'b111;
    #2000 key_mode = 1'b0;
    #2000 key_mode = 1'b1;
    #2000 key_mode = 1'b0;
    #2000 key_mode = 1'b1;
    #2000 key_mode = 1'b0;
    #2000 key_mode = 1'b1;
    #200000
    $finish;
end
endmodule //tb