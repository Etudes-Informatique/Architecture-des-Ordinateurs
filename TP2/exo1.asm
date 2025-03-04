assume CS:code
assume DS:data

data segment
    VAR1 db 'F'
    VAR2 dw 1234h
    VAR3 dd 12345678h
    tab1 db 12h, 24h, 56h, 78h
    tab2 db 'ABCDEF'
    tab3 db 100 dup(?)
data ends 

code segment 
debut: 
    mov AX, data
    mov DS, AX

    mov AL, tab2[0]
    mov AH, DS:[0010h]

    lea BP, tab2[0]
    lea SI, tab2[5]
    
    mov AL, DS:[BP]
    mov AH, DS:[SI]

    mov AX, 4C00h
    int 21h    
code ends
    end debut