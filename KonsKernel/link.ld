/* link.ld */
OUTPUT_FORMAT(elf32-i386)
ENTRY(start)

SECTIONS {
    . = 1M; /* Kernel bei 1MB laden (Konvention) */

    .text : ALIGN(4K) {
        *(.multiboot)
        *(.text)
    }

    .rodata : ALIGN(4K) {
        *(.rodata)
    }

    .data : ALIGN(4K) {
        *(.data)
    }

    .bss : ALIGN(4K) {
        *(COMMON)
        *(.bss)
    }
}
