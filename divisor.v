/*
DIVISOR DE FREQUENCIA
contador de 23 bits Q[0] Q[1] ....... Q[22]
clock modificado = Q[22] == 50.000.000 / 2^23 = 6 Hz
*/

module divisor (CLOCK_50, reset, clock_modificado);
	input CLOCK_50, reset;
	output clock_modificado;

	reg [22:0]Q;

	always@(negedge CLOCK_50 or posedge reset)
	
		begin
			if (reset)
				Q = 0;
			else
				Q = Q + 1;
		end
		
		assign clock_modificado = Q[22];
		
endmodule
