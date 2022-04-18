.global _start
.section .text

_start:

        ldr     r0, =msg_ins
        bl      print
        ldr     r0, =num_buf        // set buf to save input
        mov     r1, #255            // set read count to 6 
        bl      read
        bl      atoi
        mov     r4, r1

        ldr     r0, =msg_ins
        bl      print
        ldr     r0, =num_buf        // set buf to save input
        mov     r1, #255            // set read count to 6 
        bl      read
        bl      atoi
        mov     r5, r1

        ldr     r0, =num_buf
        add     r1, r4, r5
        bl      itoa
        bl      println
        b       exit

exit:
        mov     r7, #0x1            // set sys call to 1 aka exit
        mov     r0, #0              // set exit code
        swi     0

.section .data
        num_buf: .skip 256
        msg_ins: .ascii "Insert num: \0"
