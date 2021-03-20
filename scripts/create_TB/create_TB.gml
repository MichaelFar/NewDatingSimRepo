function create_TB(_branches, _index, _branchAddress, _script, _flag) {
	/*
	
	

	
	create_TB is called in :
	instruction_parser and the user event 0 within oMainGameManager
	load_game
	oList
	
	*/
	var _textBuffer = 0;
	instance_destroy(oTextBox);

	var _textBox = instance_create_layer(global.boxX , global.boxY, "Instances", oTextBox);

	with (_textBox) 
	{
		global.newFlagIndex = _index;
		show_debug_message("Current branch location: " + global.branches[_branchAddress][0]);
		global.currentBranch = _branchAddress;
	
		//This loop finds the name from the text file and makes sure it doesn't show up in the main text
		//The name should show up in the designated nameplate area
		if(!global.inLog)
		{
			keyFinder();
		}
		if(array_length(_branches[_branchAddress]) == 1) //If the file is only instructions activate the instructions
		{	
			instruction_parser(global.instructions);
		}
		else
		{
			_textBuffer = flag_parser(_flag, _branches,_branchAddress, _index, false);
			for(k = 0; k < array_length(global.names); k++) 
			{
				if (string_pos(global.names[k], _textBuffer) != 0) 
				{		
					flag = _flag;
					//checks if the current line has a flag and then performs the required flag functions
					_textBuffer = string_delete(_textBuffer, string_pos(global.names[k], _textBuffer), string_length(global.names[k])); //Deletes the name from the text box
					if(string_pos("{PLAYERNAME}", _textBuffer) != 0)
					{
						_textBuffer = string_replace_all(_textBuffer, "{PLAYERNAME}", global.playerName);
					}
					text = _textBuffer;
					
					hasName = true;	//Instructs the text box to draw a name 
					name = global.names[k]; //This sets the nameplate to be whatever the name in the text line is
					if(name == "PC:")
					{
						name = global.playerName;
					}
					else
					{
						name = string_delete(name, string_pos(":", name), string_length(name)); //Deletes the colon that is used to target the name
					}
					break;// We break because once a name is found we have no use for the rest of the loop
				}
				else 
				{				
				
					flag = _flag;
					if(string_pos("{PLAYERNAME}", _textBuffer) != 0)
					{
						_textBuffer = string_replace_all(_textBuffer, "{PLAYERNAME}", global.playerName);
					}
					text = _textBuffer;
					
					hasName = false;	
					name = "";
					
				}
			}
		}
			script = _script;
			currentArray = _branches;
			index = global.newFlagIndex;
			show_debug_message("textHistoryTracker is now: " + string(global.textHistoryTracker));
			if(global.textHistoryTracker != 0)
			{
				show_debug_message("Current dialogue is " + _textBuffer + " while current textHistory is " + global.textHistory[global.textHistoryTracker - 1])
				if(global.textHistory[global.textHistoryTracker - 1] != _textBuffer)
				{
					global.textHistory[global.textHistoryTracker] = text;
					if(hasName)
					{
						global.textHistory[global.textHistoryTracker] = name + ":" + text;
					}
					global.textHistoryTracker++;
				}
			}
			else
			{
				if(global.textHistory[0] != _textBuffer)
				{
					global.textHistory[global.textHistoryTracker] = text;
					global.textHistoryTracker++;
				}
			}
			show_debug_message("Current index at the end of create_TB " + string(index));
	}

	return _textBox;



}
