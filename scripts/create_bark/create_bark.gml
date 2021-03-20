// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_bark(sound){

	var _bark = instance_create_layer(0, 0, "Instances", oMasterBarker)
	with(_bark)
	{
		//global.currentBark = sound;
		//show_debug_message("currentBark = " + audio_get_name(sound));
		if(audio_exists(sound))
		{
			show_debug_message("That sound exists");
		}
		else
		{
			show_debug_message("Sound does not exist");
		}
		//audio_play_sound(currentBark, 100000, 0);
	}
	return _bark;
}