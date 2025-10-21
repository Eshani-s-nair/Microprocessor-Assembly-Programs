.model small
.stack 100H
.data 
msg1 db "enter the string: $"
msg2 db 0dh,0ah,"the string is a palindrome $"
msg3 db 0dh,0ah,"the string is not a palindrome $"
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

lea si, str+2
mov cl, [str+1]     
dec cl
mov di, si
add di, cx           

mov cl, [str+1]
shr cl,1      

compare:
mov al,[si]
mov bl,[di]
cmp al,bl
jne no_pal
inc si 
dec di
dec cl
jnz compare

pal:
lea dx,msg2
mov ah,09H
int 21H
jmp done

no_pal:
lea dx,msg3
mov ah,09H
int 21H

done:
mov ah,4ch
int 21H

end start


