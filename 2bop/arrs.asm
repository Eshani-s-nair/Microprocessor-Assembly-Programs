.model small
.stack 1000h
.data
arr dw 50 dup(?)
buffer db 6 dup('$')
len db ?
msg1 db "enter the size of the array : $"  
msg2 db 0dh,0ah,"enter element : $" 
newline db 0dh,0ah,"$" 
.code 
main PROC
mov ax,@data
mov ds,ax

lea dx,msg1
mov ah,09H
int 21H

mov ah,01H
int 21H
sub al,'0'
mov bl,al
mov len ,al

lea si,arr
mov cl,len

insert:
lea dx,msg2
mov ah,09H
int 21H

mov ah,01H
int 21H
sub al,'0'
mov bh,al

mov ah,01H
int 21H
sub al,'0'
mov bl,al

mov ah, 0
mov al, bh
mov dl, 10
mul dl
add al, bl
mov ah, 0
mov [si], ax

inc si 
inc si
dec cl
jnz insert 

sort :
lea si,arr
mov cl, len
dec cl
outer:
mov di,si
mov bl,cl
inner:
mov ax,[di]
cmp [di+2],ax
jbe noswap
xchg ax,[di+2]
mov [di],ax
noswap:
add di,2
dec bl
jnz inner
add si,2
dec cl
jnz outer

done :
lea si,arr
mov cl,len
print_loop:
mov ax,[si]
call DisplayDecimal
lea dx,newline
mov ah,09H
int 21H
add si,2
dec cl
jnz print_loop

mov ah,4Ch
int 21H
main endp

DisplayDecimal PROC
    push ax
    push bx
    push cx
    push dx
    push si

    mov cx,0
    mov bx,10
    mov dx,0
    mov si,offset buffer+4

next_digit:
    div bx
    add dl,'0'
    mov [si],dl
    dec si 
    inc cx
    mov dx,0
    test ax,ax
    jnz next_digit
    inc si 
    
print_digits:
    mov dl,[si]
    mov ah,02h
    int 21H
    inc si
    dec cx
    jnz print_digits
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret 
DisplayDecimal ENDP
end main    