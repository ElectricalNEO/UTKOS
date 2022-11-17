
ROOT = .

SHELL = /usr/bin/bash
mbr = $(ROOT)/build/boot/mbr.bin

all: run

include boot/Makefile

os.img: $(mbr)
	dd if=/dev/zero of=$@ bs=8192 count=8192 status=none
	dd if=$(mbr) of=$@ bs=1 count=440 status=none conv=notrunc
	echo -e "\x55\xaa" | dd of=$@ bs=1 count=2 seek=510 conv=notrunc

run: os.img
	qemu-system-i386 -hda $<

clean:
	rm -rf build os.img
