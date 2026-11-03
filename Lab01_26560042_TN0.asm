#name: Phan Minh Khải Nguyên
#ID: 26560042

#Step 0 – Quick check
# Listing 0 – Quick check
.data
msg:   .asciiz "Hello, MARS!\n"
 
.text
.globl main
main:
    li   $v0, 4
    la   $a0, msg
    syscall
    li   $v0, 10
    syscall
