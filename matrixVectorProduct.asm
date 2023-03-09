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
    

    
fin:
    mov ax, 4ch
    int 21h
code ends
