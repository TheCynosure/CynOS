VERSION_LARGE_NUM equ 1
VERSION_SMALL_NUM equ 0

bits 32
section .bss
    ;Creating a stack
    align 16
    stack_b:
    resb 8196 ; 8Kb stack
    stack_t:
section .text
global start

extern init_terminal

start:
    mov esp, [stack_t]
    ;mov eax, 0x00b8000
    ;mov ebx, text_t
    ;mov ecx, text_b
    ;call write_to_screen
    call init_terminal
    hlt
    jmp $

    text_b:
    ; CynOS
    dw 0x0343
    dw 0x0379
    dw 0x036e
    dw 0x034f
    dw 0x0353
    ; -
    dw 0x0f20
    dw 0x0f2d
    dw 0x0f20
    ;VERSION NUM
    dw 0x0f00 + (VERSION_LARGE_NUM + 0x30)
    dw 0x0f2e
    dw 0x0f00 + (VERSION_SMALL_NUM + 0x30)
    times (80*25)-11 dw 0x0f20
    text_t:
