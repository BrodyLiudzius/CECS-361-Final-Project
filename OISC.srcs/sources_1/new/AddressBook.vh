// AddressBook.vh
// tags: #toDo

/* SUMMARY:
This file contains the relative addresses of function
units within the ALU. They have been separated into this
header for convenience. 
*/


parameter    LOGICAL_BASE_ADDRESS = 0;
parameter ARITHMETIC_BASE_ADDRESS = 32;

// Logical
parameter COMPARE_BASE_ADDRESS = LOGICAL_BASE_ADDRESS + 0;

// Arithmetic
parameter A_LSHIFT_BASE_ADDRESS = ARITHMETIC_BASE_ADDRESS + 0;
parameter A_RSHIFT_BASE_ADDRESS = ARITHMETIC_BASE_ADDRESS + 1;
parameter    ADDER_BASE_ADDRESS = ARITHMETIC_BASE_ADDRESS + 2;