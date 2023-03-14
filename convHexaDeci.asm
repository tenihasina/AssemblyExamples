assume cs: code, ds:data

data segment
    valeur dw 0F8B4h; nombre à convertir
    diviseur dw 10000,1000,100,10,1; diviseurs successifs
    msg db 'Le code decimal est :','$'; affichage resultat
    res db 30h,30h,30h,30h,30h,'$'; tab resultats, 30h ascii 0
data ends

code segment
debut:
    mov ax, data
    mov ds, ax
    xor ax, ax
    xor dx, dx
    xor si, si
    xor bp, bp 
    mov ax, valeur
    mov cx, 5
divisions_successive:
    xor bx, bx
    div diviseur[si]
    add res[bp], al; 30h + quotient
    xor ax, ax
    mov ax, dx; reste devient le prochain dividende
    xor dx, dx
    add si,2 ; indice pour word
    inc bp ; indice pour byte 
    loop divisions_successive
affichage:
    lea dx, msg
    mov ah, 09h
    int 21h
    xor dx, dx
    lea dx, res
    mov ah, 09h
    int 21h
fin:
    mov ax, 4ch
    int 21h
code ends
    end debut
