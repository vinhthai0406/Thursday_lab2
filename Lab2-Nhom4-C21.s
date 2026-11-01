.section .data
msg: .string "NT209UIT"
len: .int 0
.section .text
    .globl _start
_start:
    movl $len, %edi 
    subl $msg, %edi
    subl $1, %edi
    movl %edi, len

    addb $'0', len 

    movl $1, %edx
    movl $len, %ecx
    movl $1, %ebx
    
    movl $4, %eax
    int $0x80

    movl $1, %eax
    xorl %ebx, %ebx  
    int $0x80
