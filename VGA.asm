; Write VGA Data to the screen.
; EAX: Must store starting VGA data value (Typically 0x00b8000 for start of VGA)
; EBX: Must store the end address of data
; ECX: Must store pointer (addr of) to first element
; ALL DATA MUST BE 16 BIT VALUES, AS THIS IS WHAT VGA DATA IS IN.
write_to_screen:

.wtsloop:
    mov edx, [ecx] ; Pull the value at that data addr
    mov [eax], edx ; Write it to VGA Location
    add ecx, 2 ; Move data pointer up by 2 because its words not bytes
    add eax, 2 ; Move VGA data up 2 because its words not bytes
    cmp ecx, ebx ; Compare Data pointer Position with where it should stop
    jne .wtsloop ; When we hit the end point, return
    ret
