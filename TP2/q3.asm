assume CS:code
assume DS:data

data segment
    HELLO db "Bientôt les vacances"
data ends 

code segment 
debut: 

    mov AX, data    
    mov DS, AX

    lea SI, HELLO[13]
    mov AL, DS:[SI]

    mov AX, 4C00h
    int 21h    
code ends
    end debut