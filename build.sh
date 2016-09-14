#Clean out the out folder
#rm out/*.o

#Make sure that assembler output is red
printf "\033[31m"
#Assemble all the files into elf64 format
for file in */*.asm
do
  name=$(basename $file | cut -f 1 -d '.')
  nasm -f elf32 -o out/$name.o $file -w+all $1
done

for file in */*.c
do
  name=$(basename $file | cut -f 1 -d '.')
  ~/Cross/bin/i686-elf-gcc -o out/$name.o $file -c
done
printf "\033[0m"

#Make sure that linker output is yellow
printf "\033[33m"
#Link them all together using our linker script link.ld
cd out
ld -n -o ../CynOS.bin -T link.ld *.o -m elf_i386
printf "\033[0m"
