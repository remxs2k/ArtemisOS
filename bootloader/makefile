ASM = nasm
SRC = src\main.asm
OUT = build\main.bin
IMG = build\main_floppy.img

all: $(IMG)

$(IMG): $(OUT)
	copy /b $(OUT) $(IMG)
	fsutil file seteof $(IMG) 1474560


$(OUT): $(SRC)
	$(ASM) $(SRC) -f bin -o $(OUT)

run: all
	qemu-system-x86_64 -drive format=raw,file=$(IMG)

clean:
	del /f /q build\*.bin build\*.img
