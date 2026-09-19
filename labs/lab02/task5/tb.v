module tb;

reg [3:0] t_a;
reg[3:0] t_b;
reg t_op;
wire [3:0] t_res;


alu DUT( .a(t_a), .b(t_b), .op(t_op) , .result(t_res));



integer i,j,k;

reg[3:0] expected;

initial begin

for( i = 0; i < 2;i++)begin
for(j = 0; j < 16;j++)begin
    for(k = 0;k < 16;k++)
    begin
        t_op = i;
        t_a = j;
        t_b = k;
        #5;

        if(i == 0) expected = j+k;
        else
        expected = j - k;

        if(t_res != expected) begin
            $display(" op = %d a = %d b = %d and got = %d expected = %d",t_op,t_a,t_b,t_res,expected);
        end

    end
end
end
$finish;
end
endmodule