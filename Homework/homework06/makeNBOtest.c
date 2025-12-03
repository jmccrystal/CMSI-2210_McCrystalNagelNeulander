#define MAKE_NBOC_NO_MAIN
#include "makeNBOC.c"
#include <stddef.h>

int main(void) {
    uint32_t values[] = {
        0x01020304u,
        0xAABBCCDDu,
        0x12345678u,
        0x80000001u,
        0x00000000u
    };
    size_t total = sizeof(values) / sizeof(values[0]);

    printf("Host byte order: %s\n", host_is_little_endian() ? "little-endian" : "big-endian");

    for (size_t i = 0; i < total; ++i) {
        int swapped = 0;
        uint32_t converted = makeNBO(values[i], &swapped);
        printf("%#010x -> %#010x (swapped=%s)\n",
               values[i],
               converted,
               swapped ? "yes" : "no");
    }

    return 0;
}
