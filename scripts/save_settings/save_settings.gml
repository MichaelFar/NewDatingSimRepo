function save_settings() {
	if(file_exists("Settings.txt"))
	{
		file_delete("Settings.txt");
	}
	
	var i = 0;
	var openFile = file_text_open_write("Settings.txt");

	



	for(var i = 0; i < array_length(global.currentSettings); i++)
	{
		file_text_write_real(openFile, global.currentSettings[i]);
		if( i < array_length(global.currentSettings) - 1)
		{
			file_text_writeln(openFile);
		}
	
	}
	file_text_close(openFile);
	script_execute(save_volume);


}
