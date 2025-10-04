.MODEL SMALL
.STACK 100h
.DATA
num1 DW 35
num2 DW 12
result DW ?
remainder DW ?
msg1 DB 'Quotient is: $'
msg2 DB 0DH,0AH,'Remainder is: $'
buffer DB 6 DUP('$')

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV AX, num1
    XOR DX, DX
    MOV BX, num2
    DIV BX
    MOV result, AX
    MOV remainder, DX

    LEA DX, msg1
    MOV AH, 09h
    INT 21h
    MOV AX, result
    CALL DisplayDecimal

    LEA DX, msg2
    MOV AH, 09h
    INT 21h
    MOV AX, remainder
    CALL DisplayDecimal

    MOV AH, 4Ch
    INT 21h
MAIN ENDP

DisplayDecimal PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI

    MOV CX,0
    MOV BX,10
    MOV DX,0
    MOV SI, OFFSET buffer+5

.next_digit:
    DIV BX
    ADD DL, '0'
    MOV [SI], DL
    DEC SI
    INC CX
    MOV DX,0
    TEST AX, AX
    JNZ .next_digit

    INC SI
.print_digits:
    MOV DL, [SI]
    MOV AH, 02h
    INT 21h
    INC SI
    DEC CX
    JNZ .print_digits

    POP SI
    POP DX
    POP CX
    POP BX
    POP AX
    RET
DisplayDecimal ENDP

END MAIN
