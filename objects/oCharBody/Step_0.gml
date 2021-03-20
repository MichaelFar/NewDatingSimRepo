/// @description Insert description here
// You can write your code in this editor
if(global.currentFace != -1 && !hasCreatedFace)
{
	show_debug_message("A face should be created now");
	create_charFace(x, y, global.currentFace);
	hasCreatedFace = true;
}