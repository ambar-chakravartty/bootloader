[org 0x7c00]
[bits 16]


%include "print_function.asm"
%include "hexprint.asm"

mov bx,msg
call print

mov bx,num
call print_hex


msg: db "hello world!",0
num: db "0xFFFF",0

times 510-($-$$) db 0

dw 0xaa55


