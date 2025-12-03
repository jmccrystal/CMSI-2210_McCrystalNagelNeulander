.global _findGCD
.align 2
.text

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