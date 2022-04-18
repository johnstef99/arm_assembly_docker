.global itoa
.section .text

// r0 the address to store the string
// r1 the number
itoa:
        push    {lr}
        push    {r4-r11}

        mov     r4, #0              // keep the num of digits of number
        mov     r7, #0              // index of string char
        mov     r11, #10            // const of 10

        mov     r6, r1              // copy number to r6
    num_of_digits:
        udiv    r6, r6, r11         // div by 10
        add     r4, r4, #1          // increase num of digits
        cmp     r6, #0              // check if there are no more digits
        bhi     num_of_digits       // loop

        push    {r0-r1}             // save current values
        mov     r0, #10             // set base to 10
        sub     r1, r4, #1          // set power to num_of_digits-1
        bl      pow                 // save to r0 = 10 to the power of num_of_digits-1
        mov     r8, r0              // copy result to r8
        pop     {r0-r1}             // restore old valeus

    itoa_loop:
        udiv    r5, r1, r8          // r5 the first digit of number in r1
        mul     r6, r5, r8          // get the number to subtract from r1 
        sub     r1, r1, r6          // subtract the digit that was prosseced
        udiv    r8, r8, r11         // divide r8 by 10

        add     r5, r5, #'0'        // get ascii value for number
        strb    r5, [r0, r7]        // store it in r1[r7]
        add     r7, r7, #1          // increase index r7
        cmp     r8, #0
        bhi     itoa_loop
        mov     r5, #0              // set r5 to null byte
        strb    r5, [r0, r7]        // add null byte as the last char

        pop     {r4-r11}
        pop     {pc}
