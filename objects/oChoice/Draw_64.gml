/// @description Insert description here
// You can write your code in this editor
stringHeight = string_height(text);
stringWidth = string_width(text);

stringHeightEXT = string_height_ext(text, stringHeight, 200);
draw_set_font(fnt_namePlate);

if(currentSprite != 0)
{
	spriteHeight = NineSliceBox(currentSprite, x, y, x + room_width / 6, y + stringHeightEXT * 1.5) * 16;
	spriteTerritory = spriteHeight + y;
	show_debug_message("The choice: " + text + " has territory of " + string(spriteTerritory));
}
if(!rememberClick && !isLocked)
{
	draw_text_ext(x + room_width / 12 - (string_width_ext(text, stringHeight, 200) / 2 ), y + 24 - (stringHeight / 2) , text, stringHeight, 200);
}
else if(isLocked)
{
	text ="LOCKED"
	draw_text(x , y , text);
}

if(array_length(arrayOfChoices) > 1)
{
	while(arrayOfChoices[array_length(arrayOfChoices) - 1].y <= arrayOfChoices[array_length(arrayOfChoices) - 2].spriteTerritory)
	{
		arrayOfChoices[array_length(arrayOfChoices) - 1].y += 32
	}
}
