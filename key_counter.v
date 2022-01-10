module key_counter (
    input clk,
    input rst,
    input key_mode,
    output reg [2:0]count
);
reg[25:0]cnt;//to create 1s
// reg[2:0]count_sec;//to count number of seconds
reg[2:0]count_reg;//to count number of key pushing
reg en;
always @(posedge clk or negedge rst) begin
    if(!rst)begin
        count <= 0;
        cnt <= 0;
        en <= 0;
        // count_sec <= 0;
        count_reg <= 0;
    end
    else begin
        if(en)begin
            if(cnt == 49_999)begin
                cnt <= cnt;
                en <= 0;
                count <= count_reg;
            end
            else begin
                if(key_mode)begin
                    count_reg <= count_reg + 1;
                    cnt <= cnt + 1 ;
                end
                else begin
                    cnt <= cnt + 1;
                end
            end
        end
        else begin
            if(key_mode)begin
                en <= 1;
                count_reg <= 1'b1;
            end
            else begin
                en <= 0;
            end
        end
    end
end

endmodule //key_counter