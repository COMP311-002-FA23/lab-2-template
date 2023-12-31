# Add the first five integers 
#
# Here is the C code for adding the first five integers,
# starting with 0.
#
# int i, sum;
#
# main() {
#   sum = 0;
#   for (i=0; i<5; i++)
#     sum = sum + i;
# }


# And here is the coressponding MIPS assembly version.
# It has been developed by converting the C code to
# assembly line-by-line.  The corresponding line of
# C code is shown in the comments.


# For this simple example, we did not place any variables
# in memory.  (To place variables in memory, we give the
# ".data" directive to the assembler.)  Instead, we simply
# chose to use $8, $9 and $10 as scratch registers to hold
# any variables we needed.  In particular, $8 holds sum,
# $9 holds i, and $10 is a scratch register that holds
# the Boolean result of (i<5).

.text

main:
     add   $8 $0 $0     # sum = 0
     add   $9 $0 $0     # i = 0
     addi  $10 $0 5

loop:
     beq   $9 $10 end   # break out of loop if i == 5
     add   $8 $8 $9     # sum += i;
     addi  $9 $9 1      # i++
     j     loop

end:
     ori   $2 $0, 10     # system call 10 for exit
     syscall             # terminate program