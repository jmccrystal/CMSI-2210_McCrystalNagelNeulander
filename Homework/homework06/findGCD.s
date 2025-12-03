.global _start
.align 2

.data
    inputBuffer: .space 128
    outputBuffer: .space 20
    newline: .ascii "\n"

.text

_start:
    mov x0, #0
    adrp x1, inputBuffer@PAGE
    add x1, x1, inputBuffer@PAGEOFF
    mov x2, #128
    mov x16, #3
    svc #0

    cmp x0, #0
    b.le _exit

    adrp x1, inputBuffer@PAGE
    add x1, x1, inputBuffer@PAGEOFF
    bl _atoi
    mov x19, x0

    mov x0, x1
    bl _atoi
    mov x20, x0

    mov x0, x19
    mov x1, x20
    bl _findGCD
    mov x19, x0

    mov x0, x19
    adrp x1, outputBuffer@PAGE
    add x1, x1, outputBuffer@PAGEOFF
    bl _itoa
    mov x21, x0

    mov x0, #1
    adrp x1, outputBuffer@PAGE
    add x1, x1, outputBuffer@PAGEOFF
    mov x2, x21
    mov x16, #4
    svc #0

    mov x0, #1
    adrp x1, newline@PAGE
    add x1, x1, newline@PAGEOFF
    mov x2, #1
    mov x16, #4
    svc #0

_exit:
    mov x0, #0
    mov x16, #1
    svc #0

_findGCD:
    cmp x0, x1
    b.eq L_done
    b.lt L_swap

    sub x0, x0, x1
    b _findGCD

L_swap:
    sub x1, x1, x0
    b _findGCD

L_done:
    ret

_atoi:
    mov x0, #0
    mov x3, #10

_atoi_skip_whitespace:
    ldrb w2, [x1]
    cmp w2, #32
    b.eq _atoi_inc_skip
    cmp w2, #9
    b.eq _atoi_inc_skip
    cmp w2, #10
    b.eq _atoi_inc_skip
    b _atoi_convert

_atoi_inc_skip:
    add x1, x1, #1
    b _atoi_skip_whitespace

_atoi_convert:
    ldrb w2, [x1]
    sub w2, w2, #48
    cmp w2, #0
    b.lt _atoi_end
    cmp w2, #9
    b.gt _atoi_end

    mul x0, x0, x3
    add x0, x0, x2
    add x1, x1, #1
    b _atoi_convert

_atoi_end:
    ret

_itoa:
    cmp x0, #0
    b.ne _itoa_start
    mov w2, #48
    strb w2, [x1]
    mov x0, #1
    ret

_itoa_start:
    mov x2, x0
    mov x3, #10
    mov x4, x1
    mov x5, x1

_itoa_loop:
    udiv x6, x2, x3
    msub x0, x6, x3, x2
    
    add x0, x0, #48
    strb w0, [x5], #1
    
    mov x2, x6
    cmp x2, #0
    b.ne _itoa_loop

    sub x0, x5, x4
    
    sub x5, x5, #1
    
_itoa_reverse:
    cmp x4, x5
    b.ge _itoa_done
    
    ldrb w2, [x4]
    ldrb w3, [x5]
    strb w3, [x4]
    strb w2, [x5]
    
    add x4, x4, #1
    sub x5, x5, #1
    b _itoa_reverse

_itoa_done:
    ret