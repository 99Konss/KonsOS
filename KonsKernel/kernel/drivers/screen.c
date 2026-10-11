#include "screen.h"

#define VGA_ADDRESS 0xB8000
#define ATTRIBUTE_BYTE 0x0F

void print(const char *message) {
    unsigned char *vga = (unsigned char *) VGA_ADDRESS;
    int i = 0;

    while (message[i] != '\0') {
        vga[i * 2] = message[i];
        vga[i * 2 + 1] = ATTRIBUTE_BYTE;
        i++;
    }
}

void clear_screen(void) {
    unsigned char *vga = (unsigned char *) VGA_ADDRESS;
    for (int i = 0; i < 80 * 25 * 2; i += 2) {
        vga[i] = ' ';
        vga[i + 1] = ATTRIBUTE_BYTE;
    }
}
