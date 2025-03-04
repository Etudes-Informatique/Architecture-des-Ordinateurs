assume CS:code

data segment
    VAR1 db 'F'
    VAR2 db 'A'
data ends 

code segment 
debut: 

    mov AL, 'A'
    mov AH, 'F'

    mov AX, 4C00h
    int 21h    
code ends
    end debut