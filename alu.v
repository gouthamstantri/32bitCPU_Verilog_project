module ALU (
  input  [31:0] SrcA,            // 32-bit input A
  input  [31:0] SrcB,            // 32-bit input B
  input  [1:0] ALUControl,       // ALU control signal to select operation
  output reg [31:0] ALUResult,   // 32-bit result
  output reg Zero,               // Zero flag
  output reg Negative,           // Negative flag
  output reg Overflow,           // Overflow flag
  output reg Carry               // Carry flag
);// outputs aredeclared reg as they store values which we will use in other functions when we call this file in otheer verilog functions and code
  always @(*) begin
    // Default assignments
    ALUResult = 32'b0;
    Carry = 1'b0;
    Overflow = 1'b0;
    Negative = 1'b0;

    case (ALUControl)
      2'b10: begin // AND operation
        ALUResult = SrcA & SrcB;
      end
      2'b11: begin // OR operation
        ALUResult = SrcA | SrcB;
      end
      2'b00: begin // ADD operation
        {Carry, ALUResult} = SrcA + SrcB; 
        Overflow = ((SrcA[31] == SrcB[31]) && (ALUResult[31] != SrcA[31])); 
      end
      2'b01: begin // SUB operation
        {Carry, ALUResult} = SrcA - SrcB;
        Overflow = ((SrcA[31] != SrcB[31]) && (ALUResult[31] != SrcA[31]));
      end
      default: begin
        ALUResult = 32'b0;
        Carry = 0;
        Overflow = 0;
      end
    endcase

    // Assign Zero flag
    Zero = (ALUResult == 32'b0) ? 1'b1 : 1'b0;
    // Assign Negative flag
    Negative = ALUResult[31]; // MSB indicates sign
  end
endmodule
