function load_volume() {
	var openFile = file_text_open_read(working_directory + "Volume.txt");
	var i = 0;

	var _saveFileContents = 0;
	while(!file_text_eof(openFile))
	{
		_saveFileContents[i] = file_text_read_string(openFile);
		i++;
		file_text_readln(openFile);
	}
	file_text_close(openFile);

	for(i = 0; i < array_length(_saveFileContents); i++)
	{
		if(i == 0)
		{
			global.musicVolume = real(_saveFileContents[i]);
		}
		else if (i == 1)
		{
			global.voiceVolume = real(_saveFileContents[i])
		}
		else if (i == 2)
		{
			global.textSpeed = real(_saveFileContents[i]);
		}
		else if (i == 3)
		{
			
			global.fullscreen = real(_saveFileContents[i]);
		}
	
		show_debug_message("Loading setting " + string(_saveFileContents[i]));
	}


}
