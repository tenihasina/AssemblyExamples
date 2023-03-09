assume cs:code, ds:data

data segment
    taille db 5
    vec1 db 1,2,3,4,5
    vec2 db 4,5,6,7,8
    prod dw 0
data ends

code segment
debut:
    mov ax, data
    mov ds, ax
    xor ax, ax    
    mov bx, prod    
    xor si, si
    mov cl, taille
boucle:
    mov al, vec1[si]
    mul vec2[si]
    add bx, ax
    add bx, dx
    inc si
    loop boucle
ecriture_memoire:
    mov prod, bx
fin:
    mov ax, 4ch
    int 21h    
code ends
    end debut