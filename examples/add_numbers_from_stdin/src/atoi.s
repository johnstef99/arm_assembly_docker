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
        mov     r9, #0              // register to keep the sign

        ldrb    r5, [r0]            // load the first char
        cmp     r5, #0x2d           // check if char is '-' 
        bne     length_loop         // if not '-' go to find length
        sub     r9, r9, #1          // else set r9 to 0xffffffff
        add     r0, r0, #1          // and increase the pointer r0

    length_loop:
        ldrb    r5, [r0, r4]        // load the char at pos r0[r4]
        cmp     r5, #0x30           // check if char is below ascii 0
        blo     length_end          // exit loop
        cmp     r5, #0x40           // check if char is over ascii 9
        bhs     length_end          // exit loop
        add     r4, r4, #1          // increate length counter
        b       length_loop         // check next char
    length_end:
        sub     r4, r4, #1          // sub 1 from length to get the last number
        cmp     r4, #0              // check if length < 0
        blt     no_more_numbers     // exit loop if it is
        ldrb    r5, [r0, r4]        // load r5 = r0[r4]
        sub     r5, r5, #'0'        // convert ascii number to real number value
        mul     r7, r5, r6          // mul the number with the multiplier
        add     r1, r1, r7          // add multiplied num to result
        mul     r6, r8, r6          // increase the multiplier by the power of 10
        b       length_end

    no_more_numbers:
        cmp     r1, #0              // check if resulted number is 0
        beq     return              // exit if it is
        cmp     r9, #0              // check if the sign register is 0
        beq     return              // exit if it is
        eor     r1, r1, r9          // xor r1 with 0xfffffffff
        add     r1, r1, #1          // and add 1
        sub     r0, r0, #1          // if number is negative restore r0 to original address

    return:
        pop     {r4-r11}
        pop     {pc}
