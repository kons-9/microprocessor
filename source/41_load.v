

`include "99_define.v"

module load(
    input wire [31:0]addr_data;
    input wire [1:0]addr_rem;
    input wire [2:0]info_load;

    output wire [31:0]load_data;
    );

    assign load_data = load_data(addr_data,addr_rem);

    function [31:0]load_data;
        input [31:0]data;
        input [1:0]mod_4;
        input [2:0]info_load;

        case(info_load)
            `Lb:begin
                case(mod_4)
                    2'b00:load_data <= {{24{data[7]}},data[7:0]};
                    2'b01: load_data <= {{24{data[15]}},data[15:8]};
                    2'b10:load_data <= {{24{data[23]}},data[23:16]};
                    2'b11:load_data <= {{24{data[31]}},data[31:24]};
                    default:load_data <= alu_result;
            end
            `Lbu:begin
                case(mod_4)
                    2'b00:load_data <= {{24{1'b0}},data[7:0]};
                    2'b01:load_data <= {{24{1'b0}},data[15:8]};
                    2'b10:load_data <= {{24{1'b0}},data[23:16]};
                    2'b11:load_data <= {{24{1'b0}},data[31:24]};
                    default:load_data <= alu_result;
            end
            `Lh:begin
                case(mod_4)
                    2'b00:load_data <= {{16{data[7]}},data[15:0]};
                    2'b01:load_data <= {{16{data[7]}},data[23:7]};
                    2'b10:load_data <= {{16{data[7]}},data[31:15]};
                    default:load_data <= alu_result;
            end
            `Lhu:begin
                case(mod_4)
                    2'b00:load_data <= {{16{1'b0}},data[15:0]};
                    2'b01:load_data <= {{16{1'b0}},data[23:7]};
                    2'b10:load_data <= {{16{1'b0}},data[31:15]};
                    default:load_data <= alu_result;
            end
            `Lw:load_data <= data;
            default:load_data <= alu_result;
        endcase

    endfunction

endmodule