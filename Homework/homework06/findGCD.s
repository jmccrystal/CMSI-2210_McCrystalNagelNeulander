.global _main
.global _gcd_func
.align 2

.section __TEXT,__cstring
_input_fmt:  .asciz "%ld %ld"
_output_fmt: .asciz "GCD is: %ld\n"

.section __TEXT,__text

_main:
    stp x29, x30, [sp, -16]!
    ldr x0, =3113041662
    ldr x1, =111570925
    
    bl _gcd_func

    mov x1, x0
    adrp x0, _output_fmt@PAGE
    add  x0, x0, _output_fmt@PAGEOFF 
    bl _printf
    
    mov x0, #0
    ldp x29, x30, [sp], 16
    ret

_gcd_func:
    cmp x0, x1
    b.eq L_done
    b.lt L_swap

    sub x0, x0, x1
    b _gcd_func

L_swap:
    sub x1, x1, x0
    b _gcd_func

L_done:
    ret