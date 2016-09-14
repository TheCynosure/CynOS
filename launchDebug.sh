
gnome-terminal -e "gdb -s cynos.sym -ex 'target remote localhost:1234'"
qemu-system-i386 -cdrom CynOS.iso -m 3072 -s -S
