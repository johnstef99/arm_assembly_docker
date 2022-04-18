.global read
.section .text

// r0 address to save the input
// r1 length of input
read:
        push    {lr}    
        push    {r4-r11}

        mov     r2, r1              // set read count
        mov     r1, r0              // set buf to address of r0
        mov     r7, #0x3            // set sys call -> read
        mov     r0, #0x1            // set fd to -> stdin
        swi     0
        mov     r0, r1
        mov     r4, #0x0
        strb    r4, [r0, r2]

        pop     {r4-r11}
        pop     {pc}
