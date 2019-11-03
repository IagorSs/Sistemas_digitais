//apagaDisplay passado como parametro
module apagaDisplay(S);

	output [0:6]S;
	//assign S = 7'b1111111; //testar se isso funciona ou qual a forma correta para funcionar
	assign S[6] = 1;
	assign S[5] = 1;
	assign S[4] = 1;
	assign S[3] = 1;
	assign S[2] = 1;
	assign S[1] = 1;
	assign S[0] = 1;

endmodule

//Traduz 4 bits BCD pra um display de 7 segmentos
module displayBCD(A,B,C,D,S);
	input A,B,C,D;
	output reg [0:6] S;

	always@(*)
		begin
			case ({A,B,C,D})
			4'b0000: S = 7'b0000001;

			4'b0001: S = 7'b1001111;

			4'b0010: S = 7'b0010010;

			4'b0011: S = 7'b0000110;

			4'b0100: S = 7'b1001100;

			4'b0101: S = 7'b0100100;

			4'b0110: S = 7'b0100000;

			4'b0111: S = 7'b0001111;

			4'b1000: S = 7'b0000000;

			4'b1001: S = 7'b0000100;

			default: apagaDisplay(S);

			endcase
		end
endmodule