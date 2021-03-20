function branchFileUnpacker() {
	//Write information to a 2d array
	// 1st index is file lines came from
	// 2nd index is lines of dialogue
	//what
	var i = 0;
	var j = 1;
	var z = 0;
	var m = 0;
	var buffer = 0;
	var _keyIndex = 0;
	var _numKeys = 0;
	var foundInstructions = false;
	var foundMeta = false;
	var openFile = file_text_open_read(working_directory + "ListOfBranches.txt");

	if (openFile != -1) //get necessary branch files and their instructions
	{
		while (!file_text_eof(openFile)) 
		{
			global.branches[i][0] = file_text_read_string(openFile); // global.branches[i][0] are reserved for filenames
			global.instructions[i][0] = global.branches[i][0];
			global.metaData[i][0] = global.branches[i][0];
			/*
			global.branches[i][0] = file_text_read_string(openFile); // global.branches[i][0] are reserved for filenames
			global.instructions[i][0] = global.branches[i][0];
			global.metaData[i][0] = global.branches[i][0];
			*/
			i++;
			file_text_readln(openFile);
		
		}
		file_text_close(openFile);
	}

	i = 0;

	openFile = file_text_open_read(working_directory + "charNames.txt");//Get character names

	if (openFile != -1) 
	{
		while(!file_text_eof(openFile))
		{
			global.names[i]	= file_text_read_string(openFile);
		
			if(string_pos("SPRITE", global.names[i]) != 0)
			{
				global.names[i] = string_replace(global.names[i], "SPRITE", "");
				global.charWithSprites[z] = global.names[i];
				z++;
			}
			i++;
		
			file_text_readln(openFile);
		}
		file_text_close(openFile);
	}

	i = 0;

	openFile = file_text_open_read(working_directory + "ListOfBackgrounds.txt");//Get background human indexes
	if (openFile != -1) 
	{
		while(!file_text_eof(openFile))
		{
			global.backGrounds[i] = file_text_read_string(openFile);
			i++;
		
			file_text_readln(openFile);
		}
		file_text_close(openFile);
	}

	for (i = 0; i < /*array_height_2d(global.branches)*/ array_length(global.branches); i++) //load the dialogue into the dialogue arrays
	{
		openFile = file_text_open_read(working_directory + global.branches[i][0]);
		
		foundInstructions = false;
		foundMeta = false;
		z = 1;
		j = 1;
		m = 1;
		var k = 1;
		_numKeys = 1;
	
		while (!file_text_eof(openFile)) 
		{
			buffer = file_text_read_string(openFile);
			if (buffer != "#" && foundInstructions == false && foundMeta == false)
			{
				buffer = string_replace_all(buffer, "PenisChamp", "{PLAYERNAME}")
				buffer = string_replace_all(buffer, "Penischamp", "{PLAYERNAME}")
				global.branches[i][j] = buffer;
				j++;
				file_text_readln(openFile);
			}
			else if(buffer !="META_DATA" && foundMeta == false)
			{
				foundInstructions = true;
				global.instructions[i][z] = buffer;
				if(string_pos("LOCK_", buffer) != 0)
				{
				
					global.LockAndKeys[_keyIndex, 0] = buffer;
					show_debug_message("Key number " + string(_keyIndex) + " of LockAndKeys is " + string(global.LockAndKeys[_keyIndex, 0]));
					_numKeys = real(string_digits(buffer));
					for(k = 1; k < _numKeys + 1; k++)
					{
						global.LockAndKeys[_keyIndex][k] = false;
					}
					//show_debug_message("Key number " + _keyIndex + " of LockAndKeys is " + global.LockAndKeys[_keyIndex, 0]);
					_keyIndex++;
				
				}
				show_debug_message("Stored instruction " + buffer);
				file_text_readln(openFile);
				z++;
			}
			else
			{
				foundMeta = true;
				global.metaData[i][m] = buffer;
				file_text_readln(openFile);
				m++;
			}
		
		}
		//show_debug_message(global.LockAndKeys);
		file_text_close(openFile);
	}
		
	file_text_close(openFile);
		
	
	
	




}
