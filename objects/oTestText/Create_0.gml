/// @description Insert description here
// You can write your code in this editor
text = "B/Garfield is beset by many attackers/B, B/Jon/B cowers in fear as B/Nermal/B raises his arm to deal the final blowB/Garfield is beset by many attackers/B, B/Jon/B cowers in fear as B/Nermal/B raises his arm to deal the final blowB/Garfield is beset by many attackers/B, B/Jon/B cowers in fear as B/Nermal/B raises his arm to deal the final blowB/Garfield is beset by many attackers/B, B/Jon/B cowers in fear as B/Nermal/B raises his arm to deal the final blowB/Garfield is beset by many attackers/B, B/Jon/B cowers in fear as B/Nermal/B raises his arm to deal the final blowB/Garfield is beset by many attackers/B, B/Jon/B cowers in fear as B/Nermal/B raises his arm to deal the final blowB/Garfield is beset by many attackers/B, B/Jon/B cowers in fear as B/Nermal/B raises his arm to deal the final blowB/Garfield is beset by many attackers/B, B/Jon/B cowers in fear as B/Nermal/B raises his arm to deal the final blow"
extModifier = 30;
boldPos[0] = "";
var _buffer = "";

boldWord[0] = "";

k = 0;
numBold = string_count("/B", text);
show_debug_message("Number of bold words should be 2 but is " + string(string_count("/B", text)));
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
