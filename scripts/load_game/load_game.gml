function load_game(_loadedFile) {

	//var _loadedFile = argument[0];

	var openFile = file_text_open_read(working_directory + _loadedFile);
	var i = 0;
	var j = 0;
	var _numFlags = 0;
	var _startIndex = 0;
	var _numBoolFlags = 0;
	var _numKeys = 0;
	while(!file_text_eof(openFile))
	{
		global.saveFileContents[i] = file_text_read_string(openFile);
		i++;
		file_text_readln(openFile);
	}

	file_text_close(openFile);

	for(i = 0; i < array_length(global.saveFileContents); i++)
	{
		if(i == 0)
		{
			for(j = 0; j < array_length(global.branches); j++)
			{
				if(global.branches[j][0] == global.branches[i][0])
				{
					global.currentBranch = j;
					show_debug_message("Loaded into branch " +  global.saveFileContents[j]);
					break;
				}
			//global.currentBranch = global.saveFileContents[i];
			}
		}
		else if(i == 1)
		{
			global.newFlagIndex = real(global.saveFileContents[i]);
		}
		else if(i == 2)
		{
			global.playerFlagCounter = real(global.saveFileContents[i]);
		}
		else if(i == 3)
		{
			var background_layer = layer_get_id("Background");
			var background_id = layer_background_get_id(background_layer);
			layer_background_sprite(background_id, SPRbackgroundSprites);
			layer_background_speed(background_id, 0);
			global.currentBackground = real(global.saveFileContents[i]);
			layer_background_index(background_id, global.currentBackground);
		}
		else if(string_pos("{ISPLAYERNAME}",global.saveFileContents[i]) != 0)
		{
			global.playerName = 
			string_delete(global.saveFileContents[i], 
			string_pos("{", global.saveFileContents[i]), string_length("{ISPLAYERNAME}"));
			show_debug_message("Player name after loading is " + global.playerName);
		}
		else if(string_pos("flag_", global.saveFileContents[i]) != 0 )
		{
			if(_numFlags == 0)
			{
				_startIndex = i;
			}
			_numFlags++;
			if(string_pos("KEY_", global.saveFileContents[i]) != 0)
			{
				_numKeys++;
			}
		}
	
		else if(_numFlags != 0)
		{
			_numBoolFlags++;
		}
	
	}

	for( i = 0; i < _numFlags; i++)
	{
		global.flags[i] = global.saveFileContents[_startIndex + i];
		show_debug_message("Loaded flag " + global.flags[i]);
	}

	for(i = 0; i < _numBoolFlags; i++)
	{
		global.boolFlags[i] = global.saveFileContents[_startIndex + _numFlags + i];
	}

	for(i = 0; i < _numKeys; i++)
	{
		global.keys[i] = global.saveFileContents[_startIndex + _numFlags+ _numKeys + i];
	}
	/*
	show_debug_message("Loaded bool Flags " + string(global.boolFlags));
	show_debug_message("The number of flags should be " + string(_numFlags) + 
	"\nThe number of flags there are " + string(array_length(global.flags)));
	*/
	if (_numFlags != 0)
	{
		global.currentTBID = create_TB(global.branches, global.newFlagIndex, global.currentBranch, on_click_TB, global.flags[_numFlags - 1]);
	}
	else
	{
		global.currentTBID = create_TB(global.branches, global.newFlagIndex, global.currentBranch, on_click_TB, global.flags[_numFlags]);
	}


}
