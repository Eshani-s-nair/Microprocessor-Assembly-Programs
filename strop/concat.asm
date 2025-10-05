.MODEL SMALL
.STACK 100H
.DATA
    msg1 DB "Enter first string: $"
    msg2 DB 0DH,0AH,"Enter second string: $"
    msg3 DB 0DH,0AH,"Concatenated string is: $"

    str1 DB 100 DUP('$')        ; Buffer for first string
    str2 DB 100 DUP('$')        ; Buffer for second string
    result DB 200 DUP('$')      ; Buffer for concatenated result

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; -------- Input First String --------
    LEA DX, msg1
    MOV AH, 09H
    INT 21H

    LEA DX, str1
    MOV AH, 0AH                ; Function 0Ah - Buffered input
    INT 21H

    ; Get length of first string from str1+1
    MOV CL, [str1+1]           ; CL = length of first string
    LEA SI, str1+2             ; SI points to first char
    LEA DI, result             ; DI points to result buffer

    ; Copy first string to result
COPY_FIRST:
    MOV AL, [SI]
    MOV [DI], AL
    INC SI
    INC DI
    DEC CL
    JNZ COPY_FIRST

    ; -------- Input Second String --------
    LEA DX, msg2
    MOV AH, 09H
    INT 21H

    LEA DX, str2
    MOV AH, 0AH
    INT 21H

    ; Get length of second string from str2+1
    MOV CL, [str2+1]
    LEA SI, str2+2

    ; Append second string
COPY_SECOND:
    MOV AL, [SI]
    MOV [DI], AL
    INC SI
    INC DI
    DEC CL
    JNZ COPY_SECOND

    ; Terminate result with '$'
    MOV AL, '$'
    MOV [DI], AL

    ; -------- Display Concatenated String --------
    LEA DX, msg3
    MOV AH, 09H
    INT 21H

    LEA DX, result
    MOV AH, 09H
    INT 21H

    ; -------- Exit --------
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
