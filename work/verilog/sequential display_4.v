/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module sequential_display_4 (
    input [1:0] count,
    input [15:0] a,
    input [15:0] b,
    input [15:0] o,
    input [15:0] alu,
    output reg [15:0] led_out,
    output reg [3:0] seg_out
  );
  
  
  
  always @* begin
    
    case (count)
      2'h1: begin
        led_out = {a[8+7-:8], a[0+7-:8]};
        seg_out = 4'ha;
      end
      2'h2: begin
        led_out = {b[8+7-:8], b[0+7-:8]};
        seg_out = 4'hb;
      end
      2'h3: begin
        led_out = {o[8+7-:8], o[0+7-:8]};
        if (alu == o) begin
          seg_out = 4'h9;
        end else begin
          seg_out = 4'hf;
        end
      end
      default: begin
        led_out = 16'h0000;
        seg_out = 4'he;
      end
    endcase
  end
endmodule
