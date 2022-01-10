module led_ctrl (
    input clk,
    input rst,
    input [2:0]key_led,
    input key_mode,
    input [2:0]count,
    output reg clr,
    output reg[2:0]led
);

parameter IDLE = 4'b0001;
parameter CONFIG = 4'b0010;
parameter WORK = 4'b0100;
parameter MODIFY = 4'b1000;
reg [14:0]led_temp;
reg[3:0]curren_state;
reg[3:0]next_state;
reg next;
always @(posedge clk or negedge rst) begin
    if(!rst)begin
        curren_state <= IDLE;
    end
    else begin
        curren_state <= next_state;
    end
end
always @(posedge clk or negedge rst) begin
    if(!rst)begin
        
    end
    else begin
        case(next_state)
            IDLE:begin
                
            end
            CONFIG:begin
                if(next)begin
            end
            WORK:begin
                
            end
            MODIFY:begin
                
            end
            default : begin
                
            end
        endcase
    end
end
always @(*) begin
    case(curren_state)
        IDLE:begin
            if(count == 1)begin
                next_state = CONFIG;
                clr = 1;
            end
            else begin
                next_state = IDLE;
            end
        end
        CONFIG:begin
            if(count == 1)begin
                next_state = CONFIG;
                clr = 1;
                next = 1;
            end
            else if(count == 2)begin
                next_state = WORK;
                clr = 1;
            end
            else if(count == 3)begin
                next_state = MODIFY;
                clr = 1;
            end
            else begin
                next_state = CONFIG;
                clr = 1;
            end
        end
        WORK:begin
            if(count == 1)begin
                next_state = CONFIG;
                clr = 1;
            end
            else if(count == 2)begin
                next_state = MODIFY;
                clr = 1;
            end
            else begin
                next_state = WORK;
                clr = 1;
            end
        end
        MODIFY:begin
            if(count == 1)begin
                next_state = MODIFY;
                clr = 1;
            end
            else if(count == 2)begin
                next_state = WORK;
                clr = 1;
            end
            else begin
                next_state = MODIFY;
                clr = 1;
            end
        end
        default :begin
            next_state = IDLE;
            clr = 1;
        end
    endcase
end
integer i;
reg [2:0]led_reg;
always @(posedge clk or negedge rst) begin
    if(!rst)begin
        led_reg <= 0;
    end
    else begin
        for(i=0;i<2;i=i+1)begin
            if(key_led[i])begin
                led_reg[i] <= ~led_reg[i];
            end
            else begin
                led_reg[i] <= led_reg[i];
            end
        end
    end
end
endmodule //led_ctrl