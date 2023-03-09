assume cs:code, ds:data

data segment
    taille db 3
    mat db 1,2,3,4,5,6,7,8,9
    vec db 2,3,4
    res dw 3 dup(0)
data ends

code segment
debut:
    mov ax, data
    mov ds, ax
    
    xor si, si
    xor bp, bp
    mov cl, taille
    dec cx
full_matrix:
    xor bx, bx
dot_product:
    mov al, mat[bp][si]
    mul vec[si]; vec1[i]*vec2[i]
    ; on additionne le résultat de la multiplication à bx
    add bx, ax
    ; si jamais on gère des words et non des bytes
    add bx, dx; 
    ; incrément indice
    inc si
    cmp si, cx
    jne dot_product
    ;ecriture memoire après chaque produit scalaire
    mov res[bp], bx
    inc bp
    cmp bp, cx 
    jne full_matrix
fin:
    mov ax, 4ch
    int 21h
code ends
    end debut