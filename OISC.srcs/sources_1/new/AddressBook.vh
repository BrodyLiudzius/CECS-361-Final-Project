// AddressBook.vh
// tags:


/* SUMMARY:
This header file contains the addresses of registers within the CPU. It should
be included inside any file that needs register addresses provided (i.e. ALU, CPU, etc.)
*/



/* Current mappings:
    0-15      - control unit
    16-31     - register file
    32-47     - memory access
      48-63   - not reserved
    64-127    - ALU
      128-255 - not reserved
*/



// CONTROL UNIT ADDRESSES
    localparam PROGRAM_COUNTER_ADDRESS = 1; // 0x01



// REGISTER FILE
    localparam REGISTER_FILE_BASE_ADDRESS = 16; // 0x10



// (DATA) MEMORY ACCESS
    localparam MBR_ADDRESS = 32; // 0x20
    localparam MAR_ADDRESS = 33; // 0x21



// DISPLAY REGISTER
    localparam DISPLAY_REGISTER_ADDRESS = 48; // 0x30



// ALU ADDRESSES

    // Logical
        localparam ALU_COMPARE_ADDRESS_1 = 64; // 0x40
        localparam ALU_COMPARE_ADDRESS_2 = 65; // 0x41

        localparam ALU_AND_ADDRESS_1 = 66; // 0x42
        localparam ALU_AND_ADDRESS_2 = 67; // 0x43

        localparam ALU_OR_ADDRESS_1 = 68; // 0x44
        localparam ALU_OR_ADDRESS_2 = 69; // 0x45

        localparam ALU_XOR_ADDRESS_1 = 70; // 0x46
        localparam ALU_XOR_ADDRESS_2 = 71; // 0x47

        localparam ALU_LLSHIFT_ADDRESS = 72; // 0x48
        
        localparam ALU_LRSHIFT_ADDRESS = 73; // 0x49

    // Arithmetic
        localparam ALU_A_LSHIFT_ADDRESS = 96; // 0x60

        localparam ALU_A_RSHIFT_ADDRESS = 97; // 0x61

        localparam ALU_ADD_ADDRESS_1 = 98; // 0x62
        localparam ALU_ADD_ADDRESS_2 = 99; // 0x63

        localparam ALU_MULTIPLY_ADDRESS_1 = 100; // 0x64
        localparam ALU_MULTIPLY_ADDRESS_2 = 101; // 0x65

        localparam ALU_DIVIDE_ADDRESS_1 = 102; //0x65
        localparam ALU_DIVIDE_ADDRESS_2 = 103; //0x66