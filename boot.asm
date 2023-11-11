[org 0x7c00]

KERNEL_OFFSET equ 0x1000

mov [BOOTDRV],dl

mov bp,0x9000
mov sp,bp

mov bx,MSG_REAL_MODE
call print 

call load_kernel

call switch_to_pm


jmp $

%include "print_function.asm"
%include "gdt.asm"
%include "print32.asm"
%include "switch_pm.asm"
%include "disk.asm"

[bits 16]
load_kernel:
	mov bx,MSG_LOAD_KERNEL
	call print 

	mov bx,KERNEL_OFFSET
	mov dh,15
	mov dl,[BOOTDRV]
	call disk_load
	ret

[bits 32]
BEGIN_PM:
	mov ebx,MSG_PROT_MODE
	call print_pm
	call KERNEL_OFFSET

    jmp $


BOOTDRV: db 0
MSG_LOAD_KERNEL: db "Loading Kernel into Memory",0
MSG_REAL_MODE: db "Started in 16bit real mode",0
MSG_PROT_MODE: db "Switched to 32bit prot mode",0



times 510-($-$$) db 0

dw 0xaa55


