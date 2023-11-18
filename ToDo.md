# ToDo List

Tags: `#toDo` `#meta`

## Vital Tasks
The following tasks *need* to be completed

- Add ALU module
- Complete logical and arithmetic function units
    - Logical
        - AND
        - OR
        - XOR
        - Logical left shift
        - Logical right shift
    - Arithmetic
        - Multiply
        - Divide
- Add CPU (top) module
- Check if three-state bus is synthesizable
    - If not, re-write `InputGate.v` and `OutputGate.v`
- Remove unsynthesizable/problematic constructs from design sources
    - Double-edge triggered `always` blocks
    - Nets being modified in more than one `always` block
- Rewrite testbenches to be exhaustive and self-checking
    - Create helper modules to encapsulate exhaustive and self-checking behaviors

## Non-vital tasks
These tasks are not required, but would be nice

- Document/Comment all Verilog files
- Add tags to Verilog modules for faster searching in VSCode
- Reformat all files for consistent project code styling. Makes reading code easier