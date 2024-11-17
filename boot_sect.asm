[org 0x7c00]

mov bp, 0x9000
mov sp, bp


mov bx, MSG_REAL_MODE
call print_string

call switch_to_pm

jmp $ ;never called


%include "...\print_string.asm" 
%include "...\disk_load.asm"
%include "...\32bit-print.asm"
%include "...\gdt.asm"
%include "...\32bit-switch.asm"

[bits 32]
BEGIN_PM:
mov ebx, MSG_PROT_MODE
call print_string_pm

jmp $




; Global variables
BOOT_DRIVE db 0
MSG_LOAD_KERNEL db "Loading kernel into memory...",0
MSG_REAL_MODE: db "Started in 16-bit Real Mode",0
MSG_PROT_MODE: db "Sucessfully entered 32-bit Protected Mode",0
MSG: db "Attempting 32bit mode",0

times 510 - ($-$$) db 0
dw 0xaa55


;qemu_sys_ACRCITECTURE BIN_FILE qemu-system-x86_64.exe
;nasm FILE -f bin -o FILE.bin
