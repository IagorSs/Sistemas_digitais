//Soma A + B + Ci(Carry in) e da o retorno equivalente em S(soma) e Co(Carry out)
module somador1bit(A,B,S,Co,Ci);

	input A,B,Ci;
	output S,Co;
	assign S = ~Ci&(A^B) | Ci&(A^~B);
	assign Co = A&B | B&Ci | A&Ci;

endmodule