function create_textField(_promptText, _x, _y) {
	/*
	var _promptText = argument[0];
	var _x = argument[1];
	var _y = argument[2];
	*/
	var _textField = instance_create_layer(_x, _y, "Text", oSetName);

	with (_textField)
	{
		prompt = _promptText;
		x_position = _x;
		y_position = _y;
	}

	return _textField;


}
