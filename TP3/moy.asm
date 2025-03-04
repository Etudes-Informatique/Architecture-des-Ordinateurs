data segment
    moyenne db 1 dup(?)
    n db 6
    tab dw 26, 14, 9, 37, 13, 5
data ends

assume CS:code, DS:data

code segment
debut:
    mov AX, data
    mov DS, AX
    mov AX, tab[0]
    xor SI, SI
    mov SI, 0
boucle:
    add SI, 2
    add AX, tab[SI]
    cmp SI, 12
    jne boucle
division:
    mov DL, n
    div DL
fin:
    mov AX, 4C00h
    int 21h
code ends
    end debut