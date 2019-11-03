// Retorna o modulo de A em S
module complemento2(A,S,SINAL);

	input [5:0]A;
	input SINAL;
	wire [5:0]aux,carry;
	output [5:0]S;
	assign aux[5] = A[5] ^ SINAL;
	assign aux[4] = A[4] ^ SINAL;
	assign aux[3] = A[3] ^ SINAL;
	assign aux[2] = A[2] ^ SINAL;
	assign aux[1] = A[1] ^ SINAL;
	assign aux[0] = A[0] ^ SINAL;
	somador1bit somador0(0,aux[0],S[0],carry[0],SINAL);
	somador1bit somador1(0,aux[1],S[1],carry[1],carry[0]);
	somador1bit somador2(0,aux[2],S[2],carry[2],carry[1]);
	somador1bit somador3(0,aux[3],S[3],carry[3],carry[2]);
	somador1bit somador4(0,aux[4],S[4],carry[4],carry[3]);
	somador1bit somador5(0,aux[5],S[5],carry[5],carry[4]);

endmodule