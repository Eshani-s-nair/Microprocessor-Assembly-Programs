;18.Write a MASM program using INT 13h to reset the disk system.
;If successful, display “Disk Ready”, otherwise display “Disk Error” using INT 21h.

.model small
.stack 100h

.data
disk db 'disk ready$'
errmsg db 'disk error$'

.code
main PROC
  mov ax, @data
  mov ds, ax

  mov ah, 00h
  mov dl, 0
  int 13h

  jc disk_error

display_ready:
  lea dx, disk
  mov ah, 09h
  int 21h
  jmp done

disk_error:
  lea dx, errmsg
  mov ah, 09h
  int 21h

done:
  mov ah, 4ch
  int 21h

main ENDP
END main