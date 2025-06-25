ORG 0x7C00 
BITS 16

start:
    jmp main

puts: 
    push si 
    push ax

.loop:
    lodsb
    or al, al
    jz .done
    jmp .loop

.done:
    pop ax
    pop si
    ret

main:

    mov ax, 0
    mov ds, ax
    mov es, ax 

    ; setup stack
    mov ss, ax
    mov sp, 0x7C00
    
    hlt

.halt:
    jmp .halt

times 510-($-$$) db 0
dw 0xAA55