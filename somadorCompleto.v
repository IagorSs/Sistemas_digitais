//Somador completo de 4 bits, exibe a soma(A+B) e a diferença (A-B)
	
	/*
	para somar -> SINAL == 0
	para substrair -> SINAL == 1
	
	HEX1/HEX0 = Soma
	HEX7/HEX6 = Primeiro número(output)
	HEX5/HEX4 = Segundo número(output)
	LEDG[0]   = sinalizador de soma/subtração referencial à B -> aceso significa subtração
	LEDR[0]	  = sinalizador de sinal do resultado -> aceso significa negativo
	*/

module somadorCompleto(A,B,SINAL,HEX0,HEX1,HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,LED_SINAL,SINAL_SOMA);

	input [3:0]A, B;
	wire [5:0]auxA, auxBi, auxBo;
	assign auxA = ({2'b00,A});
	assign auxBi = ({2'b00,B});
	input SINAL;
	output [0:6]HEX0,HEX1,HEX7,HEX6,HEX5,HEX4,HEX3,HEX2;
	output LED_SINAL, SINAL_SOMA;
	
	assign LED_SINAL = SINAL;
	
	wire [5:0]auxSomai, auxSomao, auxCarry;
	wire [3:0]auxDezenaS,auxUnidadeS,auxDezenaPN,auxUnidadePN,auxDezenaSN,auxUnidadeSN;
	
	complemento2 transformadorB(auxBi,auxBo,SINAL);

	somador1bit bloco1(auxA[0],auxBo[0],auxSomai[0],auxCarry[0],0);
	somador1bit bloco2(auxA[1],auxBo[1],auxSomai[1],auxCarry[1],auxCarry[0]);
	somador1bit bloco3(auxA[2],auxBo[2],auxSomai[2],auxCarry[2],auxCarry[1]);
	somador1bit bloco4(auxA[3],auxBo[3],auxSomai[3],auxCarry[3],auxCarry[2]);
	somador1bit bloco5(auxA[4],auxBo[4],auxSomai[4],auxCarry[4],auxCarry[3]);
	somador1bit bloco6(auxA[5],auxBo[5],auxSomai[5],auxCarry[5],auxCarry[4]);
	
	assign SINAL_SOMA = auxSomai[5];
	complemento2 transformadorS(auxSomai,auxSomao,auxSomai[5]);

	assign auxDezenaS = auxSomao / 10;
	assign auxUnidadeS = auxSomao % 10;
	assign auxDezenaPN = A / 10;
	assign auxUnidadePN = A % 10;
	assign auxDezenaSN = B / 10;
	assign auxUnidadeSN = B % 10;

	displayBCD blocoSomaD(auxDezenaS[3],auxDezenaS[2],auxDezenaS[1],auxDezenaS[0],HEX1[0:6]);
	displayBCD blocoSomaU(auxUnidadeS[3],auxUnidadeS[2],auxUnidadeS[1],auxUnidadeS[0],HEX0[0:6]);
	displayBCD blocoPND(auxDezenaPN[3],auxDezenaPN[2],auxDezenaPN[1],auxDezenaPN[0],HEX7[0:6]);
	displayBCD blocoPNU(auxUnidadePN[3],auxUnidadePN[2],auxUnidadePN[1],auxUnidadePN[0],HEX6[0:6]);
	displayBCD blocoSND(auxDezenaSN[3],auxDezenaSN[2],auxDezenaSN[1],auxDezenaSN[0],HEX5[0:6]);
	displayBCD blocoSNU(auxUnidadeSN[3],auxUnidadeSN[2],auxUnidadeSN[1],auxUnidadeSN[0],HEX4[0:6]);
	apagaDisplay blocoApaga(HEX3);
	apagaDisplay blocoApaga1(HEX2);

endmodule
