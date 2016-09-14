#Move the Bin file to its grub place
mv CynOS.bin isofiles/boot/CynOS.bin
#Make an iso file
grub-mkrescue -o CynOS.iso isofiles/

