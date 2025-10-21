.model small
.stack 100H
.data 
msg1 db "enter the string : $"
msg3 db 0dh,0ah," enter the character : $"
msg2 db 0dh,0ah, "the freqency of the letter is : $"
str db 20
    db ?
    db 20 dup('$')
char db ?
.code
start:
mov ax,@DATA
mov ds,ax

lea dx,msg1
mov ah,09H
int 21H

lea dx,str
mov ah,0ah
int 21H

lea dx,msg3
mov ah,09H
int 21H

lea dx,str
mov ah,01h
int 21H
mov char,al
lea si , str+2
mov cl,[str+1]
mov bl,0
check:
    mov ah,[si]
    cmp ah,char
    je increment 
    inc si 
    dec cl
    jnz check
    jmp done 

increment:
    inc bl
    inc si 
    dec cl 
    jmp check 
    
done:
    lea dx,msg2
    mov ah,09H
    int 21H
    
    mov al,bl
    add al,30h
    mov dl,al
    mov ah,02H
    int 21H

    mov ah,4ch
    int 21H
end start
    

