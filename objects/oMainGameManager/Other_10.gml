/// @description Insert description here
// You can write your code in this editor
show_debug_message("We are now in the main game");
/// @description Insert description here
//room_goto(RMtestRoom);
script_execute(branchFileUnpacker);
metaString = get_meta();
if(global.newGame && room == RMmainGame)
{
	create_textField("What is your name? (MAX 15 characters)", room_width / 2, room_height / 2);
	var background_layer = layer_get_id("Background");
	var background_id = layer_background_get_id(background_layer);
	layer_background_sprite(background_id, SPRbackgroundSprites);
	layer_background_speed(background_id, 0);
	layer_background_index(background_id, 6);
}
else
{
	if(file_exists("listOfSaves.txt"))
	{
		load_game(global.saveGameBuffer);
		fade_text(room_width / 2 - string_width("Game Loaded!"), room_height / 2 - string_height("Game Loaded!"), "Game Loaded!")
	}
	else
	{
		show_debug_message("No saves found, returning to main menu");
		room_goto(RMmainMenu);
	}
}




//draw_sprite(SPRtextBox, 0, /*(room_width / 2) - sprite_get_width(SPRtextBox)*/x, /*(room_height / 2)- sprite_get_height(SPRtextBox)*/y);
//Draw text
