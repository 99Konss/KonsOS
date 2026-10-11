; boot/boot.asm
bits 32
global start
extern kmain

section .multiboot
align 4
    dd 0x1BADB002
    dd 0x00
    dd -(0x1BADB002 + 0x00)

section .text
start:
    cli
    mov esp, stack_top

    call kmain

    hlt

section .bss
align 16
stack_bottom:
    resb 16384
stack_top:
