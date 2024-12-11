# 32-bit_CPU_Verilog_project
This repository represents my journey of building an 8-bit RISC-V CPU from scratch. As a beginner in CPU design, I followed a step-by-step approach to learn and implement the principles of RISC-based architecture using Verilog. This project is inspired by the amazing workshop hosted by Whyrd, which provided invaluable guidance throughout the process.

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

## References
This project and its test code were inspired by **"Digital Design and Computer Architecture: RISC-V Edition"** by David Harris and Sarah Harris. The book served as an excellent reference throughout the project.

![Book Reference](https://github.com/user-attachments/assets/example-book-cover.jpg)

---

## Acknowledgment
This project was made possible thanks to the workshop hosted by Whyrd and the guidance provided by **Rajdeep Mazumder**. Their expertise and resources helped me gain a deeper understanding of CPU design and motivated me throughout this journey.

Workshop Link: [Build RISC-V CPU from Scratch with Verilog](https://example.com)
