#Name: Phan Minh Khải Nguyên
#MSSV: 26560042

# Listing 7 - lb and lbu
.data
b1: .byte 0xF0
 
.text
.globl main
main:
    la   $s0, b1
    lb   $t0, 0($s0)
    lbu  $t1, 0($s0)
    li   $v0, 10
    syscall


# Listing 6 - one word, four bytes
.data
w: .word 0x41424344
 
.text
.globl main
main:
    la   $s0, w
    lb   $t0, 0($s0)      # byte at offset 0
    lb   $t1, 1($s0)      # byte at offset 1
    lb   $t2, 2($s0)      # byte at offset 2
    lb   $t3, 3($s0)      # byte at offset 3
    lw   $t4, 0($s0)      # the whole word
    li   $v0, 10
    syscall


# Listing 5 - the bytes of a string
.data
word1: .asciiz "Hi!"
 
.text
.globl main
main:
    la   $s0, word1       # $s0 = address of the first byte
    lb   $t0, 0($s0)
    lb   $t1, 1($s0)
    lb   $t2, 2($s0)
    lb   $t3, 3($s0)
    li   $v0, 11          # service 11: print one character
    add  $a0, $t1, $zero  # the byte that was loaded into $t1
    syscall
    li   $v0, 10
    syscall

# Listing 8 - capital letters at chosen positions of a string
# Register plan:  $s0 = address of the first byte of str1
.data
str1: .ascii "nguyen van an"
tag:  .ascii " [end]"
nl:   .ascii "\n"
 
.text
.globl main
main:
    la   $s0, str1        # $s0 = address of str1
    # >>> make the byte at offset 0 a capital letter
    # >>> make the byte at offset 7 a capital letter
    # >>> make the byte at offset 11 a capital letter
    li   $v0, 4           # service 4: print the string that starts at $a0
    add  $a0, $s0, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    li   $v0, 10
    syscall

