function save_game(_currentSave) {
	//var _currentSave = argument[0];
	var _currentSaveBuffer = _currentSave;
	_currentSave += ".txt";
	show_debug_message("_currentSave is " + _currentSave);
	if(file_exists(_currentSave))
	{
		_currentSave = string_replace(_currentSave, ".txt", "");
		_currentSave = _currentSaveBuffer + string(global.numSaves);
		_currentSave += ".txt";
	}
	
	var i = 0;
	var openFile = file_text_open_write(_currentSave);
	var _setNameExists = instance_exists(oSetName);
	var _choiceExists = instance_exists(oChoice);
	var _buffer = 0;

	if(!_choiceExists && !_setNameExists)
	{
		show_debug_message("Saving game");
		file_text_write_string(openFile, global.branches[global.currentBranch][0]);
		file_text_writeln(openFile);
		show_debug_message("The branch you were in before you saved was " + global.branches[global.currentBranch][0]);
	
	
		file_text_write_real(openFile, global.newFlagIndex);
		file_text_writeln(openFile);
	
		file_text_write_real(openFile, global.playerFlagCounter);
		file_text_writeln(openFile);
	
		file_text_write_real(openFile, global.currentBackground);
		file_text_writeln(openFile);
	}
	else if(_choiceExists)
	{
		show_debug_message("Saving game");
		file_text_write_real(openFile, global.currentBranch);
		file_text_writeln(openFile);
	
	
		file_text_write_real(openFile, global.newFlagIndex);
		file_text_writeln(openFile);
	
		file_text_write_real(openFile, global.playerFlagCounter);
		file_text_writeln(openFile);
	
		file_text_write_real(openFile, global.currentBackground);
		file_text_writeln(openFile);
	}

	if(!_setNameExists)
	{
		file_text_write_string(openFile, global.playerName + "{ISPLAYERNAME}");
		file_text_writeln(openFile);
	
	
		for(i = 0; i < array_length(global.flags); i++)
		{
			file_text_write_string(openFile, global.flags[i]);
			file_text_writeln(openFile);
		}
		for(i = 0; i < array_length(global.boolFlags); i++)
		{
			_buffer = global.boolFlags[i];
			file_text_write_string(openFile, _buffer);
			show_debug_message("_buffer from within save_game is " + string(_buffer));
			file_text_writeln(openFile);
		}
		for(i = 0; i < array_length(global.keys); i++)
		{
		
			_buffer = global.keys[i];
			show_debug_message("Saving Keys: Key from save_game is " + _buffer);
			file_text_write_string(openFile, _buffer);
			if( i < array_length(global.keys) - 1)
			{
				file_text_writeln(openFile);
			}
		}
	
	}

	file_text_close(openFile);


	return _currentSave;


}
