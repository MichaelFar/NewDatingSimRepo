/// @description Insert description here
// You can write your code in this editor
stringHeight = string_height(text);
stringWidth = string_width(text);
/*
length = (x + (stringWidth ) + padding - offset) - (x - (padding + offset));
leftSide = (room_width) - (room_width / 2) - length;
rightSide = (room_width / 2)
*/
draw_set_font(textBoxFont);
/*
if(leftSide < (rightSide * .7))
{
	offset = stringWidth div 3;
}
else
{
	offset = 75;
}
*/
if(currentSprite != 0)
{
	//NineSliceBox(currentSprite, x - (padding + offset), y, x + (stringWidth ) + padding - offset, y + stringHeight + padding);
	NineSliceBox(currentSprite, x, y, x + room_width / 6, y + (string_height_ext(text, string_height(text), 200) * 1.5))
}
if(!rememberClick && !isLocked)
{
	draw_text_ext(x + room_width / 12 - (string_width_ext(text, string_height(text), 200) / 2 ), y + 24 - (string_height(text) / 2) , /*string(_val)*/text, string_height(text), 200);
}
else if(isLocked)
{
	text ="LOCKED"
	draw_text(x , y , /*string(_val)*/text);
}