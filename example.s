.section .data
output:
    .ascii "Hello, World\n"
output_end:
output_len = output_end - output

.section .text
.globl _start
_start:
    movl $4, %eax
    movl $1, %ebx
    movl $output, %ecx
    movl $output_len, %edx
    int $0x80

    movl $1, %eax

    int $0x80
