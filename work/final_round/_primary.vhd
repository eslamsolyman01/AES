library verilog;
use verilog.vl_types.all;
entity final_round is
    port(
        final_round_data: in     vl_logic_vector(0 to 127);
        final_round_key : in     vl_logic_vector(0 to 127);
        final_round_out : out    vl_logic_vector(0 to 127)
    );
end final_round;
