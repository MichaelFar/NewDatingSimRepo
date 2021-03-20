/// @description Insert description here
// You can write your code in this editor
inputName ="";
enabledKeys = "ABCDEFGHIJKLMNOPQRSTUVWXYZ 1234567890";
blink = true;
blinkSpeed = 15;
prompt = "";
width = sprite_width;
height = sprite_height;
x_position = sprite_get_xoffset(sprite_index);
y_position = sprite_get_yoffset(sprite_index);

alarm[0] = blinkSpeed;
show_debug_message("Current x_position in setname is " + string(x)); 
show_debug_message("Current y_position in setname is " + string(y))