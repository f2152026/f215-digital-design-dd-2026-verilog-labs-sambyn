module tb;


reg [1:0] t_a;
reg [1:0] t_b;
wire t_gt;
wire t_lt;
wire t_eq;

comp2 DUT (
    .A(t_a),
    .B(t_b),
    .GT(t_gt),
    .LT(t_lt),
    .EQ(t_eq)
);
integer i,j;
initial begin
for(i = 0; i<=3;i++)
begin
    for(j = 0; j <= 3; j++)
    begin
    t_a = i;
    t_b = j;
    #5;
    if (t_gt !== (i > j) || t_lt !== (i < j) || t_eq !== (i == j)) begin
          $display("A=%d B=%d and GT=%b LT=%b EQ=%b", 
                    t_a, t_b, t_gt, t_lt, t_eq);
    end
    end
end

$finish;
end

endmodule