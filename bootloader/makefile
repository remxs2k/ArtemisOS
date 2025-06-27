ASM = nasm
SRC = src\main.asm
OUT = build\main.bin
IMG = build\main_floppy.img

SRC2 = src\boot_sect_memory.asm
OUT2 = build\boot_sect_memory.bin
IMG2 = build\main_floppy2.img


all: $(IMG)

$(IMG): $(OUT)
	copy /b $(OUT) $(IMG)
	fsutil file seteof $(IMG) 1474560


$(OUT): $(SRC)
	$(ASM) $(SRC) -f bin -o $(OUT)

all-2: $(IMG2)

$(IMG2): $(OUT2)
	copy /b $(OUT2) $(IMG2)
	fsutil file seteof $(IMG2) 1474560

$(OUT2): $(SRC2)
	$(ASM) $(SRC2) -f bin -o $(OUT2)

run: all
	qemu-system-x86_64 -drive format=raw,file=$(IMG)

run-2: all2
	qemu-system-x86_64 -drive format=raw,file=$(IMG2)
clean:
	del /f /q build\*.bin build\*.img
