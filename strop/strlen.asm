.MODEL SMALL
.STACK 100h
.DATA
msg1 DB 'Enter a string (max 20 chars): $'
input DB 21 DUP('$')   ; buffer for input string
msgLen DB 0DH,0AH,'Length of the string is: $'
len DW ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ; Display prompt
    LEA DX,msg1
    MOV AH,09h
    INT 21h

    ; Read string from keyboard (max 20 chars)
    MOV AH,0Ah
    LEA DX,input
    INT 21h

    ; Calculate length
    LEA SI,input+2    ; Skip first 2 bytes (buffer structure: maxLen, actualLen)
    MOV CL,[input+1]  ; actual length stored by DOS
    MOV len, CX       ; store length in len

    ; Display message
    LEA DX,msgLen
    MOV AH,09h
    INT 21h

    ; Display length as decimal
    MOV AX,len
    CALL DisplayDecimal

    ; Exit program
    MOV AH,4Ch
    INT 21h
MAIN ENDP

;--------------------
DisplayDecimal PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI

    MOV CX,0
    MOV BX,10
    MOV DX,0
    MOV SI,OFFSET input+20   ; use input buffer temporarily

.next_digit:
    DIV BX
    ADD DL,'0'
    MOV [SI], DL
    DEC SI
    INC CX
    MOV DX,0
    TEST AX,AX
    JNZ .next_digit

    INC SI
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
