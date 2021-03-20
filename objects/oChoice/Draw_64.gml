/// @description Insert description here
// You can write your code in this editor
stringHeight = string_height(text);
stringWidth = string_width(text);
length = (x + (stringWidth ) + padding - offset) - (x - (padding + offset));
leftSide = (room_width) - (room_width / 2) - length;
rightSide = (room_width / 2)
draw_set_font(textBoxFont);
if(leftSide < (rightSide * .7))
{
	offset = stringWidth div 3;
}
else
{
	offset = 75;
}
if(currentSprite != 0)
{
	NineSliceBox(currentSprite, x - (padding + offset), y, x + (stringWidth ) + padding - offset, y + stringHeight + padding);
}
if(!rememberClick && !isLocked)
{
	draw_text(x - ((padding / 3) + offset), y + stringHeight, /*string(_val)*/text);
}
else if(isLocked)
{
	text ="LOCKED"
	draw_text(x - ((padding / 3) + offset), y + stringHeight, /*string(_val)*/text);
}