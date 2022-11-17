[bits 16]
[org 0x600]

    ; SETUP SEGMENT REGISTERS AND STACK
    
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0xf000
    
    ; RELOCATE
    
    mov si, 0x7c00
    mov di, 0x600
    mov cx, 128
    rep movsd
    
    jmp word 0:boot
    
boot:
    
    mov si, data.booting
    call print
    
    jmp $
    
print:
    xor bx, bx
    mov ah, 0eh
.loop:
    lodsb
    or al, al
    jz .end
    int 10h
    jmp .loop
.end:
    ret   

data:
    .booting: db "Booting from partition "
    .part: db "1...", 13, 10, 0
   
times 440-($ -$$) db 0

dd 0
dw 0

part0:
.attr: db 0
.chs_start: times 3 db 0
.type: db 0
.chs_end: times 3 db 0
.lba_start: dd 0
.sectors: dd 0

part1:
.attr: db 0
.chs_start: times 3 db 0
.type: db 0
.chs_end: times 3 db 0
.lba_start: dd 0
.sectors: dd 0

part2:
.attr: db 0
.chs_start: times 3 db 0
.type: db 0
.chs_end: times 3 db 0
.lba_start: dd 0
.sectors: dd 0

part3:
.attr: db 0
.chs_start: times 3 db 0
.type: db 0
.chs_end: times 3 db 0
.lba_start: dd 0
.sectors: dd 0

dw 0xaa55
