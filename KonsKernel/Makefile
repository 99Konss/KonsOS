CC = gcc
CFLAGS = -m32 -nostdlib -fno-builtin -nostdinc -fno-stack-protector -no-pie -Ikernel
ASM = nasm
ASMFLAGS = -f elf32

# Automatically find all assembly and C source files recursively
C_SOURCES = $(shell find kernel -name '*.c')
ASM_SOURCES = boot/boot.asm $(shell find kernel -name '*.asm')

# Convert source file paths to corresponding .o object paths
OBJ = $(C_SOURCES:.c=.o) $(ASM_SOURCES:.asm=.o) boot/multiboot.o

all: kernel.bin

%.o: %.asm
	$(ASM) $(ASMFLAGS) $< -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

kernel.bin: $(OBJ) link.ld
	ld -m elf_i386 -T link.ld -o kernel.bin $(OBJ)

run: kernel.bin
	qemu-system-i386 -kernel kernel.bin

clean:
	rm -f boot/*.o $(shell find kernel -name '*.o') kernel.bin
