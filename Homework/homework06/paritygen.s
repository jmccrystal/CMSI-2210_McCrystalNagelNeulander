.global _main
.align 2

_main:
    sub sp, sp, #16
    str x29, [sp]
    str x30, [sp, #8]
    mov x29, sp
    cmp x0, #2
    b.lt _exit_error
    ldr x19, [x1, #8]
    mov x20, x19
    mov x23, #0

loop_start:
    ldrb w0, [x20], #1
    cbz w0, loop_end
    cmp w0, #'1'
    b.ne loop_start
    add x23, x23, #1
    b loop_start

loop_end:
    and x0, x23, #1
    eor x0, x0, #1
    add w0, w0, #'0'      
    sub sp, sp, #16
    strb w0, [sp]
    mov x0, #1
    mov x1, sp
    mov x2, #1
    mov x16, #4
    svc #0x80
    add sp, sp, #16
    mov x0, #0
    ldp x29, x30, [sp], #16
    ret

_exit_error:
    mov x0, #1
    ldp x29, x30, [sp], #16
    ret