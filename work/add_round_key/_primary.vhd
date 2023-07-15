library verilog;
use verilog.vl_types.all;
entity add_round_key is
    port(
        add_round_key_in: in     vl_logic_vector(0 to 127);
        key             : in     vl_logic_vector(0 to 127);
        add_round_key_out: out    vl_logic_vector(0 to 127)
    );
end add_round_key;
