assume CS:code

code segment
debut:
    mov AL, 0E9h
    sub AL, 21h
    mov AX, 4C00h
    int 21h
code ends
    end debut