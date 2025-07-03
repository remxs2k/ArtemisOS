ASM = nasm
SRC = src\main.asm
OUT = build\main.bin
IMG = build\main_floppy.img

SRC2 = src\boot_sect_memory.asm
OUT2 = build\boot_sect_memory.bin
IMG2 = build\main_floppy2.img

SRC3 = src\boot_sect_stack.asm
OUT3 = build\boot_sect_stack.bin
IMG3 = build\main_floppy.img


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

all-3: $(IMG3)

$(IMG3): $(OUT3)
	copy /b $(OUT3) $(IMG3)
	fsutil file seteof $(IMG3) 1474560

$(OUT3): $(SRC3)
	$(ASM) $(SRC3) -f bin -o $(OUT3)

run: all
	qemu-system-x86_64 -drive format=raw,file=$(IMG)

run-2: all-2
	qemu-system-x86_64 -drive format=raw,file=$(IMG2)

run-3: all-3
	qemu-system-x86_64 -drive format=raw,file=$(IMG3)

clean:
	del /f /q build\*.bin build\*.img
