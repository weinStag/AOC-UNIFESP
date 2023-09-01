	
@ Baseado no exemplo inicial do simulador, imprima apenas os caracteres minúsculos.    

    JMP start
hello: DB "Hello World!" ; Variable
       DB 0	; String terminator

start:
	MOV C, hello    ; Point to var 
	MOV D, 232	; Point to output
	CALL print
        HLT             ; Stop execution

print:			; print(C:*from, D:*to)
	PUSH A
	PUSH B
	MOV B, 0 ; inicializou b 0
.loop:
	MOV A, [C]	; Get char from var
    CMP A, 97
    JAE .con
.ver1:
	INC C
	CMP B, [C]	; Check if end
	JNZ .loop	; jump if not
	POP B
	POP A
	RET

.con:
    CMP A, 122
    JBE .imprime
    .ver1

.imprime:
	MOV [D], A	; Write to output
    INC D
    .ver1