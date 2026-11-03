#name: Phan Minh Khải Nguyên
#ID: 26560042


#Step 3.1 – Print text and a number
# Listing 5 - print a message and an integer
.data
msg:   .asciiz "Usage (kWh): "
nl:    .asciiz "\n"
 
.text
.globl main
main:
    addi $t0, $zero, 150
    li   $v0, 4              # service 4: print string
    la   $a0, msg            # argument: address of msg
    syscall
    li   $v0, 1              # service 1: print integer
    add  $a0, $t0, $zero     # argument: the number to print
    syscall
    li   $v0, 4              # print a new line
    la   $a0, nl
    syscall
    li   $v0, 10             # service 10: exit
    syscall


#Step 3.2 – Read two numbers and compute the usage
# Listing 6 - energy used between two readings
.data
prompt1:  .asciiz "Enter previous reading (kWh): "
prompt2:  .asciiz "Enter current reading (kWh): "
label:    .asciiz "Usage (kWh): "
newline:  .asciiz "\n"

.text
.globl main
main:
    # --- read the previous reading into $s0 ---
    li   $v0, 4
    la   $a0, prompt1
    syscall
    li   $v0, 5                  # service 5: read integer, result in $v0
    syscall
    add  $s0, $v0, $zero         # keep the value in $s0

    li   $v0, 4
    la   $a0, prompt2
    syscall
    li   $v0, 5
    syscall
    add  $s1, $v0, $zero

    sub  $t0, $s1, $s0

    li   $v0, 4
    la   $a0, label
    syscall
    li   $v0, 1 
    add  $a0, $t0, $zero
    syscall
    li   $v0, 4
    la   $a0, newline
    syscall

    li   $v0, 10
    syscall


#Step 3.3 – Three-month summary with your own data
.data
prompt: .asciiz "Enter reading (kWh): "
m1:     .asciiz "Month 1: "
m2:     .asciiz "Month 2: "
m3:     .asciiz "Month 3: "
tot:    .asciiz "Total:   "
nl:     .asciiz "\n"

.text
.globl main
main:
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s0, $v0, $zero

    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s1, $v0, $zero

    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s2, $v0, $zero

    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s3, $v0, $zero

    sub  $t0, $s1, $s0 
    sub  $t1, $s2, $s1 
    sub  $t2, $s3, $s2 
    add  $t3, $t0, $t1
    add  $t3, $t3, $t2 

    li   $v0, 4
    la   $a0, m1
    syscall
    li   $v0, 1
    add  $a0, $t0, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 4
    la   $a0, m2
    syscall
    li   $v0, 1
    add  $a0, $t1, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 4
    la   $a0, m3
    syscall
    li   $v0, 1
    add  $a0, $t2, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 4
    la   $a0, tot
    syscall
    li   $v0, 1
    add  $a0, $t3, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 10
    syscall