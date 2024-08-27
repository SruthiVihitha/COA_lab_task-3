# COA_lab_task-3
Write an assembly language program to perform subraction of 8-bit, 16-bit data

---

## README: Assembly Language Program for Subtraction

### Description

This program performs subtraction on both 8-bit and 16-bit data. The subtraction results are then converted to hexadecimal format and displayed.

### Features

1. **8-bit Subtraction**: Subtracts two 8-bit numbers and displays the result in hexadecimal format.
2. **16-bit Subtraction**: Subtracts two 16-bit numbers and displays the result in hexadecimal format.

### Requirements

- **Assembler**: MASM, TASM, or any compatible assembler for x86 architecture.
- **Environment**: DOS or an emulator that supports DOS interrupts.

### Assembly Code

#### 16-bit Subtraction Code

```asm
org 100h

num1 dw 9C6Bh  ; 16-bit first operand
num2 dw 1656h  ; 16-bit second operand

start:
    mov ax, num1  ; Load first operand into AX
    sub ax, num2  ; Subtract second operand from AX
    mov bx, ax    ; Store result in BX

    ; Convert and print the result as a hexadecimal value

    ; Print high byte of result
    mov ah, bh    ; Move high byte of result to AH
    mov al, ah    ; Copy high byte to AL for processing
    call print_hex ; Print the high byte

    ; Print low byte of result
    mov al, bl    ; Move low byte of result to AL
    call print_hex ; Print the low byte

    ; Return control to DOS
    mov ah, 4Ch
    int 21h

; Procedure to print hexadecimal value in AL
print_hex:
    ; Convert the high nibble
    mov ah, al
    shr ah, 4     ; Shift right to get the high nibble
    and ah, 0Fh   ; Mask to keep only the lower 4 bits
    add ah, 30h   ; Convert to ASCII ('0'-'9')
    cmp ah, 39h
    jle print_high_nibble

    add ah, 7     ; Convert to ASCII ('A'-'F')

print_high_nibble:
    mov dl, ah
    mov ah, 02h
    int 21h       ; Print the high nibble

    ; Convert the low nibble
    mov al, al
    and al, 0Fh   ; Mask to keep only the lower 4 bits
    add al, 30h   ; Convert to ASCII ('0'-'9')
    cmp al, 39h
    jle print_low_nibble

    add al, 7     ; Convert to ASCII ('A'-'F')

print_low_nibble:
    mov dl, al
    mov ah, 02h
    int 21h       ; Print the low nibble

    ret           ; Return from procedure
```

![image](https://github.com/user-attachments/assets/7053167a-7cc3-46f1-9ad8-223c2f5be3da)

#### 8-bit Subtraction Code

```asm
org 100h

num1 db 19h    ; 8-bit first operand
num2 db 15h    ; 8-bit second operand

start:
    mov al, num1 ; Load first operand into AL
    sub al, num2 ; Subtract second operand from AL

    mov bl, al   ; Store result in BL

    ; Convert and print the result as a hexadecimal value

    ; Print high nibble (first digit)
    mov ah, al
    shr ah, 4    ; Shift right to get the high nibble
    and ah, 0Fh  ; Mask to keep only the lower 4 bits
    add ah, 30h  ; Convert to ASCII ('0'-'9')
    cmp ah, 39h
    jle print_first_digit

    add ah, 7    ; Convert to ASCII ('A'-'F')

print_first_digit:
    mov dl, ah
    mov ah, 02h
    int 21h      ; Print the first digit

    ; Print low nibble (second digit)
    mov ah, bl
    and ah, 0Fh  ; Mask to keep only the lower 4 bits
    add ah, 30h  ; Convert to ASCII ('0'-'9')
    cmp ah, 39h
    jle print_second_digit

    add ah, 7    ; Convert to ASCII ('A'-'F')

print_second_digit:
    mov dl, ah
    mov ah, 02h
    int 21h      ; Print the second digit

    ; Return control to DOS
    mov ah, 4Ch
    int 21h
```
![image](https://github.com/user-attachments/assets/56b138b2-3e5a-451b-b7be-981df0a28a96)

### Explanation

1. **16-bit Subtraction**:
   - **Load and Subtract**: The program loads two 16-bit numbers, performs subtraction, and stores the result.
   - **Convert to Hexadecimal**: It processes the result to extract the high and low bytes, converts each nibble to ASCII, and prints them.

2. **8-bit Subtraction**:
   - **Load and Subtract**: The program performs subtraction with 8-bit numbers.
   - **Convert to Hexadecimal**: It processes the result to extract and convert nibbles to ASCII for display.

### Usage

1. **Assemble and Link**: Use an assembler (like MASM or TASM) to assemble the code, and then link it to create an executable.
2. **Run the Program**: Execute the program in a DOS environment or DOS emulator to see the results.

