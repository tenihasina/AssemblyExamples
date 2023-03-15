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
    xor ax, ax; remise à zéro de ax pour les instructions suivantes

    mov bx, prod ;stockage temporaire du résultat   
    xor si, si
    mov cl, taille;somme de 0 à taille-1
boucle:
    mov al, vec1[si]
    mul vec2[si]; vec1[i]*vec2[i]
    ; on additionne le résultat de la multiplication à bx
    add bx, ax 
    ; incrément indice
    inc si
    loop boucle
    ;ecriture_memoire:
    mov prod, bx
fin:
    mov ax, 4ch
    int 21h    
code ends
    end debut