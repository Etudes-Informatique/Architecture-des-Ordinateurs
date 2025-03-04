assume CS:code

data segment
    VAR1 db 'F'
data ends 

code segment 
debut: 
    mov AX, 'F'
    mov DS, AX
    mov AX, 4C00h
    int 21h    
code ends
    end debut