NASM   = nasm
CC     = gcc
LD     = ld
OBJCOPY = objcopy
QEMU   = qemu-system-i386

CFLAGS   = -m32 -ffreestanding -nostdlib
LDFLAGS  = -m elf_i386 -T linker.ld

all: os-image.bin

bootloader.bin: boot.asm
	$(NASM) -f bin $< -o $@

kernel.o: kernel.c
	$(CC) $(CFLAGS) -c $< -o $@

kernel.elf: kernel.o
	$(LD) $(LDFLAGS) $< -o $@

kernel.bin: kernel.elf
	$(OBJCOPY) -O binary $< $@

os-image.bin: bootloader.bin kernel.bin
	cat $^ > $@

run: os-image.bin
	$(QEMU) -drive format=raw,file=$<

clean:
	rm -f *.o *.elf *.bin os-image.bin
