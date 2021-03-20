/// @arg x
/// @arg y
/// @arg text
function create_menu_type(_x, _y, _text) {


	// Arguments
	/*
	var _x = argument[0];
	var _y = argument[1];
	var _text = argument[2];
	*/
	//Create Different Buttons for main menu

	instance_destroy(oButton);

	

		if (_text == "Options") 
		{
			
			create_list(_x - (300 / 2), _y - (240 / 2), 300, 240, LIST_TYPE.SETTINGS);
		}
		else if(_text == "Load Save") 
		{
			
		}
		else if(_text != "New Game")
		{
			game_end();
		}
	
	





}
