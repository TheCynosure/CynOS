;Sub routines to deal with the VGA Display
VGAMemStart dd 0x00b8000
cols db 10 ; 80 Columns wide doubled because data is 2 bytes wide
rows db 25

;Requires that you put the color in the EBX Register in the following format:
; 0x2f00 is green with white text
; 0x2000 this is also valid as there is no text being printed
; but needs to be 16 Bit num.
clear_screen:
    xor ecx, ecx ; Set the counter to 0
    add ebx, 0x0020 ; 32 is the character for space so this will print a blank space
.loop:
    mov eax, 0x00b8000 ; Move the start of VGA Mem
    add eax, ecx ; Increment it based on the column
    mov [eax], ebx ; Move to the VGA Mem the value of the Background
    inc ecx
    inc ecx ; Jump by two because VGA Mem Data is 2 bytes wide
    cmp ecx, 10
    jng .loop
    ret
