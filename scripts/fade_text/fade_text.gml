// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fade_text(_x, _y, _textToFade)
{
	instance_destroy(oFade);
	
	var _fade = instance_create_layer(_x, _y, "Text", oFade);
	
	with (_fade)
	{
		textToFade = _textToFade;
	}
}