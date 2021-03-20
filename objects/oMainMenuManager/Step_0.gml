/// @description Insert description here
// You can write your code in this editor
/*
if (keyboard_check_pressed(ord("M"))) {
	menuOpen = !menuOpen;
	
	if (menuOpen)
		event_user(0);
	else
		event_user(1);
}
*/

if (keyboard_check_pressed(vk_escape) && !instance_exists(oButton)) {
	event_user(0);	
}
else if (keyboard_check_pressed(vk_escape)){
	game_end();
}

if(!audio_is_playing(intro) && !audio_is_playing(part_that_loops))
{
	event_user(2);
	show_debug_message("The Music Shall now loop");
}