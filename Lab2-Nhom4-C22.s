.section .data
prompt_01: .string "Enter a string (10-chars): "
prompt_02: .string "Start index: "
prompt_03: .string "End index: "
newline: .byte 10
.section .bss
    .lcomm text, 11
    .lcomm startIndex, 2
    .lcomm endIndex, 2
    
.section .text
    .globl _start
_start:   
    # stdin message
    movl $4, %eax # sys_write -> in ra prompt
    movl $1, %ebx # stdout 
    movl $prompt_01, %ecx # address of message to write
    movl $27, %edx # message length
    int $0x80 # call kernel
    movl $3, %eax # system_read
    movl $0, %ebx # stdin
    movl $text, %ecx
    movl $11, %edx
    int $0x80


    # stdin start index
    movl $4, %eax
    movl $1, %ebx
    movl $prompt_02, %ecx
    movl $13, %edx
    int $0x80
    movl $3, %eax
    movl $0, %ebx
    movl $startIndex, %ecx
    movl $2, %edx
    int $0x80

    # stdin end index
    movl $4, %eax
    movl $1, %ebx
    movl $prompt_03, %ecx
    movl $11, %edx
    int $0x80
    movl $3, %eax
    movl $0, %ebx
    movl $endIndex, %ecx
    movl $2, %edx
    int $0x80

    # convert ascii to decimal for index
    # input is always char type 
    subl $'0', startIndex
    subl $'0', endIndex
    # print substring
    movl $4, %eax
    movl $1, %ebx

    # move text, start, end to register
    movl $text, %ecx
    
    movzbl startIndex, %esi
    movzbl endIndex, %edx
    leal text(%esi), %ecx 
    subl %esi, %edx # message length
    incl %edx

    # xuong dong
    int $0x80
    movl $4, %eax
    movl $1, %ebx
    movl $newline, %ecx
    movl $1, %edx
    int $0x80

    movl $1, %eax
    xorl %ebx, %ebx  
    int $0x80
