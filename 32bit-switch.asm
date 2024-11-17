[bits 16]
;switch to protected mode
switch_to_pm:
cli


lgdt [gdt_descriptor]

mov eax, cr0 
or eax, 1

mov cr0, eax ;CPU is now in 32 bit mode SOMETHING APPEARS TO BE WRONG RIGHT EHRE


jmp CODE_SEG:start_protected_mode
 


[bits 32]
start_protected_mode:

mov ax, DATA_SEG ;old segments are worthless
mov ds, ax
mov ss, ax
mov es, ax
mov fs, ax
mov gs, ax

mov ebp, 0x90000
mov esp, ebp

call BEGIN_PM

