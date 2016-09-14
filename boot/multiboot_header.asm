; Sourced from http://os.phil-opp.com/multiboot-kernel.html#creating-the-iso
section .multiboot_header
align 4
header_start:
    dd 0xe85250d6                ; magic number (multiboot 2)
    dd 0                         ; architecture 0 (protected mode i386)
    dd header_end - header_start ; header length
    ; checksum
    dd 0x100000000 - (0xe85250d6 + 0 + (header_end - header_start))
    ; required end tag
    dw 0    ; type
    dw 0    ; flags
    dd 8    ; size
header_end:
