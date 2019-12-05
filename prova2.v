// Prova 2
// Contador crescente/decrescente de 4 bits com chave em SW0
// Obrigatóriamente contendo PRESET RESET
// Exibe saida em HEX0 e HEX1

// Se reset(SW1) == 1 então deverá apaercer 00 no display BCD
// Se preset(SW2) == 1 então deverá apareecr 15 no display BCD
// Caso reset e preset estejam desativados o display deverá apresentar o comportamento de contador
// Se SW0 == 1 então o contador devera apresentar comportamento crescente

module displayBCD(A,B,C,D,display);
	input A,B,C,D;
	output reg [0:6] display;

	always@(*)
		begin
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

				default: display = 7'b1111111;

			endcase
		end
endmodule

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

module contador(CLOCK_50, SW1, SW2, HEX0, HEX1, SW0);
	input CLOCK_50, SW1, SW2, SW0;
	wire clock_modificado;
	reg[4:0] Q;
	output[0:6] HEX0, HEX1;
	wire[3:0] Dezena,Unidade;
	
	divisor ajuste(CLOCK_50, SW1|SW2, clock_modificado);
	
	initial
		begin
			Q[4:0] = 5'b00000;
		end
		
	always@(negedge clock_modificado or posedge SW1 or posedge SW2)	
		begin
			if (SW1)
				Q[4:0] = 5'b00000;
			else if(SW2)
				Q[4:0] = 5'b01111;
			else
				begin
					if(SW0)
						begin
							Q = Q + 5'b00001;
							if(Q == 5'b10000)
								Q[4:0] = 5'b00000;
						end
					else
						begin
							Q = Q - 5'b00001;
							if(Q == 5'b11111)
								Q[4:0] = 5'b01111;
						end
				end
		end

	assign Dezena = Q/10;
	assign Unidade = Q%10;

	displayBCD exitDezena(Dezena[3],Dezena[2],Dezena[1],Dezena[0],HEX1);
	displayBCD exitUnidade(Unidade[3],Unidade[2],Unidade[1],Unidade[0],HEX0);
		
endmodule