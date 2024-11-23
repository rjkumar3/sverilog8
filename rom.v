`timescale 1ns/1ns
module rom(data, addr, cs, oe);
parameter addr_size=5, word_size=8, memory_size=32;
input[addr_size-1:0]addr;
output reg[word_size-1:0]data;
input cs, oe;
reg[word_size-1:0]memory[memory_size-1:0];
always @(*)
begin
if(oe && !cs)
data=memory[addr];
end
endmodule
