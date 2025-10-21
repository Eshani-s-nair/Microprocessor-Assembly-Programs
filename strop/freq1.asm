.model small
.stack 100H
.data
msg1 db "Enter the string : $"
msg2 db 0dh,0ah,"Character : $"
msg3 db 0dh,0ah,"Frequency : $"
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
    mov ah,0AH
    int 21H

    lea si,str+2           
    mov cl,[str+1]         

next_char:
    mov al,'$'
    cmp [si],al
    je done                
    mov al,'_'
    cmp [si],al
    je skip_char         

    mov bh,1               
    mov di,si
    inc di              
    mov bl,cl

inner_loop:
    mov al,'$'
    cmp [di],al
    je print_result       
    mov al,[si]
    cmp al,[di]
    jne not_same
    mov byte ptr [di],'_'  
    inc bh                
not_same:
    inc di
    dec bl
    jnz inner_loop

print_result:
    lea dx,msg2
    mov ah,09H
    int 21H

    mov dl,[si]
    mov ah,02H
    int 21H

    lea dx,msg3
    mov ah,09H
    int 21H

    mov al,bh
    add al,30H
    mov dl,al
    mov ah,02H
    int 21H

skip_char:
    inc si
    dec cl
    jnz next_char

done:
    mov ah,4CH
    int 21H
end start
