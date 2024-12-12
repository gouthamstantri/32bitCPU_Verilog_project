# 32-bit_CPU_Verilog_project
This repository represents my journey of building a 32-bit RISC-V CPU from scratch. As a beginner in CPU design, I followed a step-by-step approach inspired by the amazing workshop hosted by Whyrd, which provided invaluable guidance throughout the process.https://raw.githubusercontent.com/gouthamstantri/32bitCPU_Verilog_project/refs/heads/main/ALUTEST.txt
## GST.v File
Click [here](process.https://raw.githubusercontent.com/gouthamstantri/32bitCPU_Verilog_project/refs/heads/main/ALUTEST.txt) to view the content of `gst.v`.

The files I wrote and its dependencies are as described in the below diagram (top-down approach)

```mermaid
graph TD;
Top.v-->CPU.v;
Top.v-->imem.v;
Top.v-->dmem.v;
CPU.v-->decoder.v;
CPU.v-->condlogic.v;
condlogic.v-->floper.v;
imem.v-->memory.dat;


CPU.v-->controller.v;
CPU.v-->datapath.v;
datapath.v-->extender.v;
datapath.v-->alu.v;
datapath.v-->regfile.v;
datapath.v-->mux.v;
datapath.v-->flop.v;
datapath.v-->adder.v;

```

## CPU Instruction Set
As a first project, this CPU design supports a basic set of instructions:

### Data Processing
- ADD  
- SUB  
- AND  
- OR  

### Memory Operations
- LOAD  
- STORE  

### Branch
- BEQ (Branch if Equal)  

The design also includes simple conditional branching based on RISC-V architecture basics.

---

## Microarchitecture Overview

### Top-Level View
Here's my initial rough diagram of the top-level CPU architecture:

![Microarchitecture Top View](https://github.com/user-attachments/assets/example-top-view.jpg)

### Detailed Microarchitecture
As I progressed through the workshop, I developed a better understanding of how each component fits into the design:

![Detailed Microarchitecture](https://github.com/user-attachments/assets/example-detailed-architecture.jpg)

### Controller
The controller was particularly challenging but rewarding to implement. It handles instruction decoding and signal generation:

![Controller Details](https://github.com/user-attachments/assets/example-controller.jpg)

### Decoders
The decoders were another interesting part of the design, responsible for generating control signals:

![Decoder Details](https://github.com/user-attachments/assets/example-decoder.jpg)

---

## Verilog Module Integration
I learned to break the design into smaller modules for easier management and testing. The main components are:

### `datapath.v`
This module integrates the key components of the CPU's datapath:

![Datapath Submodules](https://github.com/user-attachments/assets/example-datapath.jpg)

### `controller.v`
This module generates control signals and integrates with the instruction decoder:

![Controller Submodules](https://github.com/user-attachments/assets/example-controller-integration.jpg)

### `cpu.v`
This module combines the `datapath.v` and `controller.v` to form the CPU core.

### `top.v`
This module integrates the CPU with instruction and data memory (`imem.v` and `dmem.v`).

![Top-Level Integration](https://github.com/user-attachments/assets/example-top-level.jpg)

---

## Testing
Testing was one of the most fulfilling parts of this project. It helped me validate my design and ensure everything was working as expected.

### Test Code
I used a simple test program to validate the CPU's functionality. The program exercises all instructions and checks for a correct result:

![Test Code](https://github.com/user-attachments/assets/example-test-code.jpg)

### Testbench Files
- `imem.v`: Contains the instruction memory with the test program in hexadecimal format.
- `testbench.sv`: Simulates the CPU and verifies if the expected result (e.g., `mem[84] == 7`) is achieved.

### Component-Level Testing
To ensure reliability, I tested each module independently:
- `aluTest.v`: Testbench for the ALU module.
- Additional testbenches for other modules will be added soon.

---

## Acknowledgment
This project was made possible thanks to the workshop hosted by Whyrd and the guidance provided by **Rajdeep Mazumder**. Their expertise and resources helped me better understand CPU design and motivated me throughout this journey. 


