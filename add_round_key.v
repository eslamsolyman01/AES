module add_round_key 
(
    input [0:127] add_round_key_in, key,
    output [0:127] add_round_key_out
);
localparam byte_size = 8;

//wires for data "a"
    wire [0:byte_size-1] a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15;

//wires for key "k"
    wire [0:byte_size-1] k0, k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11, k12, k13, k14, k15;


//wires for output "b"
    wire [0:byte_size-1] b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15;

//partitoining the data 
    assign a0 = add_round_key_in[0 : byte_size - 1];
    assign a1 = add_round_key_in[byte_size : 2 * byte_size - 1];
    assign a2 = add_round_key_in[2 * byte_size : 3 * byte_size - 1];
    assign a3 = add_round_key_in[3 * byte_size : 4 * byte_size - 1];
    assign a4 = add_round_key_in[4 * byte_size : 5 * byte_size - 1];
    assign a5 = add_round_key_in[5 * byte_size : 6 * byte_size - 1];
    assign a6 = add_round_key_in[6 * byte_size : 7 * byte_size - 1];
    assign a7 = add_round_key_in[7 * byte_size : 8 * byte_size - 1];
    assign a8 = add_round_key_in[8 * byte_size : 9 * byte_size - 1];
    assign a9 = add_round_key_in[9 * byte_size : 10 * byte_size - 1];
    assign a10 = add_round_key_in[10 * byte_size : 11 * byte_size - 1];
    assign a11 = add_round_key_in[11 * byte_size : 12 * byte_size - 1];
    assign a12 = add_round_key_in[12 * byte_size : 13 * byte_size - 1];
    assign a13 = add_round_key_in[13 * byte_size : 14 * byte_size - 1];
    assign a14 = add_round_key_in[14 * byte_size : 15 * byte_size - 1];
    assign a15 = add_round_key_in[15 * byte_size : 16 * byte_size - 1];

//partitoining the key
    assign k0 = key[0 : byte_size - 1];
    assign k1 = key[byte_size : 2 * byte_size - 1];
    assign k2 = key[2 * byte_size : 3 * byte_size - 1];
    assign k3 = key[3 * byte_size : 4 * byte_size - 1];
    assign k4 = key[4 * byte_size : 5 * byte_size - 1];
    assign k5 = key[5 * byte_size : 6 * byte_size - 1];
    assign k6 = key[6 * byte_size : 7 * byte_size - 1];
    assign k7 = key[7 * byte_size : 8 * byte_size - 1];
    assign k8 = key[8 * byte_size : 9 * byte_size - 1];
    assign k9 = key[9 * byte_size : 10 * byte_size - 1];
    assign k10 = key[10 * byte_size : 11 * byte_size - 1];
    assign k11 = key[11 * byte_size : 12 * byte_size - 1];
    assign k12 = key[12 * byte_size : 13 * byte_size - 1];
    assign k13 = key[13 * byte_size : 14 * byte_size - 1];
    assign k14 = key[14 * byte_size : 15 * byte_size - 1];
    assign k15 = key[15 * byte_size : 16 * byte_size - 1];

//assigning the output values
    assign b0 = a0 ^ k0;
    assign b1 = a1 ^ k1;
    assign b2 = a2 ^ k2;
    assign b3 = a3 ^ k3;
    assign b4 = a4 ^ k4;
    assign b5 = a5 ^ k5;
    assign b6 = a6 ^ k6;
    assign b7 = a7 ^ k7;
    assign b8 = a8 ^ k8;
    assign b9 = a9 ^ k9;
    assign b10 = a10 ^ k10;
    assign b11 = a11 ^ k11;
    assign b12 = a12 ^ k12;
    assign b13 = a13 ^ k13;
    assign b14 = a14 ^ k14;
    assign b15 = a15 ^ k15;

//output logic
    assign add_round_key_out = {b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15};

endmodule