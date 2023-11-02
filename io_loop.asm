# Assembly starter file for Exercise 1

.data 0x0

  widthPrompt:	.asciiz "Enter width: "
  heightPrompt:	.asciiz "Enter height: "
  areaIs:	.asciiz "Rectangle's area: "
  perimeterIs:	.asciiz "Rectangle's perimeter: "
  newline:	.asciiz "\n"

.text 0x3000

main:
# Print the prompt for width
  addi 	$2, $0, 4  		# system call 4 is for printing a string
  la 	$4, widthPrompt 	# address of widthPrompt is in $4
  syscall           		# print the string

# Read the width
  addi	$2, $0, 5		# system call 5 is for reading an integer
  syscall 			# integer value read is in $2
  add	$8, $0, $2		# copy the width into $8 (because $2 will be overwritten in the next line)

# Print the prompt for height
  addi 	$2, $0, 4  		# system call 4 is for printing a string
  la 	$4, heightPrompt 	# address of heightPrompt is in $4
  syscall           	  	# print the string
  
# Read the height
  addi	$2, $0, 5		# system call 5 is for reading an integer
  syscall 			# integer value read is in $2
  add	$9, $0, $2		# copy the height into $9
  
# Calculate area
  mult	$8, $9			# multiply width * height
  mflo	$10			# bring the product into $10 (assume hi not needed)

# Print "Rectangle's area: "
  addi 	$2, $0, 4  		# system call 4 is for printing a string
  la 	$4, areaIs 		# address of areaIs string is in $4
  syscall         		# print the string

# Print the calculated area (in $10)
  addi 	$2, $0, 1  		# system call 1 is for printing an integer
  add 	$4, $0, $10 		# bring the area value from $10 into $4
  syscall          		# print the integer
  
 # Print a newline
  addi 	$2, $0, 4  		# system call 4 is for printing a string
  la 	$4, newline 		# address of areaIs string is in $4
  syscall              		# print the string
  
  

# Exit from the program
exit:
  ori $2, $0, 10       	# system call code 10 for exit
  syscall               # exit the program
