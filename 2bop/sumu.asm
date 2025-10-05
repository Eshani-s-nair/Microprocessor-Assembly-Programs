; Program to sum two 2-digit numbers input as characters
.MODEL SMALL
.STACK 100h
.DATA
MSG1 DB 'Enter first number (2 digits): $'
MSG2 DB 0Dh,0Ah,'Enter second number (2 digits): $'
MSG3 DB 0Dh,0Ah,'Sum is: $'

.CODE
START:
    MOV AX,@DATA
    MOV DS,AX

    ; --- Input first number ---
    LEA DX,MSG1
    MOV AH,09H
    INT 21H

    ; Higher digit
    MOV AH,01H
    INT 21H
    SUB AL,'0'
    MOV BH,AL

    ; Lower digit
    MOV AH,01H
    INT 21H
    SUB AL,'0'
    MOV BL,AL

    ; --- Input second number ---
    LEA DX,MSG2
    MOV AH,09H
    INT 21H

    ; Higher digit
    MOV AH,01H
    INT 21H
    SUB AL,'0'
    MOV CH,AL

    ; Lower digit
    MOV AH,01H
    INT 21H
    SUB AL,'0'
    MOV CL,AL

    ; --- Add lower digits with manual carry ---
    MOV AL, BL
    ADD AL, CL
    CMP AL, 10
    JB NoCarryLower
    SUB AL, 10
    INC BH              ; carry to higher digit
NoCarryLower:
    MOV BL, AL          ; store lower result

    ; --- Add higher digits + carry ---
    MOV AL, BH
    ADD AL, CH
    MOV BH, AL          ; store higher digit result

    ; --- Display result ---
    LEA DX,MSG3
    MOV AH,09H
    INT 21H

    ; Display higher digit
    ADD BH,'0'
    MOV DL,BH
    MOV AH,02H
    INT 21H

    ; Display lower digit
    ADD BL,'0'
    MOV DL,BL
    MOV AH,02H
    INT 21H

    ; --- Exit program ---
    MOV AH,4CH
    INT 21H

END START
