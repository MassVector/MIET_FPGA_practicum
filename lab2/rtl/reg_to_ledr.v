`timescale 1ns / 1ps

module reg_to_ledr(
  input        clk100_i,
  input        rst_i,
  input        bt_down,
  input  [9:0] sw_i,
  output [9:0] ledr_o);

reg  [9:0] q;

always @( posedge clk100_i or negedge rst_i ) begin				
  if( !rst_i ) begin //тут прописываем сброс в дефолт
    q <= 10'b0;
  end
  else 
    if( bt_down ) begin //тут записываем данные с SW
      q <= sw_i;
    end
end

assign ledr_o = q;

endmodule