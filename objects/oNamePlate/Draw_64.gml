/// @description Insert description here
// You can write your code in this editor
width = string_width(text);
height = string_height(text);
NineSliceBox(SlicedBox, x, y, x + width + padding + 19, y + height + padding);
draw_set_color(c_black);
draw_set_font(fnt_namePlate);
draw_text(x + padding, y + padding, text);
draw_set_color(c_white);
draw_set_font(fnt_namePlate);