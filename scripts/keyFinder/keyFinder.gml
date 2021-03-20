function keyFinder() {
	var _buffer = 0;
	var _lockBuffer = 0;
	var _foundLock = false;
	var _hadKey = false;

	for(var i = 0; i < array_length(global.flags); i++)
	{
		if(string_pos("KEY_", global.flags[i]) != 0)
		{
		
			_buffer = string_delete(global.flags[i], string_pos("KEY_", global.flags[i]), string_pos("_KEY", global.flags[i]));
			show_debug_message("_buffer after first deletion is " + _buffer);
			_buffer = string_replace(global.flags[i], _buffer, "");
			_buffer = string_replace(_buffer, "KEY_", "");
			_buffer = string_replace(_buffer, "_KEY", "");
			_lockBuffer = _buffer;
			show_debug_message("The key is " + _buffer + " before lock is found");
		
			if(string_pos("LOCK_", _buffer) != 0)
			{
			
				_buffer = string_delete(_buffer, string_pos(string_digits(_buffer) + "LOCK_", _buffer), string_pos("_LOCK", _buffer));
			
			}
		
			show_debug_message("The key is " + _buffer + " after lock is found");
		}
	
	
		for(var j = 0; j < array_length(global.LockAndKeys); j++)
		{
			if(string_pos(_buffer, global.LockAndKeys[j][0]) != 0 && string_pos("KEY_" + _buffer, global.LockAndKeys[j][0]) == 0)
			{
				var _currentLock = j;
				_foundLock = true;
				show_debug_message("Found lock within flag_parser" + global.LockAndKeys[_currentLock][0] + " which is in the " + _buffer + " family");
			}
		}
	
	
		
		if(_foundLock)
		{
			show_debug_message("Your flags before checking to see if they are keys ");
			show_debug_message(global.flags);
			for(var k = 0; k < array_length(global.keys); k++)
			{
			
				if(global.flags[i] == global.keys[k])
				{
					_hadKey = true;
				}
			}
			if(!_hadKey)
			{
				global.keys[global.keyCount] = global.flags[i];
				global.keyCount++;
			
			}
			_hadKey = false;
			show_debug_message(global.keys);
		}
	}




}
