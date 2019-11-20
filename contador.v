/*
Faz um contador de 0 a 9 exibindo em HEX0
*/

module contador(CLOCK_50, reset, preset, HEX0);
	input CLOCK_50, reset, preset; //reset SW[0]
	wire clock_modificado;
	reg[3:0] Q;
	output [0:6]HEX0;
	
	divisor ajuste(CLOCK_50, reset, clock_modificado);
	
	//Serve como um always q só vai funcionar uma vez, logo q o programa iniciar
	initial
		begin
			Q[3:0] = 4'b0000;
		end
		
	always@(negedge clock_modificado or posedge reset)	
		begin
			if (reset)
				Q[3:0] = 4'b0000;
			else
				begin
					Q = Q + 4'b0001;
					if(Q == 4'b1010)
						Q[3:0] = 4'b0000;
				end
		end

	displayBCD exit(Q[3],Q[2],Q[1],Q[0],HEX0);
		
endmodule