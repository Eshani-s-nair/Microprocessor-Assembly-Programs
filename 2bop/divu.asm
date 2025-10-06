;2 digit division user input 
.MODEL SMALL
.STACK 100h
.DATA
MSG1 DB 'ENTER FIRST NUMBER : $'
MSG2 DB 0DH,0AH,'ENTER SECOND NUMBER : $'
num1 DW ?
num2 DW ?
result DW ?
remainder DW ?
msg3 DB 0DH,0AH,'quotient is: $'
msg4 DB 0DH,0AH,'remainder is: $'
buffer DB 6 DUP('$') 
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    LEA DX,MSG1
    MOV AH,09H
    INT 21H

    MOV AH,01H
    INT 21H
    SUB AL,'0'
    MOV BH,AL

    MOV AH,01H
    INT 21H
    SUB AL,'0'
    MOV BL,AL

    MOV CL,10
    MOV AL,BH
    MUL CL
    ADD AL,BL
    MOV num1,AX

    LEA DX,MSG2
    MOV AH,09H
    INT 21H

    MOV AH,01H
    INT 21H
    SUB AL,'0'
    MOV CH,AL

    MOV AH,01H
    INT 21H
    SUB AL,'0'
    MOV CL,AL
    
    MOV BL,10
    MOV AL,CH
    MUL BL
    ADD AL,CL
    MOV num2,AX
    
    MOV AX,num1
    XOR DX,DX
    DIV num2
    MOV result,AX
    MOV remainder,DX

    LEA DX,msg3
    MOV AH,09h
    INT 21h

    MOV AX,result
    CALL DisplayDecimal

    LEA DX,msg4
    MOV AH,09h
    INT 21h

    MOV AX,remainder
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