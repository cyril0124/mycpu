module ROM#(
    parameter XLEN = 32,
    parameter BLOCK_BYTES = 4,
    parameter MEM_SIZE = 1024,
    parameter MEM_WIDTH = 10
)
(
    input wire clock,
    input wire reset,
    input wire wen,
    input wire [XLEN-1:0] waddr,
    input wire [BLOCK_BYTES-1:0] wmask,
    input wire [XLEN-1:0] wdata,
    input wire [XLEN-1:0] raddr,
    output reg [XLEN-1:0] rdata 
);

reg [BLOCK_BYTES*8-1:0] mem[MEM_SIZE-1:0];


always@(posedge clock) begin
    if(reset == 1'b1)
        rdata <= 'd0;
    else begin
        if(wen == 1'b1) begin
            if(wmask[0] == 1'b1) 
                mem[waddr[MEM_WIDTH + 1:2]][7:0] <= wdata[7:0];
            if(wmask[1] == 1'b1) 
                mem[waddr[MEM_WIDTH + 1:2]][15:7] <= wdata[15:7];
            if(wmask[2] == 1'b1)
                mem[waddr[MEM_WIDTH + 1:2]][23:16] <= wdata[23:16];
            if(wmask[3] == 1'b1) 
                mem[waddr[MEM_WIDTH + 1:2]][31:24] <= wdata[31:24];
        end
        else
            rdata <= mem[raddr[MEM_WIDTH + 1:2]];
    end
end

endmodule