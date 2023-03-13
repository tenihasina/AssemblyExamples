assume cs:code, ds:data
; 14, 2F, 4A
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

full_matrix:
    xor di, di
    xor bx, bx
    xor ax, ax
    lea bp, mat
dot_product:
    xor ax, ax
    xor dx, dx
    mov al, ds:[bp][si]
    mul byte ptr vec[di]; vec1[i]*vec2[i]
    ; on additionne le résultat de la multiplication à bx
    add bx, ax 
    ; si jamais on gère des words et non des bytes
    add bx, dx 
    ; incrément indice
    inc si
    inc di
    cmp di, cx
    jne dot_product
; emplacement mémoire indiqué par si
calcul_index_ecriture:
    xor ax, ax
    xor bp, bp
    mov ax, si
    div cl
    xor ah, ah; on ne veut pas du reste de la division
    mov bp, ax; emplacement pour des words, donc 2 cases mémoires
    dec bp
    add bp, bp
ecriture:
    mov res[bp], bx 
    ;xor dx, dx
    ; inc bp   
    cmp ax, cx 
    jne full_matrix
fin:
    mov ax, 4ch
    int 21h
code ends
    end debut