/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor


var _length = string_width(inputName);
var _height = string_height(inputName);
var x_modifier = (_length) / 2;// + 40;
var y_modifier = (height / 10);
//draw_self();
draw_set_color(c_white);
draw_set_font(fnt_prompt);

draw_text(x_position - (string_width(prompt) / 2), y_position - (3 * baseHeight), prompt);

draw_set_color(c_white);
draw_set_font(textBoxFont);
draw_text(x_position - x_modifier , y_position - (y_modifier + 2 * _height), inputName);

if(blink)
{
	draw_line(x_position + _length - x_modifier, y_position - (y_modifier + 2 * _height), x_position + _length - x_modifier, y_position - (y_modifier + 2 * _height) + _height);
}