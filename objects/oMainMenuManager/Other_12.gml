/// @description Insert description here
// You can write your code in this editor

audio_stop_sound(intro);

global.currentMusic = audio_play_sound(part_that_loops, 1000, true);
audio_sound_gain(global.currentMusic, global.musicVolume / 100, 0);