function instruction_parser(_instructions) {
	/*
	arg instructions (array)
	*/

	//var _instructions = argument[0];
	/*
	THE WONDERFUL INSTRUCTION PARSER:
	
	choice flag types:
	LOCK_context_LOCK: is unlocked upon acquiring all KEY_context_KEY, only usable within choicecreate but persists between files
	KEY_context_KEY: all of these must be acquired to unlock LOCK_context_LOCK, only usable within choicecreate but persists between files
	[context]text_: allows for choices to affect the dialogue outcomes in other files, see flag_parser for details
	{context}(this is for exhaustchoice)
	{context}target_: unlocked upon all {context} flags within the same file being selected, only usable within exhaustchoice
	{context}ULTRA_: is unlocked upon all other choices being exhausted, only usable within exhaust choice
	
	choicecreate:
	Creates non exclusive choice objects to fit the labels. On click they will take you to the destination file and store the flag
	This is used to remember choices
	You can also lock these choices with LOCK_context_LOCK which upon aquiring all of those the player will unlock any KEY_context_KEY
	If the player cannot make these choices it will appear as 'locked'
	Note: Keys and locks are initialized on game start so they can persist throughout different files unlike exhaustchoice
	In this way exhaustchoice is somewhat deprecated, but makes it so that there isn't any "clogging"
		format:
		"
		choicecreate
		Label
		Destination(.txt)
		Flag
			"
	
	goto:
	A simple instruction that take the player to the destination file
	Useful if you want to go back to a different file's instructions
		format:
		"
		goto
		Destination(.txt)
			"
	
	exhaustchoice:
	This instruction is for when you want a choice that is only available when all other {context_tag}options are exhausted
	The choices within this instruction may have {context_tag} where context_tag is replaced with a descriptor label that indicates what choice(s) it will unlock
	The target choice that is unlocked upon exhausting all {context_tag} is denoted with {context_tag}target_
	Note: Targets can only be used to unlock ULTRA_ targets which are unlocked after all other choices are selected at least once
	You shouldn't use this if you want the choices to persist through different files, use choicecreate for that
		format:
		"
		exhaustchoice
		Label
		Destination(.txt)
		{context_tag}Flag(any number of these)
		Label2
		Destination2(.txt)
		{context_tag}target_flag(any number of these)
		
			"
	
	CHOOSEGROUP:
	Not yet implemented. Will be used to handle choosing a group to go with
	
	GAMERESTART:
	restarts game: specifically restarts the maingame room, should not be used to boot to menu
	*/

	var i = 0; 
	var j = 0;
	var _numDestinations = 0;
	
	var _destinations = 0;
	_destinations[0] = 0;
	var _labels = 0;
	var _gotoBranch = 0;
	var _flags = 0;
	var _EX = 0;
	var _exhaustTag = "";
	var _wasClicked = false;
	var _numNonTarget = 0;
	var _numTarget = 0;
	var _exhaustTagTarget = 0;
	var _choiceID = 0;
	var _numUltra = 0;
	var _needsKey = 0;
	var _foundKeys = 1;
	var _hasKey = false;
	var _currentLock = 0;
	var _foundLock = false;
	var _buffer = "";
	global.tempFlags = 0;
	var _shouldnotList = false;
	/*
	This takes apart the instructions array and separates the different instructions to different arrays for individual parsing
	*/
	if(_instructions[global.currentBranch][2] == "choicecreate") 
	{
			for (i = 1; i < array_length(_instructions[global.currentBranch]); i++) 
			{
				if (string_pos(".txt",_instructions[global.currentBranch][i]) != 0)
				{
					for (j = 0; j < array_length(global.branches); j++) 
					{
						if (global.branches[j][0] == _instructions[global.currentBranch][i]) 
						{
							_destinations[_numDestinations] = j;
							_labels[_numDestinations] = _instructions[global.currentBranch][i - 1];
							if (string_pos("flag_",_instructions[global.currentBranch][i + 1]) != 0) 
							{
								_flags[_numDestinations] = _instructions[global.currentBranch][i + 1];
								global.boolFlags[i] = false;
								if(string_pos("LOCK_", _instructions[global.currentBranch][i + 1]) != 0)
								{
									_needsKey[_numDestinations] = true;
									show_debug_message(_flags[_numDestinations] + " needs keys");
								}
								else
								{
									_needsKey[_numDestinations] = false;
								}
							}
						
							_numDestinations += 1;
						}
					}
				}
			}

			for (i = 0; i < _numDestinations; i++) 
			{
			//_labels[] handles the text on the button, while _destinations[] holds the index for the desired branch
			
				if(_needsKey[i])
				{
					_buffer = string_delete(_flags[i], string_pos("LOCK_", _flags[i]), string_pos("_LOCK", _flags[i]));
					_buffer = string_replace(_flags[i], _buffer, "");
					_buffer = string_replace(_buffer, "LOCK_", "");
					_buffer = string_replace(_buffer, "_LOCK", "");
				
					for(var j = 0; j < array_length(global.LockAndKeys); j++)
						{
							if(_flags[i] == global.LockAndKeys[j][0] && string_pos("KEY_" + _buffer, global.LockAndKeys[j][0]) == 0)
							{
								_currentLock = j;
								_foundLock = true;
								show_debug_message("Found lock " + global.LockAndKeys[_currentLock][0]);
							}
						}
				
					if(_foundLock)
					{
					
							for(var k = 0; k < array_length(global.keys); k++)
							{
								if(string_pos(_buffer, global.keys[k]) != 0)
								{
									_foundKeys++;
									show_debug_message("Number of player obtained keys is " +string(_foundKeys));
								}
								if(_foundKeys == array_length(global.LockAndKeys[_currentLock]))
								{
									_hasKey = true;
									show_debug_message("Player has " + string(_foundKeys) + " keys which is enough to open " + global.LockAndKeys[_currentLock][0]);
								}
							}
					
					}
				}
				else
				{
					_hasKey = false;
				}
			
				if(_needsKey[i])
				{
					show_debug_message("_hasKey is " + string(_hasKey));
					_choiceID[i] = create_choice(i, _labels[i], _destinations[i], on_click_TB, (room_width / 2) - room_width / 12 , room_height / 4 + (140 * i), _flags, false, !_hasKey);
					_choiceID[i].arrayOfChoices = _choiceID;
				}
				else
				{
					_choiceID[i] = create_choice(i, _labels[i], _destinations[i], on_click_TB, (room_width / 2) - room_width / 12 , room_height / 4 + (140 * i), _flags, false, _needsKey[i]);
					_choiceID[i].arrayOfChoices = _choiceID;
				}
				
				
				show_debug_message(_labels[i]);
			}
			
			
	}
	else if(_instructions[global.currentBranch][2] == "goto") 
	{
			for (i = 0; i < array_length(_instructions[global.currentBranch]); i++) 
			{
				if (string_pos(".txt",_instructions[global.currentBranch][i]) != 0) 
				{
					for (j = 0; j < array_length(global.branches); j++) 
					{
						if (global.branches[j][0] == _instructions[global.currentBranch][i]) 
						{
							_gotoBranch = j;
						}
					}
				}
			}

			global.currentTBID = create_TB(global.branches, 1, _gotoBranch, on_click_TB, flag);
		
	}
	else if(_instructions[global.currentBranch][2] == "exhaustchoice")
	{
		instance_destroy(oChoice);
	
		for (i = 1; i < array_length(_instructions[global.currentBranch]); i++) 
		{
			if (string_pos(".txt",_instructions[global.currentBranch][i]) != 0)
			{
				for (j = 0; j < array_length(global.branches); j++) 
				{
					if (global.branches[j][0] == _instructions[global.currentBranch][i]) 
					{
						_destinations[_numDestinations] = j;
						global.choiceDestinations[_numDestinations] = j;
						global.flagIndex[_numDestinations] = _numDestinations;
						_labels[_numDestinations] = _instructions[global.currentBranch][i - 1];
					
						if (string_pos("flag_",_instructions[global.currentBranch][i + 1]) != 0) 
						{
							_flags[_numDestinations] = _instructions[global.currentBranch][i + 1];
							global.tempFlags[_numDestinations] = _flags[_numDestinations];
							_wasClicked[_numDestinations] = false;
						
							if(string_pos("LOCK_", _instructions[global.currentBranch][i + 1]) != 0)
							{
								_needsKey[_numDestinations] = true;
								show_debug_message(_flags[_numDestinations] + " needs keys");
							}
							else
							{
								_needsKey[_numDestinations] = false;
							}
						}
							_numDestinations += 1;
					}
				}
			}
		}
		
		
		
		
		
		
		for(i = 0; i < _numDestinations; i++)
		{
			if (string_pos("{", _flags[i]) != 0)  
			{
				_EX = string_delete(_flags[i], string_pos("}", _flags[i])  + 1, string_length(_flags[i]));
				_exhaustTag[i] = _EX;		
			}
		}
		if(_exhaustTag != "")
		{
			for(i = 0; i < _numDestinations; i++)
			{
				if (string_pos(_exhaustTag[i] + "target_",_flags[i]) == 0)
				{
					_numNonTarget++;
				}
				else
				{
					_exhaustTagTarget[_numTarget][ 0] = _exhaustTag[i] + "target_";
					_exhaustTagTarget[_numTarget][ 1] = 0; //amount of required flags to trigger
					_exhaustTagTarget[_numTarget][ 2] = 0; //amount that have been triggered
					if(string_pos("ULTRA", _flags[i]) !=0)
					{
						_numUltra++;
					}
						_numTarget++;
				}
			}
		
			for(i = 0; i < _numTarget; i++)
			{
				for(var j = 0; j < _numNonTarget; j++)
				{
					if (string_pos(_exhaustTag[j],_exhaustTagTarget[i][ 0]) != 0)
					{
						_exhaustTagTarget[i][ 1] += 1;
					}
				}
			}
		}
		for(i = 0; i < _numDestinations - _numUltra; i++)
		{
			if(i < array_length(global.boolFlags))
			{
				_wasClicked[i] = global.boolFlags[i];	
				//show_debug_message("_wasClicked is now " + string(_wasClicked[i])+" after loop " + string(i));
			}
			else
			{
				_wasClicked[i] = false;
			}
			global.masterClickTracker[i] = _wasClicked[i];
		}
		
		
		var _targetIndex = 0;
		var _NOaccessUltraTarget = false;
		show_debug_message("\n");
		
		for(var j = 0; j < _numDestinations - _numUltra; j++)
		{
			if(!_wasClicked[j])
			{
				_NOaccessUltraTarget = true;
			}
			//show_debug_message("_wasClicked is now " + string(_wasClicked[j])+" after loop " + string(j));
		}
	
		var _totalHeight = 0;
		var _totalWidth = 0;
		for(var i = 0; i < array_length(_labels); i++)
		{
			_totalHeight += string_height(_labels[i]);
			if(_totalWidth < string_width(_labels[i]))
			{
				_totalWidth = string_width(_labels[i]);
			}
		}
	
	
		global.choiceLabels = 0;
		global.totalDestinations = _numDestinations;
	
		for (i = 0; i < _numDestinations; i++) 
		{
			_targetIndex = 0;
			//_labels[] handles the text on the button, while _destinations[] holds the index for the desired branch
			
				if(_needsKey[i])
				{
					_buffer = string_delete(_flags[i], string_pos("LOCK_", _flags[i]), string_pos("_LOCK", _flags[i]));
					_buffer = string_replace(_flags[i], _buffer, "");
					_buffer = string_replace(_buffer, "LOCK_", "");
					_buffer = string_replace(_buffer, "_LOCK", "");
					show_debug_message("The LOCK buffer is " + _buffer);
						for(var j = 0; j < array_length(global.LockAndKeys); j++)
						{
							if(_flags[i] == global.LockAndKeys[j][0] && string_pos("KEY_" + _buffer, global.LockAndKeys[j][0]) == 0)
							{
								_currentLock = j;
								_foundLock = true;
								show_debug_message("Found lock " + global.LockAndKeys[_currentLock][0]);
							}
						}
				
					if(_foundLock)
					{
					
							for(var k = 0; k < array_length(global.keys); k++)
							{
								if(string_pos(_buffer, global.keys[k]) != 0)
								{
									_foundKeys++;
									show_debug_message("Number of player obtained keys is " +string(_foundKeys));
								}
								if(_foundKeys == array_length(global.LockAndKeys[_currentLock]))
								{
									_hasKey = true;
									show_debug_message("Player has " + string(_foundKeys) + " keys which is enough to open " + global.LockAndKeys[_currentLock][0]);
								}
							}
					
					}
				}
				else
				{
					_hasKey = false;
				}
			
			if(string_pos("ULTRA_NOCHOICE",_flags[i]) != 0)
			{
				global.totalDestinations--;
			}
			if(_exhaustTag != "")
			{
				while(string_pos(_exhaustTag[i], _exhaustTagTarget[_targetIndex][0]) == 0)
				{
					_targetIndex++;
				}
			}
			//show_debug_message("The flag " + _exhaustTag[i] + " targets "+ _exhaustTagTarget[_targetIndex][0]);
			
			if(_wasClicked[i] && string_pos("target_",_flags[i]) == 0)
			{
				_exhaustTagTarget[_targetIndex][ 2]++;
			}
			
			//show_debug_message("_NOaccessUltraTarget is currently set to " + string(_NOaccessUltraTarget));
			global.choiceLabels[i] = "~~~~~~LOCKED~~~~~~";	
			if(_exhaustTag != "" && (string_pos(_exhaustTag[i] + "target_",_flags[i]) == 0 
			&& string_pos(_exhaustTag[i], _flags[i]) != 0 
			&&	string_pos("ULTRA",_flags[i]) == 0) 
			&& !_wasClicked[i]
			|| _exhaustTag != "" && (_exhaustTagTarget[_targetIndex][ 2] == _exhaustTagTarget[_targetIndex][ 1] 
			&& string_pos("ULTRA",_flags[i]) == 0)
			&& !_wasClicked[i])
			{
				
				show_debug_message("The flag of choice " + string(i + 1) + " is " + _flags[i])
			
				if(!_needsKey[i])
				{
					global.choiceLabels[i] = _labels[i];
				}
				else if(_hasKey)
				{
					global.choiceLabels[i] = _labels[i];
				}
				//ds_list_add(_list.list, [_labels[i],-1,[]]);
			}
			else if(string_pos("ULTRA",_flags[i]) != 0 
			&& !_NOaccessUltraTarget 
			&& string_pos("ULTRA_NOCHOICE",_flags[i]) == 0)
			{
				
			
				if(!_needsKey[i])
				{
					global.choiceLabels[i] = _labels[i];
				}
				else if(_hasKey)
				{
					global.choiceLabels[i] = _labels[i];
				}
			}
			else if(_wasClicked[i] 
			|| string_pos("ULTRA",_flags[i]) != 0 
			&& _NOaccessUltraTarget 
			&& string_pos("ULTRA_NOCHOICE",_flags[i]) == 0)
			{
				
				
				if(!_needsKey[i])
				{
					global.choiceLabels[i] = _labels[i];
				}
				else if(_hasKey)
				{
					global.choiceLabels[i] = _labels[i];
				}
			}
			else if(string_pos("ULTRA_NOCHOICE",_flags[i]) != 0 
			&& !_NOaccessUltraTarget)
			{
				instance_destroy(oList);
				create_TB(global.branches, 1, _destinations[i], on_click_TB, flag);
				_shouldnotList = true;
			}
			
		
		
		}
		if(!_shouldnotList)
		{
			create_list(room_width / 2 - (_totalWidth / 2), room_height / 2 - (_totalHeight / 2), _totalWidth, _totalHeight, LIST_TYPE.CHOICE_MENU);
		}
	}
	else if(_instructions[global.currentBranch][2] == "CHOOSEGROUP") 
	{
			global.choiceLabels = "";
			global.choiceDestinations = "";
			global.tempFlags = "";
			for (i = 1; i < array_length(_instructions[global.currentBranch]); i++) 
			{
				if (string_pos(".txt",_instructions[global.currentBranch][i]) != 0)
				{
					for (j = 0; j < array_length(global.branches); j++) 
					{
						if (global.branches[j][0] == _instructions[global.currentBranch][i]) 
						{
							_destinations[_numDestinations] = j;
							global.choiceDestinations[_numDestinations] = j;
							//global.flagIndex[_numDestinations] = _numDestinations;
							_labels[_numDestinations] = _instructions[global.currentBranch][i - 1];
							if (string_pos("flag_",_instructions[global.currentBranch][i + 1]) != 0) 
							{
								_flags[_numDestinations] = _instructions[global.currentBranch][i + 1];
								global.tempFlags[_numDestinations] = _flags[_numDestinations];
							}
								_numDestinations += 1;
						}
					}
				}
			}
			
			_totalHeight = 0;
			for(i = 0; i < _numDestinations; i++)
			{
				global.choiceLabels[i] = _labels[i];
				_totalHeight += string_height(global.choiceLabels[i]);
				
			}
			_totalWidth = 500;
			
			create_list(room_width / 2 - (_totalWidth / 2), room_height / 2 - (_totalHeight / 2), _totalWidth, _totalHeight, LIST_TYPE.GROUP_CHOICE);
	}
	else if(_instructions[global.currentBranch][2] == "GAMERESTART") 
	{
		global.newGame = true;
		room_goto(RMmainMenu);
		room_goto(RMmainGame);
	}
	



}
