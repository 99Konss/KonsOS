#include "drivers/screen.h"

void kmain(void) {
    clear_screen();
    print("Hello World!");

    while(1);
}
