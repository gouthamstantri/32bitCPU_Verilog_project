// Code your design here
module extender(
  input [23:0] instr,
  input [1:0] immsrc, 
  output reg [31:0] Extim);
  
  always @(*) begin
    case(immsrc)
      2'b00:Extim={24'b0 ,instr[7:0]};
      2'b00:Extim={20'b0 ,instr[11:0]};
      2'b00:Extim={{6{instr[23]}} ,instr[23:0],2'b00};
      default:Extim=32'bx;
    endcase
  end
endmodule

  
