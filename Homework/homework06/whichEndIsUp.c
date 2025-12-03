#include <stdint.h>
#include <stdio.h>

static int is_little_endian(void) {
    uint32_t value = 0x01020304;
    uint8_t *first_byte = (uint8_t *)&value;
    return *first_byte == 0x04;
}

int main(void) {
    if (is_little_endian()) {
        printf("Little-endian (least significant byte stored first)\n");
    } else {
        printf("Big-endian (most significant byte stored first)\n");
    }

    return 0;
}
