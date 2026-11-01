.section .data
prompt_1: .string "Nhap chuoi (4 ky tu): "
prompt_2: .string "Nhap n (0-9): "
.section .bss
    .lcomm input, 5
    .lcomm n, 2
.section .text
    .global _start
_start:
    movl $4, %eax
    movl $1, %ebx
    movl $prompt_1, %ecx
    movl $22, %edx
    int $0x80

    movl $3, %eax
    movl $0, %ebx
    movl $input, %ecx
    movl $5, %edx
    int $0x80

    movl $4, %eax
    movl $1, %ebx
    movl $prompt_2, %ecx
    movl $14, %edx
    int $0x80

    movl $3, %eax
    movl $0, %ebx
    movl $n, %ecx
    movl $2, %edx
    int $0x80
   
    // convert ascii to decimal
    subl $'0', n
    # Caesar
    movb n, %al
    addb %al, input
    addb %al, input+1
    addb %al, input+2
    addb %al, input+3

    # print result
    movl $4, %eax
    movl $1, %ebx
    movl $input, %ecx
    movl $5, %edx
    int $0x80
    
    # exit 0
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80

