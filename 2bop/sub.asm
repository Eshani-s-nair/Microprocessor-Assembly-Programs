;program to subtract 2 byte numbers and display result
.MODEL SMALL 
.STACK 100h
.DATA 
num1 DW 35 
num2 DW 12
result DW ?
msg1 DB 'Difference is: $'
buffer DB 6 DUP('$')
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV AX,num1
    SUB AX,num2
    MOV result,AX

    LEA DX,msg1
    MOV AH,09h
    INT 21h

    MOV AX,result
    CALL DisplayDecimal

    MOV AH,4Ch
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
    MOV SI,OFFSET buffer+4 ; last position of buffer
.next_digit:
    DIV BX             ; AX / 10 -> quotient in AX, remainder in DX
    ADD DL,'0'
    MOV [SI],DL
    DEC SI
    INC CX
    MOV DX,0
    TEST AX,AX
    JNZ .next_digit
    INC SI              ; point to first valid digit
.print_digits:
    MOV DL,[SI]
    MOV AH,02h
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