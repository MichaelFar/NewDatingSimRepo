// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function text_log()
{
	var _spriteIndex = asset_get_index("SPRlogBox");
	var _spriteWidth = sprite_get_width(_spriteIndex);
	var _spriteHeight = sprite_get_height(_spriteIndex);
	var _x = room_width / 2;
	var _y = 1;
	var _logBoxID = 0;
	arrayOfLogs[0] = 0;
	var j = 0;
	instance_create_depth(0,0,50, oDarkBackground);
	
	for(var i = 0; i < global.textHistoryTracker; i++)
	{
		show_debug_message(" Y location of logBox is " + string(_y));
		
		_logBoxID = create_LogBox(_x, _y + (_spriteHeight * i), i);
		arrayOfLogs[i] = _logBoxID;
		if(i == global.textHistoryTracker - 1 && _logBoxID.y > room_height)
		{
			while(arrayOfLogs[i].y + string_height(arrayOfLogs[i].textType) > room_height)
			{
				for(j = 0; j < i + 1; j++)
				{
					arrayOfLogs[j].y -= 50;
				}
				
				
			}
		}
	}
	
}