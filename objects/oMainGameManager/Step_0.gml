/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_escape) && !instance_exists(oList) && !instance_exists(oSetName) && !instance_exists(oLogBox)) 
{
	instance_destroy(oShaker);
	global.shouldLog = false;
	create_list((room_width / 2) - (450 / 2), room_height / 2 - (400 / 2), 450, 400, LIST_TYPE.PAUSE_MENU);
};

if(keyboard_check_released(vk_escape) && instance_exists(oLogBox))
{
	instance_destroy(oLogBox);
	instance_destroy(oNamePlate);
	instance_destroy(oDarkBackground);
	create_list((room_width / 2) - (450 / 2), room_height / 2 - (400 / 2), 450, 400, LIST_TYPE.PAUSE_MENU);
}


