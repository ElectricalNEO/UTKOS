
ROOT = .

all: build/boot/boot.bin run

include boot/Makefile

os.bin: build/boot/boot.bin
	cp $< $@

run: os.bin
	qemu-system-i386 -fda $<

clean:
	rm -rf build
