/// @description Insert description here
// You can write your code in this editor
stringHeight = string_height(text);
stringWidth = string_width(text);

draw_set_font(fnt_namePlate);

if(currentSprite != 0)
{
	NineSliceBox(currentSprite, x, y, x + room_width / 6, y + (string_height_ext(text, string_height(text), 200) * 1.5))
}
if(!rememberClick && !isLocked)
{
	draw_text_ext(x + room_width / 12 - (string_width_ext(text, string_height(text), 200) / 2 ), y + 24 - (string_height(text) / 2) , text, string_height(text), 200);
}
else if(isLocked)
{
	text ="LOCKED"
	draw_text(x , y , text);
}