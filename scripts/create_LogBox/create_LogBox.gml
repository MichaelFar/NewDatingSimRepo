function create_LogBox(_x, _y, _index) {
	/*
	
	

	
	create_TB is called in :
	instruction_parser and the user event 0 within oMainGameManager
	load_game
	oList
	
	*/
	var _textBuffer = global.textHistory[_index];
	
	show_debug_message("This log box is saying " + _textBuffer);
	instance_destroy(oTextBox);

	var _logBox = instance_create_layer(_x, _y, "Text", oLogBox);

	with (_logBox) 
	{
		//global.newFlagIndex = _index;
		//show_debug_message("Current branch location: " + global.branches[_branchAddress][0]);
		//global.currentBranch = _branchAddress;
	
		//This loop finds the name from the text file and makes sure it doesn't show up in the main text
		//The name should show up in the designated nameplate area
		
		
		
			//_textBuffer = flag_parser(_flag, _branches,_branchAddress, _index, true);
			for(k = 0; k < array_length(global.names); k++) 
			{
				if (string_pos(global.names[k], _textBuffer) != 0) 
				{		
					//flag = _flag;
					//checks if the current line has a flag and then performs the required flag functions
					_textBuffer = string_delete(_textBuffer, string_pos(global.names[k], _textBuffer), string_length(global.names[k])); //Deletes the name from the text box
					if(string_pos("{PLAYERNAME}", _textBuffer) != 0)
					{
						_textBuffer = string_replace_all(_textBuffer, "{PLAYERNAME}", global.playerName);
					}
					text = _textBuffer;
					
					hasName = true;	//Instructs the text box to draw a name 
					name = global.names[k]; //This sets the nameplate to be whatever the name in the text line is
					show_debug_message("Logged name of speaker is " + name);
					if(name == "PC:")
					{
						name = global.playerName + ":";
					}
					
					break;// We break because once a name is found we have no use for the rest of the loop
				}
				else 
				{				
				
					//flag = _flag;
					if(string_pos("{PLAYERNAME}", _textBuffer) != 0)
					{
						_textBuffer = string_replace_all(_textBuffer, "{PLAYERNAME}", global.playerName);
					}
					text = _textBuffer;
					
					hasName = false;	
					name = "";
				}
			}
		
			//script = _script;
			//currentArray = _branches;
			index = _index;
			//show_debug_message("Current index at the end of create_TB " + string(index));
	}

	return _logBox;



}
