mov ah, 0x0e

mov bp, 0x8000
mov sp, bp

push 's'
push 'u'
push 'm'
push 'e'
push 'R'

mov al, [0x8000]
int 0x10

pop bx
mov al, bl
int 0x10

pop bx
mov al, bl
int 0x10

pop bx
mov al, bl
int 0x10

pop bx
mov al, bl
int 0x10

pop bx
mov al, bl
int 0x10


jmp $

times 510-($-$$) db 0
dw 0xaa55