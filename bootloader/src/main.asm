ORG 0x7C00 
BITS 16

main:

    mov ax, 0
    mov ds, ax
    mov es, ax 

    
    HLT

.halt:
    JMP .halt

times 510-($-$$) DB 0
DW 0xAA55