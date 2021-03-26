/// @description Insert description here
// You can write your code in this editor
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _mousePress = mouse_check_button_pressed(mb_left);
var _hover = point_in_rectangle(_mouseX, _mouseY,x, y, x + room_width / 6, y + (string_height_ext(text, string_height(text), 200) * 1.5))

if (_hover && _mousePress && !rememberClick && !isLocked)
{
    //Text Box has been clicked
	click = !click;
	rememberClick = true;
}

if (click && script >= 0) 
{
	click = !click;
	script_execute(script);	
}