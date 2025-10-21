.model small
.stack 100H
.data 
msg1 db "enter the string: $"
msg2 db 0dh,0ah,"no of vowels :$"
str db 20
    db ?
    db 20 dup('$')
.code 
start:
    mov ax,@data 
    mov ds,ax
     
    lea dx,msg1
    mov ah,09H
    int 21H

    lea dx,str
    mov ah,0ah
    int 21H

    lea si,str+2
    mov cl,[str+1]
    mov bl,0
check:  
    mov al, [si]

    cmp al,'a'
    je isvowel
    cmp al,'e'
    je isvowel
    cmp al,'i'
    je isvowel
    cmp al,'o'
    je isvowel
    cmp al,'u'
    je isvowel
    cmp al,'A'
    je isvowel
    cmp al,'E'
    je isvowel
    cmp al,'I'
    je isvowel
    cmp al,'O'
    je isvowel
    cmp al,'U'
    je isvowel

nextchar:
    inc si
    dec cl
    jnz check
    jmp done

isvowel:
    inc bl
    jmp nextchar
    
done:
    lea dx,msg2
    mov ah,09H
    int 21H
    add bl,'0'
    mov dl,bl
    mov ah,02H
    int 21h 
    mov ah,4ch
    int 21H
end start



