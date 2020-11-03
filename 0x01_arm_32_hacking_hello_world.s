.global _start

_start:
    mov R0, #1                      @ 1 = stdout
    ldr R1, =hello_world            @ str pointer
    mov R2, #13                     @ str len
    mov R7, #4                      @ linux write syscall
    svc 0                           @ software interrupt call write

exit:
    mov R0, #0                      @ return code
    mov R7, #1                      @ linux exit syscall
    svc 0                           @ software interrupt call exit

.data
hello_world:                        .ascii "Hello World!\n"
