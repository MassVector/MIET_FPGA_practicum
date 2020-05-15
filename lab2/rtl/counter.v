`timescale 1ns / 1ps

module counter (
  input         clk100_i,
  input         rstn_i,
  input  [9:0]  sw_i,
  input  [2:0]  key_i,
  output [9:0]  ledr_o,
  output [6:0]  hex3_o,
  output [6:0]  hex2_o,
  output [6:0]  hex1_o,
  output [6:0]  hex0_o);

reg  [9:0]  data;
reg  [15:0] counter;
reg         switch;
reg         checkprev;

always @( posedge clk100_i or negedge key_i[1] ) begin
  if( !key_i[1] ) begin
    data      <= 10'b0;
    counter   <= 16'h0;
    switch    <= 1'b0;
    checkprev <= 1'b0;
  end
  else begin
    if( !key_i[0] && key_i[2] && !checkprev ) begin
      switch <= 1'b1;
    end
    else begin
      if( key_i[0] )
        checkprev <= 1'b0;
      if( switch ) begin
        if( !key_i[2] && !key_i[0] ) begin
          data      <= sw_i;
          counter   <= counter + 1;
          switch    <= 1'b0;
          checkprev <= 1'b1;
        end
        else
          switch  <= 1'b0;
      end
    end
  end
end

assign ledr_o = data;

dec_hex HEX3 (
  .in ( counter [15:12] ),
  .ex ( hex3_o          )
);

dec_hex HEX2 (
  .in ( counter [11:8] ),
  .ex ( hex2_o         )
);

dec_hex HEX1 (
  .in ( counter [7:4] ),
  .ex ( hex1_o        )
);

dec_hex HEX0 (
  .in ( counter [3:0] ),
  .ex ( hex0_o        )
);

endmodule