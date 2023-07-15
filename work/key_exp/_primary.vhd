library verilog;
use verilog.vl_types.all;
entity key_exp is
    port(
        key_exp_in      : in     vl_logic_vector(0 to 127);
        round_number    : in     vl_logic_vector(3 downto 0);
        key_exp_out     : out    vl_logic_vector(0 to 127)
    );
end key_exp;
