# 4-Bit ALU in Verilog

A simple 4-bit Arithmetic Logic Unit designed in Verilog as my first RTL design project.

The ALU supports basic arithmetic and bitwise operations selected using a 3-bit opcode.

## Operations

| Opcode | Operation |
|--------|-----------|
| 000 | Addition |
| 001 | Subtraction |
| 010 | AND |
| 011 | OR |
| 100 | XOR |
| 101 | NOT |

## Project Structure

```text
verilog-alu/
├── src/
│   └── alu.v
├── tb/
│   └── alu_tb.v
└── README.md