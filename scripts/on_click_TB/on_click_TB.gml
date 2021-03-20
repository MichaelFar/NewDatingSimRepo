function on_click_TB() {
	/*

	*/
	if (objectType == "TB" && !instance_exists(oShaker) && textType == text) 
	{
		index += 1;
		if (index < array_length(currentArray[global.currentBranch])) 
		{
			global.currentTBID = create_TB(currentArray, index, global.currentBranch, on_click_TB, flag);
		}
		else 
		{
			show_debug_message("Time for instructions ");
			instruction_parser(global.instructions);
		}
		if(audio_is_playing(global.currentBark))
		{
			show_debug_message("A Bark is playing");
			//instance_destroy(oMasterBarker);
			//audio_stop_sound(global.currentBark);
		}
	}
	else if(objectType == "TB" && textType != text)
	{
		instance_destroy(oShaker);
		//show_debug_message("Length of text is " + string(string_length(text)) + " and charCount is " + string(charCount));
		shouldType = false;
	}
	else if (objectType == "CH") 
	{
		instance_destroy(oChoice);
		index = 0;
	
		exclusiveHandler(flag, global.flags);
	
		if (string_pos("{", flag) != 0)
		{
			global.boolFlags[flagIndex] = true;
		}
	
		global.currentTBID = create_TB(global.branches, index + 1, currentArray, on_click_TB, flag);
	}


}
