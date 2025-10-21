.model small
.stack 100H
.data 
msg1 db "enter the string: $"   
msg2 db 0dh,0ah,"string after removing spaces : $"
str db 20 
    db ?
    db 20 dup('$')
newstr db 20 
    db ?
    db 20
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
lea di ,newstr+2

check:
mov ah,[si]
cmp ah,20H
je increment
mov [di],ah
inc si 
inc di 
dec cl
jnz check
jmp done

increment:
inc si 
jmp check
done:
mov ah,'$'
mov [di],ah
lea dx,msg2
mov ah,09H
int 21H

lea dx,newstr+2
mov ah,09H
int 21H

mov ah,4ch
int 21H

end start