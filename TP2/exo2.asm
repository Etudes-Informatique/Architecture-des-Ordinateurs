assume CS:code

data segment
    VAR1 dw 1234h
data ends 

code segment 
debut: 
    mov AX, 75h
    mov DS:[0075h], AX

    mov AX, 4C00h
    int 21h    
code ends
    end debut