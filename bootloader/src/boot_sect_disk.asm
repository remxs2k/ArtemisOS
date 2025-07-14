disk_load:
    pusha
    push dx

    mov ah, 0x02 ; 0x02 = read
    mov al, dh ; al <- # of sectors
    mov cl, 0x02 ; 0x01 is boot sector so 0x02 is our first 'available' sector

    mov ch, 0x00 ; ch <- cylinder 
    mov dh, 0x00 ; dh <- head #


    int 0x13
    jc disk_error

    pop dx
    cmp al, dh ; BIOS also sets 'al' to the # of sectors read, so we can compare it
    jne sectors_error
    popa
    ret

disk_error:

    mov bx, DISK_ERROR
    call print
    call print_nl
    mov dh, ah ; dh = error code, dh = disk drive that dropped the error
    call print_hex
    jmp disk_loop

sectors_error:
    mov bx, SECTORS_ERROR
    call print

disk_loop:
    jmp $

DISK_ERROR: db "Disk read error", 0
SECTORS_ERROR: db "Incorrect number of sectors read", 0