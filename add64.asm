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
    lea bx, haut[7]
    lea si, bas[7]
    lea di, result[7]
    mov cx, 8
    ; clear carry
    boucle:
        xor ax, ax
        mov al, byte ptr [bx]
        clc
        popf
        adc al, byte ptr [si]
        pushf
        mov [di], al
        dec bx
        dec si
        dec di
    loop boucle
    mov ax, 4ch
    int 21h
code ends   
    end debut