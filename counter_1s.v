module counter_1s (
    input clk,
    input rst,
    output clk_1s
);
reg [24:0]cnt;
always @(posedge clk or negedge rst) begin
    if(!rst)begin
        cnt <= 0;
        clk_1s <= 0;
    end
    else begin
        if(cnt == 24_999)begin
            clk_1s <= ~clk_1s;
            cnt <= 0;
        end
        else begin
            cnt <= cnt + 1;
        end
    end
end

endmodule //counter_1s