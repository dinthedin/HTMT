#Name: Phan Minh Khải Nguyên
#MSSV: 26560042


#Step 2.1 – Swap two scores
# Listing 3 - swap two scores in memory
.data
scores: .word 40, 55, 70, 85, 100
 
.text
.globl main
main:
    la   $s0, scores      # $s0 = address of scores[0]
    lw $t0, 0($s0)
    lw $t1, 4($s0)
    sw $t1, 0($s0)
    sw $t0, 4($s0)
    li   $v0, 10
    syscall


#Step 2.2 – The index in a register
# Listing 4 - the index of the element is held in a register
# Register plan:  $s0 = address of scores[0]   $s1 = i
.data
scores: .word 40, 55, 70, 85, 100
msg:    .asciiz "scores[i] = "
nl:     .asciiz "\n"
 
.text
.globl main
main:
    la   $s0, scores      # $s0 = address of scores[0]
    addi $s1, $zero, 3    # i = 3
    sll  $t1, $s1, 2      # $t1 = 4 * i
    add  $t1, $t1, $s0    # $t1 = address of scores[i]
    lw   $t2, 0($t1)      # $t2 = scores[i]
    li   $v0, 4
    la   $a0, msg
    syscall
    li   $v0, 1
    add  $a0, $t2, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    li   $v0, 10
    syscall

