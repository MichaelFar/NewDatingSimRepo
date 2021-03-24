/// @description Insert description here
// You can write your code in this editor
text = "THIS IS TEXT THIS IS TEXT  THIS IS TEXT  THIS IS TEXT  THIS IS TEXT  THIS IS TEXT  THIS IS TEXT  THIS IS TEXT  THIS IS TEXT  THIS IS TEXT  THIS IS TEXT  THIS IS TEXT  THIS IS TEXT  THIS IS TEXT  THIS IS TEXT  THIS IS TEXT  "

boldPos = "";
var _buffer = "";
var _EX = "";
boldWord = "";
testSub = 0;
if(string_pos("B/", text))
{
			_buffer = string_delete(text, string_pos("/B", text), string_length(text));
			
			_buffer = string_delete(_buffer, 1, string_pos("B/", text) + 1); //Find the bold word
			
			boldWord = _buffer;//Set the bold word
			_buffer = string_delete(text, 1, string_pos("B/" + boldWord +"/B", text))
			_buffer = string_replace(text, _buffer, "");
			boldPos = string_width_ext(_buffer, string_height(text), string_width(text) - 100)
			show_debug_message("_buffer after fetching first half is " + _buffer);
			//boldPos = string_pos(_buffer + "/B", text)
			//boldPos -= string_length(_buffer);
			
			//show_debug_message("_EX after first replace is " + _EX);
			text = string_replace(text, "/B", "");
			text = string_replace(text, "B/", "");
			show_debug_message("Found bolded word " + boldWord);
			
			show_debug_message("Pos of word that should be bolded is " + string(boldPos));
			//boldWord = _buffer;
}
testSub = string_width(boldWord);