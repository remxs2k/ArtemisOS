[org 0x7c00]

mov bx, HELLO
call print

call print_nl

mov dx, 0x12fe
call print_hex

jmp $

%include "boot_sect_print.asm"
%include "boot_sect_print_hex.asm"


HELLO:
    db 'Hello, World', 0

GOODBYE:
    db 'Goodbye', 0

times 510-($-$$) db 0    ; fills with 510 zeros minus the previous code

dw 0xAA55 ; the 'magic' number :)