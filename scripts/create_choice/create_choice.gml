function create_choice(_flagIndex, _text, _destination, _script, _x, _y, _flags, _wasClicked, _isLocked) {
	/*

	*/
	//show_debug_message("Attempting to create choice");
	/*
	var _flagIndex = argument[0]
	var _text = argument[1];
	var _destination = argument[2];
	var _script = argument[3];
	var _x = argument[4];
	var _y = argument[5];
	var _flags = argument[6];
	var _wasClicked = argument[7];
	var _isLocked = argument[8];
	*/
	var _choice = instance_create_layer(_x, _y, "Text", oChoice);
	instance_destroy(oTextBox);

	with (_choice) {
		x = _x;
		y = _y;
		text = _text;
		currentArray = _destination;
		script = _script;
		rememberClick = _wasClicked;
		flag = _flags[_flagIndex];
		flagIndex = _flagIndex;
		isLocked = _isLocked;
	
		currentSprite = SlicedBox;
		if(_isLocked)
		{
			currentSprite = lockedSlicedBox;
			text = "LOCKED";
		}
	
	
		if(_wasClicked)
		{
			currentSprite = 0;
		}
	
	}
	return _choice;


}
