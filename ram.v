`timescale 1ns/1ns
module ram(data_bus, addr, ws, cs, oe);
parameter addr_size=5, word_size=8, memory_size=32;
input[addr_size-1:0]addr;
inout[word_size-1:0]data_bus;
input ws, cs, oe;
reg[word_size-1:0]mem[memory_size-1:0];
assign data_bus=(oe && !cs && !ws) ? mem[addr]:8'bz;
always @(*)
begin
if(ws && !oe && !cs)
mem[addr]=data_bus;
end
endmodule
