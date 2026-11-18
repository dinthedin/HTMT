#Name: Phan Minh Khải Nguyên
#MSSV: 26560042


# Listing 3 - clamp(x, lo, hi)
.text
.globl main
main:
    li   $v0, 5                 # read an integer x into $v0
    syscall
    add  $a0, $v0, $zero        # argument 1: x
    addi $a1, $zero, 0          # argument 2: lo = 0
    addi $a2, $zero, 100        # argument 3: hi = 100
    jal  clamp
    add  $a0, $v0, $zero        # print the result
    li   $v0, 1
    syscall
    li   $v0, 10
    syscall
 
# clamp(x = $a0, lo = $a1, hi = $a2): returns x limited to [lo, hi] in $v0
clamp:
    # >>> if x < lo, the result is lo
    add  $v0, $a1, $zero
    slt  $t0, $a1, $a0     	 
    beq  $t0, $zero, end
    # >>> else if hi < x, the result is hi
    add  $v0, $a2, $zero
    slt  $t1, $a0, $a2    	  
    beq  $t1, $zero, end
    # >>> otherwise the result is x
    add  $v0, $a0, $zero
end:
    jr   $ra

