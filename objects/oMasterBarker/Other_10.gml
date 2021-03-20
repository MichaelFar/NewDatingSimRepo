/// @description Insert description here
// You can write your code in this editor
currentBark = global.currentBark;
show_debug_message("currentBark WITHIN oMasterBarker = " + audio_get_name(currentBark));
audio_play_sound(currentBark, 100 , false);
alarm[0] = audio_sound_length(currentBark);