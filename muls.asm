; Program to multiply two one byte numbers
.MODEL SMALL
.STACK 100h
.DATA
num1 DB 1
num2 DB 1
prod DB ?
msg DB 'Product is: $'
.CODE
START:
    MOV AX, @DATA
    MOV DS, AX
    MOV AL, num1
    MOV BL, num2
    MUL BL
    MOV prod, AL
    LEA DX, msg
    MOV AH, 09h
    INT 21h
    MOV AL, prod
    ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    MOV AH, 4Ch
    INT 21h
END START
