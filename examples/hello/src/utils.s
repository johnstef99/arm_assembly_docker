.global print
.section .text

// Prints to stdout =====================================================================
// r0 the address of the messages to get printed
print: 
        push     {lr}
        push     {r4-r11}
        
        mov     r7, #0x4            // set sys call to 4 aka write
        mov     r1, r0              // get address of message to get printed
        mov     r0, #1              // write to stdout
        mov     r2, #0              // set 0 the lenght of the message
    loop:
        ldrb    r3, [r1, r2]        // load the character that is stored at r1 address
        cmp     r3, #0x0            // check if is the null char
        beq     end                 // exit loop
        add     r2, r2, #1          // r2 += 1
        b       loop
    end:
        swi     0

        pop     {r4-r11}
        pop     {pc}
