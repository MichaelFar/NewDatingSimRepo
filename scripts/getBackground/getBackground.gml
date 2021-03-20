function getBackground(_line) {



	//var _line = argument[0];

	var foundBack = false;
	var i = 0;
	var backIndex = 0;
	var background_layer = layer_get_id("Background");
	var background_id = layer_background_get_id(background_layer);

	layer_background_sprite(background_id, SPRbackgroundSprites);
	layer_background_speed(background_id, 0);

	for (i = 0; i < array_length(global.backGrounds); i++)
	{
		if(string_pos(global.backGrounds[i], _line) != 0)
		{
			backIndex = i;
			foundBack = true;
			show_debug_message("Current background should be " + global.backGrounds[i] +" which is background number " + string(i));
			global.currentBackground = backIndex;
			break;
		}
	}

	if(foundBack)
	{
	
		layer_background_index(background_id, backIndex);
	}


}
