ORG 0x7C00 

start:
    cli         ; Disable interrupts 
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    ; Load GDT 
    lgdt [gdt_descriptor]

    ;Set PE bit (Protected Mode) in CR0
    mov eax, cr0   ; CR0 is a special register that controls the CPU’s mode (real/protected/long mode).
    or eax, 1
    mov cr0, eax

    ;Far Jump
    jmp CODE_SEG:init_pm 


;Protected Mode entry point

[BITS 32]

init_pm:
    ;Set up Data Segment
    mov ax, DATA_SEG
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    mov esp, 0x90000    ; we set the stack pointer ESP to a safe place high in memory (0x90000) to avoid conflicts.

    ;Write message to VGA text buffer
    mov esi, msg_pm
    mov edi, 0xB8000    ; EDI is the destination index: points to VGA text buffer (0xB8000) where characters appear on screen.

.print:
    lodsb
    test al, al
    jz .done
    mov [edi], al
    inc edi
    mov byte [edi], 0x1F ; White on Blue
    inc edi
    jmp .print

.done:
    hlt
    jmp $

msg_pm db "Protected Mode Active!", 0

gdt_start: 
gdt_null: dq 0


gdt_code: dw 0xFFFF
    dw 0x0000
    db 0x00
    db 10011010b
    db 11001111b 
    db 0x00

gdt_data: dw 0xFFFF
    dw 0x0000
    db 0x00
    db 10010010b
    db 11001111b
    db 0x00
gdt_end:

gdt_descriptor:
    dw gdt_end-gdt_start-1
    dd gdt_start

    CODE_SEG equ gdt_code - gdt_start
    DATA_SEG equ gdt_data - gdt_start


times 510-($-$$) db 0
dw 0xAA55