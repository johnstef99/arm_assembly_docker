.global pow
.section .text

// r0 base
// r1 power
pow:
        push    {lr}
        push    {r4-r11}

        mov     r4, r0              // copy number to r4
        cmp     r1, #0              // check if power is 0
        bls     zero                // return 1

    pow_loop:
        cmp     r1, #1              // if power is 1 return
        beq     exit
        mul     r0, r4, r0          // else r0=r0*r4
        sub     r1, r1, #1          // power = power-1
        b       pow_loop

    zero:
        mov     r0, #1

    exit:
        pop     {r4-r11}
        pop     {pc}
