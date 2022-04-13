.global _start
.section .text

_start:
        ldr     r0, =message
        bl      print
		bl      exit

exit:
		mov 	r7, #0x1            // set sys call to 1 aka exit
		mov 	r0, #0              // set exit code
		swi 	0


.section .data
        message: .ascii "Hi I am john!\nHere is multi line a message\n\0"
