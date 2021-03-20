/// @description Insert description here
// You can write your code in this editor
if (string_count(chr(keyboard_key), enabledKeys) 
&& string_length(chr(keyboard_key)) == 1 
&& string_length(inputName) < 15)
{
	blink = true;
	alarm[0] = blinkSpeed;
	switch(keyboard_lastchar)
	{
		default: inputName += keyboard_lastchar; break;
	}
}

if (!keyboard_check(vk_control))
{
	switch(keyboard_key)
	{
		case vk_backspace: 
			
			inputName = string_copy(inputName, 0, string_length(inputName) - 1); 
			
		break;
		case vk_enter: 
		
		if(prompt == "What is your name? (MAX 15 characters)")
		{
			global.playerName = inputName; 
			instance_destroy(oSetName); 
			global.currentTBID = create_TB(global.branches, 1, 0, on_click_TB, ""); 
		}
		
		break;
		default: 
		
		break;
	}
}