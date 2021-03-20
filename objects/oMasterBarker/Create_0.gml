/// @description Insert description here
// You can write your code in this editor


//show_debug_message("currentBark = " + audio_get_name(global.currentBark));
if(audio_is_playing(global.currentBark))
{
	audio_stop_sound(global.currentBark);
}

event_user(0);