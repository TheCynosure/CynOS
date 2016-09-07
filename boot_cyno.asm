bits 32
section .bss
    ;Creating a stack
    align 16
    stack_b:
    resb 8196 ; 8Kb stack
    stack_t:

section .text
global start
start:
    mov esp, [stack_t]
    mov bx, 0x8000
    call clear_screen
    mov dword [0x00b8000], 0x2f4b2f4f
    call printOK
    hlt
    jmp $

%include "display/VGA.asm"

printOK:
  mov dword [0x00b8000], 0x2f4b2f4f
  ret
