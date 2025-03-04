data segment
   n db 7 
   var db 3
   tab db 12, 4, 3, 9, 5, 21, 16
   res db ? 
data ends

assume CS:code, DS:data

code segment
debut:   
   mov AX, data
   mov DS, AX
   lea BX, tab
   xor DX, DX
   xor CX, CX
   xor SI, SI
   mov CL, n
   mov DH, var
boucle:  
   xor AX, AX
   mov AL, byte ptr [BX+SI]
   div DH
   cmp AH, 0
   jne next
   inc DL
next: 
   inc SI
   dec CX
   cmp CX, 0
   jne boucle
   mov res, DL 
fin:  
   mov AX, 4C00h   
   int 21h
code ends
   end debut