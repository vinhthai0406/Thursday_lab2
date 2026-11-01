.section .data
prompt: .string "Enter a number : "
newline: .byte 10
.section .bss
    .lcomm a, 2
    .lcomm b, 2
    .lcomm c, 2
    .lcomm d, 2
    .lcomm result, 2
.section .text
    .global _start
_start:
    ## input number a
    # print prompt
    movl $4, %eax
    movl $1, %ebx
    movl $prompt, %ecx
    movl $17, %edx
    int $0x80
    # enter value
    movl $3, %eax
    movl $0, %ebx
    movl $a, %ecx
    movl $2, %edx
    int $0x80

    ## input number b
    # print prompt
    movl $4, %eax
    movl $1, %ebx
    movl $prompt, %ecx
    movl $17, %edx
    int $0x80
    # enter value
    movl $3, %eax
    movl $0, %ebx
    movl $b, %ecx
    movl $2, %edx
    int $0x80

    ## input number c
    # print prompt
    movl $4, %eax
    movl $1, %ebx
    movl $prompt, %ecx
    movl $17, %edx
    int $0x80
    # enter value
    movl $3, %eax
    movl $0, %ebx
    movl $c, %ecx
    movl $2, %edx
    int $0x80

    ## input number d
    # print prompt
    movl $4, %eax
    movl $1, %ebx
    movl $prompt, %ecx
    movl $17, %edx
    int $0x80
    # enter value
    movl $3, %eax
    movl $0, %ebx
    movl $d, %ecx
    movl $2, %edx
    int $0x80

    // convert ascii to decimal
    subl $'0', a
    subl $'0', b
    subl $'0', c
    subl $'0', d

    // calculate average
    addl a, %edi
    addl b, %edi
    addl c, %edi
    addl d, %edi 
    # edi = a + b + c + d
    movl %edi, %eax
    xorl %edx, %edx 
    movl $4, %ecx 
    divl %ecx 
    # so chia ecx, so bi chia eax
    # sau phep chia: thuong eax, so du edx

    # convert decimal to ascii
    # move 8 low bit eax (al) to result
    addl $'0', %eax
    movb %al, result

    # print result
    movl $4, %eax
    movl $1, %ebx
    movl $result, %ecx
    movl $2, %edx
    int $0x80
    
    # print newline
    movl $4, %eax
    movl $1, %ebx
    movl $newline, %ecx
    movl $2, %edx
    int $0x80
    
    # exit
    movl $1, %eax
    xorl %ebx, %ebx # exit 0
    int $0x80

