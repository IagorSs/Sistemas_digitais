// Retorna o modulo de in em out
module complemento2(in,out,SINAL);

	input [5:0]in;
	input SINAL;
	wire [5:0]aux,carry;
	output [5:0]out;
	assign aux[5] = in[5] ^ SINAL;
	assign aux[4] = in[4] ^ SINAL;
	assign aux[3] = in[3] ^ SINAL;
	assign aux[2] = in[2] ^ SINAL;
	assign aux[1] = in[1] ^ SINAL;
	assign aux[0] = in[0] ^ SINAL;
	somador1bit somador0(0,aux[0],out[0],carry[0],SINAL);
	somador1bit somador1(0,aux[1],out[1],carry[1],carry[0]);
	somador1bit somador2(0,aux[2],out[2],carry[2],carry[1]);
	somador1bit somador3(0,aux[3],out[3],carry[3],carry[2]);
	somador1bit somador4(0,aux[4],out[4],carry[4],carry[3]);
	somador1bit somador5(0,aux[5],out[5],carry[5],carry[4]);

endmodule