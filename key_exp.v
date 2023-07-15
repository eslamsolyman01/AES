module key_exp 
(
    input [0:127] key_exp_in,
    input [3:0] round_number,
    output [0:127] key_exp_out
);
localparam byte_size = 8;

//wires for key "k"
    wire [0:byte_size-1] k0, k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11, k12, k13, k14, k15;
//partitoining the key
    assign k0 = key_exp_in[0 : byte_size - 1];
    assign k1 = key_exp_in[byte_size : 2 * byte_size - 1];
    assign k2 = key_exp_in[2 * byte_size : 3 * byte_size - 1];
    assign k3 = key_exp_in[3 * byte_size : 4 * byte_size - 1];
    assign k4 = key_exp_in[4 * byte_size : 5 * byte_size - 1];
    assign k5 = key_exp_in[5 * byte_size : 6 * byte_size - 1];
    assign k6 = key_exp_in[6 * byte_size : 7 * byte_size - 1];
    assign k7 = key_exp_in[7 * byte_size : 8 * byte_size - 1];
    assign k8 = key_exp_in[8 * byte_size : 9 * byte_size - 1];
    assign k9 = key_exp_in[9 * byte_size : 10 * byte_size - 1];
    assign k10 = key_exp_in[10 * byte_size : 11 * byte_size - 1];
    assign k11 = key_exp_in[11 * byte_size : 12 * byte_size - 1];
    assign k12 = key_exp_in[12 * byte_size : 13 * byte_size - 1];
    assign k13 = key_exp_in[13 * byte_size : 14 * byte_size - 1];
    assign k14 = key_exp_in[14 * byte_size : 15 * byte_size - 1];
    assign k15 = key_exp_in[15 * byte_size : 16 * byte_size - 1];

//gather the key into words
    wire [0:31] w0, w1, w2, w3;
    assign w0 = {k0, k1, k2, k3};
    assign w1 = {k4, k5, k6, k7};
    assign w2 = {k8, k9, k10, k11};
    assign w3 = {k12, k13, k14, k15};

//the g_block operation
    //here we operate on w3 which is {k12, k13, k14, k15}
    
    //the shifting operation
        wire [0: byte_size-1] B0, B1, B2, B3;
        assign B0 = k13;
        assign B1 = k14;
        assign B2 = k15;
        assign B3 = k12;

    //SBox part
        wire [0: byte_size-1] g0, g1, g2, g3;
        SBox KU0 (.addr(B0), .dout(g0));
        SBox KU1 (.addr(B1), .dout(g1));
        SBox KU2 (.addr(B2), .dout(g2));
        SBox KU3 (.addr(B3), .dout(g3));

    //round constant part
        reg [0:byte_size-1] round_constanst;
        always @(*) begin
                case (round_number)
                    4'b0001: round_constanst = 8'h01;
                    4'b0010: round_constanst = 8'h02;
                    4'b0011: round_constanst = 8'h04;
                    4'b0100: round_constanst = 8'h08;
                    4'b0101: round_constanst = 8'h10;
                    4'b0110: round_constanst = 8'h20;
                    4'b0111: round_constanst = 8'h40;
                    4'b1000: round_constanst = 8'h80;
                    4'b1001: round_constanst = 8'h1B;
                    4'b1010: round_constanst = 8'h36;
                    default: round_constanst = 8'h00;
                endcase
            end

    //generating the output of the g_box
        wire [0:31] g_out;
        assign g_out = {g0^round_constanst, g1, g2, g3};



//after finishing the g_block output 
//key_exp logic
    wire [0:31] w4, w5, w6, w7;
        assign w4= g_out^w0;
        assign w5 = w4 ^ w1;
        assign w6 = w5 ^ w2;
        assign w7 = w6 ^ w3;
 
//the output of the module
    assign key_exp_out = {w4, w5, w6, w7};

endmodule