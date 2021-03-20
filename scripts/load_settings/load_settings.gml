function load_settings() {
	var openFile = file_text_open_read(working_directory + "Settings.txt");
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
	
		global.currentSettings[i] = real(_saveFileContents[i]);
		show_debug_message("Setting being stored is " + string(global.currentSettings[i]));
	
		show_debug_message("Loading setting " + string(_saveFileContents[i]));
	}
	script_execute(load_volume);


}
