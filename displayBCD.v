//apagaDisplay passado como parametro
module apagaDisplay(display);

	output [0:6]display;
	//assign display = 7'b1111111; //testar se isso funciona ou qual a forma correta para funcionar
	assign display[6] = 1;
	assign display[5] = 1;
	assign display[4] = 1;
	assign display[3] = 1;
	assign display[2] = 1;
	assign display[1] = 1;
	assign display[0] = 1;

endmodule

//Traduz 4 bits BCD pra um display de 7 segmentos
module displayBCD(A,B,C,D,display);
	input A,B,C,D;
	output reg [0:6] display;

	always@(*)
		begin
			// case funciona como um switch
			case ({A,B,C,D})
				4'b0000: display = 7'b0000001;

				4'b0001: display = 7'b1001111;

				4'b0010: display = 7'b0010010;

				4'b0011: display = 7'b0000110;

				4'b0100: display = 7'b1001100;

				4'b0101: display = 7'b0100100;

				4'b0110: display = 7'b0100000;

				4'b0111: display = 7'b0001111;

				4'b1000: display = 7'b0000000;

				4'b1001: display = 7'b0000100;

				default: apagaDisplay(display);

			endcase
		end
endmodule