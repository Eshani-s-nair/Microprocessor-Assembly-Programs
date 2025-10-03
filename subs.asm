;subtraction of two one byte numbers
.MODEL SMALL
.STACK 100h
.DATA
num1 DB 5
num2 DB 3
diff DB ?
msg DB 'Difference is: $'
.CODE
START:
    MOV AX, @DATA
    MOV DS, AX
    MOV AL, num1
    SUB AL, num2
    MOV diff, AL
    LEA DX, msg
    MOV AH, 09h
    INT 21h
    MOV AL, diff
    ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    MOV AH, 4Ch
    INT 21h
END START
