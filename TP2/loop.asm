assume CS:code
assume DS:donne

donne segment
    tab1 db 26 dup(?)
    tab2 db 1 dup(?), 10, 13, '$'
donne ends

code segment
debut:
    xor SI, SI
    mov AL, 0061h
    mov CX, 26  

boucle:
    inc AX
    mov tab1[SI], AL
    loop boucle
boucle2:
    mov AL, tab1[Si]
    sub AL, 20
    
    mov tab2[0], AL
    lea DX, tab2
    int 21h
    loop boucle2

    mov AX, 4C00h
    int 21h 

code ends
    end debut