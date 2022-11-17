[bits 16]
[org 0x7c00]

jmp word 0:boot

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

boot:
    
    xor ax, ax
    mov ds, ax
    mov ss, ax
    mov sp, 0xf000
    
    mov si, data.hello_world
    call print
    
    jmp $
    
data:
    .hello_world: db "Booting UTK-OS...", 13, 10, 0
   
times 510-($ -$$) db 0
dw 0xaa55
