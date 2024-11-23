`timescale 1ns/1ns
module memory_testbench;
reg[4:0]addr;
reg cs, oe;
wire[7:0] data;
integer i;
rom dut(data, addr, cs, oe);
initial begin
$readmemh("/home/users7/rk366163/526L/Lab8/mem_data.txt", dut.memory, 4, 31);
$display("Memory Initialised:");

for(i=4; i<32; i=i+1)
$display("[%0h]: %h", i, dut.memory[i]);

$display("Unspecified Locations:");
for(i=0; i<4; i=i+1)
$display("[%0h]: %h", i, dut.memory[i]);

for(i=16; i<24; i=i+1) begin
dut.memory[i]={dut.memory[i][7], dut.memory[i][1:0], dut.memory[i][1:0], dut.memory[i][5:2], dut.memory[i][4:3]};
end
$display("Memory Scrambled:");
for(i=16; i<24; i=i+1)
$display("[%0h]: %h", i, dut.memory[i]);
$finish();
end
endmodule
