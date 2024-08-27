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

