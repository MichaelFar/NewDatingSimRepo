/// @description Insert description here
// 
var nameHeight = string_height(name);
var stringHeight = string_height(textType);
var lineDistance = 40;
var _buffer = "";
draw_self();
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
}
//draw_rectangle(room_width / 2, room_height / 2, x + boxWidth, y + boxHeight, 1);
draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05), y - (stringHeight), textType, lineDistance, boxWidth - 100);
draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05), y - (stringHeight), textType, lineDistance, boxWidth - 100);
draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05), y - (stringHeight), textType, lineDistance, boxWidth - 100);
draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05), y - (stringHeight), textType, lineDistance, boxWidth - 100);
//draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05), y - (stringHeight), "what the goddamn fuck game maker", lineDistance, boxWidth - 100);


if(hasBold == false)
{
	numBold = string_count("/B", text);
	if(numBold != 0)
	{
		for(var i = 0; i < numBold; i++)
		{
				show_debug_message("This loop has run " + string(i + 1) + " times");
				_buffer = string_delete(text, string_pos("/B", text), string_length(text));
			
				_buffer = string_delete(_buffer, 1, string_pos("B/", text) + 1); //Find the bold word
			
				boldWord[i] = _buffer;//Set the bold word
				_buffer = string_delete(text, 1, string_pos("B/" + boldWord[i] +"/B", text) + 1)
				show_debug_message("_buffer after targeting Bold is " + _buffer);
				_buffer = string_replace(text, _buffer, "");
				_buffer = string_replace(_buffer, "B/", "");
				text = string_replace(text, "/B", "");
				text = string_replace(text, "B/", "");
				_buffer += string_char_at(boldWord[i], 1);
				boldPos[i] = string_width_ext(_buffer, string_height(text), string_width(text) - extModifier)
				boldPos[i] -= string_width(string_char_at(boldWord[i], 1));
				show_debug_message("_buffer after fetching first half is " + _buffer);
			
			
				show_debug_message("Found bolded word " + boldWord[i]);
			
				show_debug_message("Pos of word that should be bolded is " + string(boldPos[i]));
			
		}
		hasBold = true;
	}
}
if(hasBold && textType == text)
{
	for(k = 0; k < numBold; k++)
	{
		show_debug_message("I am looping");
		draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05)  + boldPos[b] + 2, y - (stringHeight), boldWord[b], lineDistance, boxWidth - 100);
		draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05)  + boldPos[b] + 2, y - (stringHeight), boldWord[b], lineDistance, boxWidth - 100);
		draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05)  + boldPos[b] + 2, y - (stringHeight), boldWord[b], lineDistance, boxWidth - 100);
		draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05)  + boldPos[b] + 2, y - (stringHeight), boldWord[b], lineDistance, boxWidth - 100);
		draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05)  + boldPos[b] + 2, y - (stringHeight), boldWord[b], lineDistance, boxWidth - 100);
		draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05)  + boldPos[b] + 2, y - (stringHeight), boldWord[b], lineDistance, boxWidth - 100);
		draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05)  + boldPos[b] + 2, y - (stringHeight), boldWord[b], lineDistance, boxWidth - 100);
		draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05)  + boldPos[b] + 2, y - (stringHeight), boldWord[b], lineDistance, boxWidth - 100);
		draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05)  + boldPos[b] + 2, y - (stringHeight), boldWord[b], lineDistance, boxWidth - 100);
		draw_text_ext(x - (boxWidth * .5) + (boxWidth * .05)  + boldPos[b] + 2, y - (stringHeight), boldWord[b], lineDistance, boxWidth - 100);
		
		
		
	}
}
