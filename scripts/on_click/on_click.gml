function on_click() {
	show_debug_message("Button Clicked: " + text);

	if (text == "New Game") 
	{
		global.newGame = true;
		audio_stop_all();
		room_goto(RMmainGame);	
	}

	if (text == "Load Save")
	{
		instance_destroy(oButton);
		create_list(room_width / 2 - (300 / 2), room_height / 2 - (240 / 2), 300, 240, LIST_TYPE.LOAD_MENU);
	
	}


	
	
	create_menu_type((room_width / 2) , (room_height / 2), text);



}
