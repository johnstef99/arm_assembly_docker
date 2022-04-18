.global atoi
.section .text

// r0 the address of the string
// r1 the number result
atoi:
        push    {lr}
        push    {r4-r11}

        mov     r1, #0              // init result
        mov     r4, #0              // init r4 length counter
        mov     r6, #1              // init multiplier
        mov     r8, #10             // power

    length_loop:
        ldrb    r5, [r0, r4]        // load the char at pos r0[r4]
        cmp     r5, #0x30           // check if is the null char
        blo     length_end          // exit loop
        cmp     r5, #0x40           // check if is the null char
        bhs     length_end          // exit loop
        add     r4, r4, #1          // increate length counter
        b       length_loop         // check next char
    length_end:
        sub     r4, r4, #1          // sub 1 from length to get the last number
        ldrb    r5, [r0, r4]        // load last number to r5
        sub     r5, r5, #'0'        // convert ascii number to real number value
        mul     r7, r5, r6          // mul the number with the multiplier
        add     r1, r1, r7          // add multiplied num to result
        mul     r6, r8, r6          // increase the multiplier by the power of 10
        cmp     r4, #0              // check if length is 0
        bhi     length_end

        pop     {r4-r11}
        pop     {pc}
