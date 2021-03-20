function exclusiveHandler(_flag, _flagArray) {
	/*
	arg0 _flag
	*/


	
	var _hasFlag = false;
	var _EX = 0;
		if (string_pos("[", _flag) != 0)  
		{
			_EX = string_delete(_flag, string_pos("]", _flag)  + 1, string_length(_flag));
			show_debug_message("_EX = " + _EX);
		}
		else 
		{
			_EX = "NOT EXCLUSIVE";	
		}
	
		for (var _i = 0; _i < array_length(_flagArray); _i++) //This for loop checks if global flags already has a _flag
		{
			if(_flagArray[_i] == _flag) 
			{
				_hasFlag = true;
			}
			else if(string_pos(_EX, _flagArray[_i]) != 0)
			{
				_hasFlag = true;
			}
			show_debug_message("Checking for duplicate flags: " + string_format(_flagArray[_i], 0, 0));
		}
		if (!_hasFlag) 
		{
			_flagArray[@global.playerFlagCounter] = _flag;
			global.playerFlagCounter++;
		}
	return _hasFlag;


}
