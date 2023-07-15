module round_top 
(
    input [0:127] data, key, 
    output [0:127] round_out
);
    wire [0:127] sub_bytes_out, shift_rows_out, mix_columns_out;

//blocks instantiations
    //sub_bytes
        sub_bytes sub_bytes_inst (.sub_bytes_in(data), .sub_bytes_out(sub_bytes_out));
    //shift_rows
        shift_rows shift_rows_inst (.shift_rows_in(sub_bytes_out), .shift_rows_out(shift_rows_out));
    //mix_columns
        mix_columns mix_columns_inst (.mix_columns_in(shift_rows_out), .mix_columns_out(mix_columns_out));
    //add_round_key
        add_round_key add_round_key_inst (.add_round_key_in(mix_columns_out), .key(key), .add_round_key_out(round_out));


endmodule