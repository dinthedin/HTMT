#name: Phan Minh Khải Nguyên
#ID: 26560042


#Step 2.1 – Your first addition 
# Listing 2 - a = b + c
.text
.globl main
main:
    addi $t1, $zero, 7       # b = 7
    addi $t2, $zero, 5       # c = 5
    add  $t0, $t1, $t2       # a = b + c
    li   $v0, 10
    syscall


#Step 2.3 – Energy used by a household
# Listing 3 - energy used by a household (fictitious readings, kWh)
# Variable   Register
# reading0   $s0   start of month 1
# reading1   $s1   start of month 2
# reading2   $s2   start of month 3
# reading3   $s3   end of month 3
# usage1     $t0   energy used in month 1
# usage2     $t1   energy used in month 2
# usage3     $t2   energy used in month 3
# total      $t3   usage1 + usage2 + usage3
.text
.globl main
main:
    addi $s0, $zero, 1200
    addi $s1, $zero, 1350
    addi $s2, $zero, 1475
    addi $s3, $zero, 1640
 
    sub  $t0, $s1, $s0
    sub  $t1, $s2, $s1 
    sub  $t2, $s3, $s2
    add  $t3, $t0, $t1 
    add  $t3, $t3, $t2 
 
    li   $v0, 10
    syscall
    

#Step 2.4 – Translate statements into instructions
# Listing 4 - translating statements
.text
.globl main
main:
    addi $s0, $zero, 8       # y = 8
    addi $s1, $zero, 5       # z = 5
    addi $s2, $zero, 3       # w = 3
 
    add  $t0, $s0, $s1
    add  $t0, $t0, $s2

    add  $t5, $s0, $s1
    addi $t1, $s2, 5
    sub  $t1, $t5, $t1

    add  $t2, $s0, $zero

    sub  $t3, $s1, $s0
 
    li   $v0, 10
    syscall
