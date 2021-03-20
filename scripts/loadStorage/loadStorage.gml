function loadStorage() {
	var openFile = file_text_open_read(working_directory + "listOfSaves.txt");
	var i = 0;

	var _numSaves = 0;
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
			global.numSaves = real(_saveFileContents[i]);
		}
		else
		{
			global.savedGames[_numSaves] = _saveFileContents[i];
			_numSaves++;
		}

	
		show_debug_message("Loading setting " + string(_saveFileContents[i]));
	}


}
