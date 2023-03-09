assume cs:code, ds:data

data segment
    mat db 100 dup(?)
    vec db 10 dup(?)
    taille 10
    res dw 10 dup(0)
data ends

code segment
    mov ax, data
    mov ds, ax
    mov ax, 4ch
    int 21h
code ends
