void init_terminal(void)
{
	const char str[] = "CynOS - 1.0";
  unsigned int str_index = 0;
	char *VIDEO_MEM = (char*)0x000b8000; 	//VGA Memory begins here

  //VGA memory is stored in words.
  // So we have to skip by 2 to access the char at c+0 and the attrib at c+1
  for(int row = 0; row < 25; row++) {
    for(int column = 0; column < 80; column++) { //We have to start at 1 so we have no 0 case.
      if(str_index < sizeof(str)) {
        *VIDEO_MEM = str[str_index];
        str_index++;
      } else {
        *VIDEO_MEM = ' ';
      }
      *(VIDEO_MEM+1) = 0x03;
      VIDEO_MEM+=2;
    }
  }
	return;
}
