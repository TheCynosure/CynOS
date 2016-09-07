;Sub routines to deal with the VGA Display
VGA_MEM_START equ 0x00b8000
VGA_COLS equ 160 ; 80 Columns wide doubled because data is 2 bytes wide
VGA_ROWS equ 25

;Requires that you put the color in the EBX Register in the following format:
; 0x2f00 is green with white text
; 0x2000 this is also valid as there is no text being printed
; but needs to be 16 Bit num.
clear_screen:
    xor ecx, ecx ; Set the column counter to 0
    xor edx, edx ; Set the row counter to 0
    add ebx, 0x0020 ; 32 is the character for space so this will print a blank space
.loop:
    mov eax, VGA_MEM_START ; Move the start of VGA Mem
    add eax, ecx ; Increment it based on the column
    mov [eax], ebx ; Move to the VGA Mem the value of the Background
    add ecx, 2 ; Jump by two because VGA Mem Data is 2 bytes wide
    cmp ecx, VGA_COLS
    jl .loop
    add eax, ecx
    xor ecx, ecx
    inc edx
    cmp edx, VGA_ROWS
    jl .loop
    ret
