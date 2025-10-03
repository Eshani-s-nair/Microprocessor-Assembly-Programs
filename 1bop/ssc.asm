;Adds two 1-byte numbers and displays the sum as a two-digit decimal number.
.MODEL SMALL
.STACK 100h
.DATA
num1 DB 9      
num2 DB 5 
temp DB ?    
sum  DB ?       
msg  DB 'Sum is: $' 
.CODE
START:
    MOV AX, @DATA
    MOV DS, AX    
    MOV AL, num1
    ADD AL, num2
    MOV sum, AL   
    LEA DX, msg
    MOV AH, 09h
    INT 21h
    MOV AL, sum
    MOV AH, 0
    MOV BL, 10
    DIV BL            
    ADD AL, 30h       
    ADD AH, 30h 
    MOV temp, AH      
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    MOV AH,temp
    MOV DL, AH
    MOV AH, 02h
    INT 21h
    MOV AH, 4Ch
    INT 21h
END START
