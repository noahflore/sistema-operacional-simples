org 0x7c00
bits 16


jmp short main
nop


block_disk dw 512
sector_p_cluters db 1
sector_reserve db 1
fat_table db 2
number_end dw 0xe0
space_disk dw 2880
label_disk dw 0xf0
sector_fat db 9
sector_p_track db 18



main:

;limpando os secremntos usando o ax
xor ax, ax
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0x7c00

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