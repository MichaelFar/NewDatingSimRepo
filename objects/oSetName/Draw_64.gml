/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor


var _length = string_width(inputName);
var _height = string_height(inputName);
x_modifier = (_length / 2) + 40;
y_modifier = (height / 10);
draw_self();
draw_set_color(c_blue);
draw_set_font(fnt_prompt);

draw_text(x_position - (width / 2) + 20, y_position - (height / 2) + 20, prompt);

draw_set_color(c_white);
draw_set_font(textBoxFont);
draw_text(x_position - x_modifier, y_position - y_modifier, inputName);

if(blink)
{
	draw_line(x_position + _length - x_modifier, y_position - y_modifier , x_position + _length - x_modifier, y_position + _height - y_modifier);
}