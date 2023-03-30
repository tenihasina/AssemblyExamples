data segment
    haut db 2Ch, 76h, 0F5h, 32h, 10h, 0FFh, 67h, 45h
    bas db 0A4h, 67h, 89h, 0E0h, 32h, 54h, 0C0h, 98h
    result db 8 dup(?)
data ends

assume cs:code, ds:data

code segment
debut:
    mov ax, data
    mov ds, ax
    
    

code ends   
    end debut