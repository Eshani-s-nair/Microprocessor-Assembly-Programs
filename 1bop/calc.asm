;menu driven calculator for one byte numbers
.MODEL SMALL
.STACK 100h
.DATA
msg1 DB 'Enter first number (0-9): $'
msg2 DB 0DH,0AH,'Enter second number (0-9): $'
msgOp DB 0DH,0AH,'Select operation: 1=Add 2=Sub 3=Mul 4=Div $'
msgResult DB 0DH,0AH,'Result: $'
num1 DB ?
num2 DB ?
op DB ?
res DB ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    LEA DX, msg1
    MOV AH,09h
    INT 21h
    MOV AH,01h
    INT 21h
    SUB AL,'0'       
    MOV num1, AL
    LEA DX, msg2
    MOV AH,09h
    INT 21h
    MOV AH,01h
    INT 21h
    SUB AL,'0'
    MOV num2, AL
    LEA DX, msgOp
    MOV AH,09h
    INT 21h
    MOV AH,01h
    INT 21h
    SUB AL,'0'
    MOV op, AL
    MOV AL,num1
    MOV BL,num2
    CMP op,1
    JE ADD_OP
    CMP op,2
    JE SUB_OP
    CMP op,3
    JE MUL_OP
    CMP op,4
    JE DIV_OP

    JMP END_CALC

ADD_OP:
    ADD AL,BL
    JMP STORE_RES
SUB_OP:
    SUB AL,BL
    JMP STORE_RES
MUL_OP:
    MUL BL         ; AL*BL -> AX
    ; Only store low byte
    MOV AL,AL
    JMP STORE_RES
DIV_OP:
    XOR AH,AH      ; clear AH for division
    DIV BL         ; AL / BL -> quotient in AL, remainder in AH
    MOV AL,AL      ; quotient in AL
    JMP STORE_RES

STORE_RES:
    MOV res, AL
    LEA DX, msgResult
    MOV AH,09h
    INT 21h
    MOV AL,res
    ADD AL,'0'
    MOV DL,AL
    MOV AH,02h
    INT 21h
END_CALC:
    MOV AH,4Ch
    INT 21h
MAIN ENDP
END MAIN
