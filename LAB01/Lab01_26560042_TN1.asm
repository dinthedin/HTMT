#name: Phan Minh Khải Nguyên
#ID: 26560042


#Step 1.1 – Find the registers 
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


#Step 1.2 – Predict, observe, explain 
# Listing 1 - first steps with registers
.text
.globl main
main:
    addi $t0, $zero, 12      # $t0 = $zero + 12
    addi $t1, $zero, 30      # $t1 = $zero + 30
    add  $t2, $t0, $t1       # $t2 = $t0 + $t1
    addi $zero, $zero, 5     # try to put $zero + 5 into $zero
    add  $t3, $zero, $t2     # $t3 = $zero + $t2
    li   $v0, 10             # end of program (see Experiment 3)
    syscall



