module detector_secuencia(
    input clk, reset,
    input sequence_in,
    output reg match_sequence 
);

parameter   s0 = 3'b000,
            s1 = 3'b001,
            s2 = 3'b010,
            s3 = 3'b011,
            s4 = 3'b100,
            s5 = 3'b101;

reg [2:0] current_state, next_state;

always @(posedge clk or posedge reset)
begin
    if(reset)
        current_state <= s0;
    else
        current_state <= next_state;
end

always @(*)
begin
    match_sequence = 0;

    case(current_state)
        s0:
        begin
            if(sequence_in)
                next_state = s1;
            else
                next_state = s0;
        end
        s1:
        begin
            if(sequence_in)
                next_state = s2;
            else
                next_state = s0;
        end
        s2:
        begin
            if(sequence_in)
                next_state = s2;
            else
                next_state = s3;
        end
        s3:
        begin
            if(sequence_in)
                next_state = s4;
            else
                next_state = s0;
        end
        s4:
        begin
            if(sequence_in)
                next_state = s2;
            else
                next_state = s5;
        end
        s5:
        begin
            if(sequence_in)
                next_state = s1;
            else
                next_state = s0;
        end
        default:
            next_state = s0;
    endcase
end

always @(*)
begin
    if(current_state == s5)
        match_sequence = 1;
    else
        match_sequence = 0;
end
endmodule