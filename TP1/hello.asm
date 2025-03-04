assume CS:code, DS:data

data segment 
    HELLO db "Hello world!", 10, 13, '$'
data ends

code segment 
debut:
    mov AX, data    
    mov DS, AX
    mov AH, 9
    lea DX, HELLO
    int 21h
    MOV AX, 4C00h
    int 21h
code ends  
    end debut