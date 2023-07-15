library verilog;
use verilog.vl_types.all;
entity round_top is
    port(
        data            : in     vl_logic_vector(0 to 127);
        key             : in     vl_logic_vector(0 to 127);
        round_out       : out    vl_logic_vector(0 to 127)
    );
end round_top;
