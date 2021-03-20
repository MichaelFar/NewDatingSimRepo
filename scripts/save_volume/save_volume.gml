function save_volume() {
	if(file_exists("Volume.txt"))
	{
		file_delete("Volume.txt");
	}
	
	var openFile = file_text_open_write("Volume.txt");

	

	file_text_write_real(openFile, global.musicVolume);
	file_text_writeln(openFile);

	file_text_write_real(openFile, global.voiceVolume);
	file_text_writeln(openFile);
	
	file_text_write_real(openFile, global.fullscreen);
	file_text_writeln(openFile);
	
	file_text_write_real(openFile, global.textSpeed);
	file_text_writeln(openFile);
	
	

	file_text_close(openFile);



}
