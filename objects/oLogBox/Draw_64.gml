/// @description Insert description here
// 

var lineDistance = 40;

draw_set_font(fnt_namePlate);
draw_set_color(c_white);
if(shouldType)
{
	charCount += typeSpeed;
	textType = string_copy(text, 1, charCount);
}
else
{
	textType = text;
	if(hasName)// && !createdName)
	{
		textType = name + "         " + text;
		//createdName = true;
		show_debug_message("Name in logbox should be " + name);
	}
}

//draw_rectangle(room_width / 2, room_height / 2, x + boxWidth, y + boxHeight, 1);
/*
draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05), y - (stringHeight), textType, lineDistance, boxWidth - 100);
draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05), y - (stringHeight), textType, lineDistance, boxWidth - 100);
draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05), y - (stringHeight), textType, lineDistance, boxWidth - 100);
draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05), y - (stringHeight), textType, lineDistance, boxWidth - 100);
*/
var nameHeight = string_height(name);
var stringHeight = string_height(textType);
var stringWidth = string_width(textType);
draw_text_ext(10, y, textType, lineDistance, boxWidth - 100);
draw_text_ext(10, y, textType, lineDistance, boxWidth - 100);
draw_text_ext(10, y, textType, lineDistance, boxWidth - 100);
draw_text_ext(10, y, textType, lineDistance, boxWidth - 100);
