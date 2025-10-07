.model small
.stack 1000h
.data
msg1 db 0dh,0ah,'enter the first number : $'
msg2 db 0dh,0ah,'enter the second number : $'
msg3 db 0dh,0ah,'enter the operation , 1=add,2=subtract,3=multiply,4=division,5= exit : $'
msg4 db 0dh,0ah,'result : $'
msg5 db 0dh,0ah,'reminder : $'
num1 dw ?
num2 dw ?
op db ?
result dw ?
reminder dw ?
buffer db 6 dup('$')
.code
main PROC
    mov ax,@data
    mov ds,ax
read:
    lea dx,msg1
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,'0'
    mov bh,al

    mov ah,01h
    int 21h
    sub al,'0'
    mov bl,al

    mov al,bh
    mov cl,10
    mul cl
    add al,bl
    mov num1,ax

     lea dx,msg2
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,'0'
    mov bh,al

    mov ah,01h
    int 21h
    sub al,'0'
    mov bl,al

    mov al,bh
    mov cl,10
    mul cl
    add al,bl
    mov num2,ax

    lea dx,msg3
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    mov op,al

    lea dx,msg4
    mov ah,09H
    int 21h



    cmp op ,'1'
    je addition
    cmp op ,'2'
    je subt
    cmp op ,'3'
    je mult
    cmp op ,'4'
    je divi
    cmp op ,'5'
    je done

addition:
    mov ax,num1
    add ax, num2
    mov result,ax
    call DisplayDecimal
    jmp read
subt:
    mov ax,num1
    sub ax,num2
    mov result,ax
    call DisplayDecimal
    jmp read
mult:
    mov ax,num1
    mul num2
    mov result,ax
    call DisplayDecimal 
    jmp read
divi:
    mov dx,0
    mov ax,num1
    div num2
    mov result,ax
    mov reminder,dx
    call DisplayDecimal
    lea dx,msg5
    mov ah,09H
    int 21h
    mov ax,reminder
    call DisplayDecimal
    jmp read
done:
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




    







    


