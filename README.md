# Risc-V

## Implementation of a RISC-V processor using verilog
Each component is modular and can be used separately when for verification and adding features
##### In progress
ALU Completed
Register completed
Program counter completed


## Components
#### ALU
- A simple ALU written in verilog that can do basic logic operations and basic arithmetic operations. Currently can only perform add and subtract, and, or nor, xor
- Fully 32 bits allowing for greater complexity

#### Register
- Simple Register array containing 32 bits
- Starts with a simple loop to clear it
- Allows for asynchronous reading of values
- Writing is done at clock edge and requires enable signal
- Separate writing and reading bus allows for simultaneous operation of both sections

#### Program Counter
- Program counter 32 bits wide
- Allows for complete comparison of two registers
- There are two muxes to choose betwewen the types of branching and the qualifying conditions
- Possible address outputs:
  - Current + 1
  - Current + target + 1
  - Target_address
  - Adress in register_1 (rs)
 
  




## Future additions

#### ALU
- Multiplication and division features (increasing the add_sub variable size to 2 bits rather than 1)
- Pipelining with registers and forwarding


#### Datapath
- Integrating and combining different components together

#### CPU control unit

## Citations
https://www.seas.upenn.edu/~cis2400/24fa/notes/riscv_encoding.pdf 
