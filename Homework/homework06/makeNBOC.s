	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 0	sdk_version 14, 4
	.globl	_host_is_little_endian          ; -- Begin function host_is_little_endian
	.p2align	2
_host_is_little_endian:                 ; @host_is_little_endian
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	w8, #1
	strh	w8, [sp, #14]
	ldrb	w8, [sp, #14]
	subs	w8, w8, #1
	cset	w8, eq
	and	w0, w8, #0x1
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_makeNBO                        ; -- Begin function makeNBO
	.p2align	2
_makeNBO:                               ; @makeNBO
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	w0, [x29, #-4]
	str	x1, [sp, #16]
	bl	_host_is_little_endian
	str	w0, [sp, #12]
	ldr	x8, [sp, #16]
	subs	x8, x8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB1_2
	b	LBB1_1
LBB1_1:
	ldr	w8, [sp, #12]
	ldr	x9, [sp, #16]
	str	w8, [x9]
	b	LBB1_2
LBB1_2:
	ldr	w8, [sp, #12]
	subs	w8, w8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB1_4
	b	LBB1_3
LBB1_3:
	ldur	w0, [x29, #-4]
	bl	_swap_bytes
	str	w0, [sp, #8]                    ; 4-byte Folded Spill
	b	LBB1_5
LBB1_4:
	ldur	w8, [x29, #-4]
	str	w8, [sp, #8]                    ; 4-byte Folded Spill
	b	LBB1_5
LBB1_5:
	ldr	w0, [sp, #8]                    ; 4-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function swap_bytes
_swap_bytes:                            ; @swap_bytes
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	w0, [sp, #12]
	ldrb	w9, [sp, #12]
	ldr	w8, [sp, #12]
	and	w8, w8, #0xff00
	lsl	w8, w8, #8
	orr	w8, w8, w9, lsl #24
	ldr	w9, [sp, #12]
	and	w9, w9, #0xff0000
	orr	w8, w8, w9, lsr #8
	ldr	w9, [sp, #12]
	and	w9, w9, #0xff000000
	orr	w0, w8, w9, lsr #24
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_print_conversion               ; -- Begin function print_conversion
	.p2align	2
_print_conversion:                      ; @print_conversion
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	w0, [x29, #-4]
	stur	w1, [x29, #-8]
	stur	w2, [x29, #-12]
	ldur	w8, [x29, #-4]
                                        ; implicit-def: $x11
	mov	x11, x8
	ldur	w8, [x29, #-8]
                                        ; implicit-def: $x10
	mov	x10, x8
	ldur	w9, [x29, #-12]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x11, [x9]
	str	x10, [x9, #8]
	str	x8, [x9, #16]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function

	.globl	_main                          ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!
	.cfi_def_cfa_offset 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x29, sp
	sub	sp, sp, #16
	.cfi_def_cfa_offset 32

	// default value 0x01020304
	mov	w8, #0x304
	movk	w8, #0x102, lsl #16
	str	w8, [sp, #4]

	// call makeNBO on default value
	str	wzr, [sp]                       // swapped = 0
	ldr	w0, [sp, #4]
	mov	x1, sp
	bl	_makeNBO

	mov	w2, w0                          // converted
	ldr	w3, [sp]                        // swapped flag
	ldr	w0, [sp, #4]                    // original
	mov	w1, w2
	mov	w2, w3
	bl	_print_conversion

	add	sp, sp, #16
	ldp	x29, x30, [sp], #16
	mov	w0, #0
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"%#010x -> %#010x (swapped=%d)\n"

.subsections_via_symbols
