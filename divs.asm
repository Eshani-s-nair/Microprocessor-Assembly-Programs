;division of two one byte numbers
.MODEL SMALL
.STACK 100h
.DATA
num1 DB 10
num2 DB 03
quot DB ?
rem  DB ?
msg1 DB 'Quotient is: $'
msg2 DB 0DH,0AH,'Remainder is: $'
.CODE
START:
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, num1
    MOV AH, 0
    MOV BL, num2
    DIV BL
    MOV quot, AL
    MOV rem, AH

    LEA DX, msg1
    MOV AH, 09h
    INT 21h
    MOV AL, quot
    ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h

    LEA DX, msg2
    MOV AH, 09h
    INT 21h
    MOV AL, rem
    ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h

    MOV AH, 4Ch
    INT 21h
END START
