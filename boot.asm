org 0x7c00
bits 16



main:


.prt:

mov si, msg
mov ah, 0x0e
mov cx, msg_len

.read_char:
lodsb
int 0x10
loop .read_char


halt:

cli
hlt


msg: db 'boot loader'
msg_len equ $ - msg

pad:

times 510-($-$$) db 0

sig:
dw 0xaa55