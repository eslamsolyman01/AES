module AES_top (
    input clk, reset_n, start, 
    input [0:127] key, data, 
    output reg done, 
    output [0:127] cipher
);

//Utilized instances
    //counter
        //counter wires
            localparam counter_bits = 4 ;
            reg counter_reset_n, counter_en;
            wire [counter_bits-1:0] round_number;
        
        //counter instance
            up_counter #(.counter_bits(counter_bits)) counter_inst
                        (.clk(clk), .reset_n(counter_reset_n), .enable(counter_en), .counter_out(round_number));

    //normal_round
        //round reg
            reg [0:127] round_data_in, round_key_in, round_out, round_reg;

        //round instance
            round_top round_top_inst (.data(round_data_in), .key(round_key_in), .round_out(round_out));
        
    //key_exp
        //key_exp wires
            reg [0:127] key_exp_in, key_exp_reg, key_exp_out;
        //key_exp inst
            key_exp key_exp_inst (.key_exp_in(key_exp_in), .round_number(round_number), .key_exp_out(key_exp_out));

    //add_round_key
        //add_round_key wires
            wire [0:127] add_round_key_data, add_round_key_key, add_round_key_out;
            assign add_round_key_data = data;
            assign add_round_key_key = key;

        //add_round_key inst
            add_round_key add_round_key_inst (.add_round_key_in(add_round_key_data), .key(add_round_key_key), .add_round_key_out(add_round_key_out));

    //final rounds
        //final_round_wires
            reg [0:127] final_round_data, final_round_key;
        //final_round_inst
            final_round final_round_inst (.final_round_data(final_round_data), .final_round_key(final_round_key), .final_round_out(cipher));

//FSM_code
    //this code will be based on the counter value which is the round number
    //states 
        localparam idle = 0 ;
        localparam r1 = 1 ;
        localparam r2 = 2 ;
        localparam r3 = 3 ;
        localparam r4 = 4 ;
        localparam r5 = 5 ;
        localparam r6 = 6 ;
        localparam r7 = 7 ;
        localparam r8 = 8 ;
        localparam r9 = 9 ;
        localparam r10 = 10 ;

always @(*) begin
    //default values
        counter_reset_n= reset_n;
        counter_en= 1'b0;

        round_data_in = 'd0;
        round_key_in = 'd0;

        key_exp_reg = key_exp_out;
        key_exp_in = 'd0;

        final_round_data = 'd0;
        final_round_key = 'd0;

        done = 1'b0;


    case (round_number)
        idle:begin
            if(start)
                counter_en = 1'b1;
        end 

        r1: begin
            //key_exp_siganls
                key_exp_in = key;
                key_exp_reg = key_exp_out; //store the current value of the reg  
                //i assume there will be a mistake due to this !
            
            //round signals
                round_data_in = add_round_key_out;
                round_key_in = key_exp_out;
                round_reg = round_out;//to store the value of the output //same as the key_exp_reg, i assume troubles
           

            //enable the counter
                counter_en = 1'b1;
        end

        r2: begin

            //key exp signals;
                key_exp_in = key_exp_reg;
                key_exp_reg = key_exp_out;
            
             //round signals 
                round_data_in = round_reg;
                round_key_in = key_exp_out;
                round_reg = round_out;

            //counter enable
                counter_en = 1'b1;
        end
        //from r2 >> r9 same signals
        r3: begin

            //key exp signals;
                key_exp_in = key_exp_reg;
                key_exp_reg = key_exp_out;
            
             //round signals 
                round_data_in = round_reg;
                round_key_in = key_exp_out;
                round_reg = round_out;

            //counter enable
                counter_en = 1'b1;
        end

        r4: begin

            //key exp signals;
                key_exp_in = key_exp_reg;
                key_exp_reg = key_exp_out;
            
             //round signals 
                round_data_in = round_reg;
                round_key_in = key_exp_out;
                round_reg = round_out;

            //counter enable
                counter_en = 1'b1;
        end

        r5: begin

            //key exp signals;
                key_exp_in = key_exp_reg;
                key_exp_reg = key_exp_out;
            
             //round signals 
                round_data_in = round_reg;
                round_key_in = key_exp_out;
                round_reg = round_out;

            //counter enable
                counter_en = 1'b1;
        end

        r6: begin

            //key exp signals;
                key_exp_in = key_exp_reg;
                key_exp_reg = key_exp_out;
            
             //round signals 
                round_data_in = round_reg;
                round_key_in = key_exp_out;
                round_reg = round_out;

            //counter enable
                counter_en = 1'b1;
        end

        r7: begin
   
            //key exp signals;
                key_exp_in = key_exp_reg;
                key_exp_reg = key_exp_out;
            
             //round signals 
                round_data_in = round_reg;
                round_key_in = key_exp_out;
                round_reg = round_out;

            //counter enable
                counter_en = 1'b1;
        end

        r8: begin

            //key exp signals;
                key_exp_in = key_exp_reg;
                key_exp_reg = key_exp_out;
            
             //round signals 
                round_data_in = round_reg;
                round_key_in = key_exp_out;
                round_reg = round_out;

            //counter enable
                counter_en = 1'b1;
        end

        r9: begin

            //key exp signals;
                key_exp_in = key_exp_reg;
                key_exp_reg = key_exp_out;
            
             //round signals 
                round_data_in = round_reg;
                round_key_in = key_exp_out;
                round_reg = round_out;

            //counter enable
                counter_en = 1'b1;
        end

        r10: begin
            //final_round

            //disable the counter
                counter_en = 1'b0;

            //key exp signals
                key_exp_in = key_exp_reg;
            //final_round_signals
                final_round_data = round_reg;
                final_round_key = key_exp_out;
            
            //assert done
                done = 1'b1;
            
            
        end    
        
        // default: 
    endcase



end



endmodule