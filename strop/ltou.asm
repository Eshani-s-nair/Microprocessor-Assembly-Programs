.model small
.stack 100H
.data 
msg1 db "enter the string : $"
msg2 db 0dh,0ah,"the uppercase to lowercase string is : $"
str db 20 
    db ?
    db 20 dup('$')
new db 20
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
    lea di,new+2
    mov cl,[str+1]
change:
    mov al,[si]
    sub al,20H
    mov [di],al
    inc si
    inc di
    dec cl
    jnz change 

done:
    lea dx,msg2
    mov ah,09H
    int 21H

    lea dx,new+2
    mov ah,09H
    int 21H

    mov ah,4ch
    int 21H
end start
