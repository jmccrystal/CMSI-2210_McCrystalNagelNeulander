#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int host_is_little_endian(void) {
    uint16_t value = 0x0001;
    return *((uint8_t *)&value) == 0x01;
}

static uint32_t swap_bytes(uint32_t value) {
    return ((value & 0x000000FFu) << 24) |
           ((value & 0x0000FF00u) << 8) |
           ((value & 0x00FF0000u) >> 8) |
           ((value & 0xFF000000u) >> 24);
}

uint32_t makeNBO(uint32_t value, int *did_swap) {
    int little = host_is_little_endian();
    if (did_swap) {
        *did_swap = little;
    }

    return little ? swap_bytes(value) : value;
}

void print_conversion(uint32_t original, uint32_t converted, int swapped) {
    printf("%#010x -> %#010x (swapped=%d)\n", original, converted, swapped);
}

#ifndef MAKE_NBOC_NO_MAIN
int main(int argc, char **argv) {
    uint32_t value = 0x01020304u;
    if (argc > 1) {
        value = (uint32_t)strtoul(argv[1], NULL, 0);
    }

    printf("Host byte order: %s\n", host_is_little_endian() ? "little-endian" : "big-endian");
    int swapped = 0;
    uint32_t converted = makeNBO(value, &swapped);
    print_conversion(value, converted, swapped);
    return 0;
}
#endif
