
module tb();
    reg clk, reset, clr, load, en, up;
    reg [7:0] d;
    wire max_tick, min_tick;
    wire [7:0] q;
    wire [1:0] q1; 
    
    //counter_sm c1(q1, clk, reset);

    counter #(8, 163) dut (clk, reset, clr, load, en, up, d, max_tick, min_tick, q);

    initial
    begin
        clk = 0;
        //forever #10 clk = ~clk;
    end
    always @(clk) clk <= ~clk;

    initial begin
        reset = 1'b1;
        #5;
        reset = 1'b0;
    end

  initial
    begin
        $dumpfile("counter.vcd"); 
        $dumpvars;
    end 
    /*initial 
        $monitor("%d ", q1);
    */
    initial begin
        $monitor("%t %d ", $time, q, max_tick);
        #100;
        clr = 1'b0;
        load = 1'b0;
        up = 1'b0;
        en = 1'b0;
        d = 8'b0000_0000;
        #10;
        //@ (negedge reset);
        //@ (negedge clk);
        en = 1'b1;
        up = 1'b1;
        #20000;
        en = 1'b0;
        #100 $finish;
    end
endmodule

