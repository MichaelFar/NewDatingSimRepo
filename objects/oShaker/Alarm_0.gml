/// @description Insert description here
// You can write your code in this editor

//camera_set_view_pos(view_camera[0], 0, 0);
oTextBox.x = global.boxX;
oTextBox.y = global.boxY;

if(instance_exists(oNamePlate))
{
	oNamePlate.x = global.namePlateX;
	oNamePlate.y = global.namePlateY;
}

instance_destroy();