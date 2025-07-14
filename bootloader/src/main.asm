ORG 0x7C00 

start:

    mov si, message

.print_loop:

    lodsb
    cmp al, 0
    je done
    mov ah, 0x0E
    mov bh, 0x00
    mov bl, 0x07
    int 0x10
    jmp .print_loop

done:

    hlt
    jmp $

message db "Hello, ArtemisOS", 0


times 510-($-$$) db 0
dw 0xAA55