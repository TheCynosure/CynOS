objcopy --only-keep-debug CynOS.bin cynos.sym
objcopy --strip-debug CynOS.bin
#Move the Bin file to its grub place
mv CynOS.bin isofiles/boot/CynOS.bin
#Make an iso file
grub-mkrescue -o CynOS.iso isofiles/
