`timescale 1ns/1ns
module ram_tb;
reg[4:0] addr;
wire [7:0] data_bus;
reg ws, cs, oe;
integer i;
reg[7:0]temp;
ram uut(data_bus, addr, ws, cs, oe);
assign data_bus=temp;
initial begin
$vcdpluson;
$display("write");
for(i=0; i<32; i=i+1)
begin
ws=1;
oe=0;
cs=0;
addr=i;
temp=i;
#10;
end
$display("read");
for(i=0; i<32; i=i+1)
begin
ws=0;
oe=1;
cs=0;
addr=i;
#10;
end
#80
$finish();
end
initial
$monitor("%d cs=%b, ws=%b; oe=%b, addr=%b, uut.mem=%b", $time,cs,ws,oe,addr,uut.mem[i]);
endmodule
