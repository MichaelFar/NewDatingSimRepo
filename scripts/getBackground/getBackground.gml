function getBackground(_BACKID) {



	//var _line = argument[0];

	
	var background_layer = layer_get_id("Background");
	var background_id = layer_background_get_id(background_layer);

	layer_background_sprite(background_id, _BACKID);
	
/*
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
*/
	global.currentBackground = _BACKID;
}
