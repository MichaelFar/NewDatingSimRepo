function create_list(_x, _y, _width, _height, _type) {


/*
	var _x = argument[0];
	var _y = argument[1];
	var _width = argument[2];
	var _height = argument[3];
	var _type = argument[4];
*/

	var _list = instance_create_layer(_x , _y, "Instances", oList);

	with (_list)
	{
	
		type = _type;
	
		switch (_type)
		{
			case LIST_TYPE.GAME_OPTIONS:
				ds_list_add(list, ["Players", 0, [1,2,3,4]]);
				ds_list_add(list, ["Mode", 0,[1,2]])
				ds_list_add(list, ["Difficulty", 0, ["Easy", "Medium", "Hard", "Insane"]]);
				ds_list_add(list, ["Close",-1,[]]);
			break;
		
			case LIST_TYPE.SETTINGS:
				ds_list_add(list, ["Music Volume", 10, [0, 10 , 20, 30, 40, 50, 60, 70, 80, 90, 100]])
				ds_list_add(list, ["Voice Volume", 10, [0, 10 , 20, 30, 40, 50, 60, 70, 80, 90, 100]])
				ds_list_add(list, ["Fullscreen", 1, [true, false]])
				ds_list_add(list, ["Text Speed", 4, [1, 2, 3, 4, 5]])
				ds_list_add(list, ["Apply",-1,[]]);
			break;
		
			case LIST_TYPE.PAUSE_MENU:
				ds_list_add(list, ["Resume",-1,[]])
				ds_list_add(list, ["Save",-1,[]])
				ds_list_add(list, ["Load",-1,[]])
				ds_list_add(list, ["Options",-1,[]])
				ds_list_add(list, ["Text Log",-1,[]])
				ds_list_add(list, ["Return To Main Menu Without Saving",-1,[]])
				ds_list_add(list, ["Exit Without Saving",-1,[]]);
			break;
		
			case LIST_TYPE.TEST:
				ds_list_add(list, ["Create Object",-1,[]])
				ds_list_add(list, ["Back",-1,[]])
			break;
		
			case LIST_TYPE.SAVE_MENU:
			
			break;
		
			case LIST_TYPE.LOAD_MENU:
			
			
			break;
		
			case LIST_TYPE.CHOICE_MENU:
		
		
			break;
			
			case LIST_TYPE.GROUP_CHOICE:
			
			
			break;
			
			case LIST_TYPE.ARE_YOU_SURE:
			
				ds_list_add(list, ["ARE YOU SURE?",-1,[]]);
				ds_list_add(list, ["Yes",-1,[]]);
				ds_list_add(list, ["No",-1,[]])
			
			break;
		
		
		}
	
	
		if(type == LIST_TYPE.SAVE_MENU  || type == LIST_TYPE.LOAD_MENU)
		{
			for(var i = 0; i < 16; i++)
			{
				ds_list_add(list, [global.savedGames[i],-1,[]]);
			}
			ds_list_add(list, ["Back",-1,[]]);
		}
	
	
		width = _width;
		itemH = 48;
		padding = 24;
		if(type == LIST_TYPE.SAVE_MENU || type == LIST_TYPE.LOAD_MENU)
		{
			itemH = 24;
		}
	
		if(type == LIST_TYPE.CHOICE_MENU)
		{
			for(var i = 0; i < global.totalDestinations; i++)
			{
			
				
					ds_list_add(list, [global.choiceLabels[i],-1,[]]);
			
			}
			width += 200;
			show_debug_message("The size of choiceLabels is " + string(array_length(global.choiceLabels)))
		}
		else if(type == LIST_TYPE.GROUP_CHOICE)
		{
			//global.choiceLabels = create_array("Oscar and Quinn", "Treyvon and Noah", "Jane and Michael", "Nolan and Braedin", "Bodie and Joe", "Connor and Ethan", "Anshu and Gun SCP");
			for(var i = 0; i < array_length(global.choiceLabels); i++)
			{
				ds_list_add(list, [global.choiceLabels[i],-1,[]]);
			}
			//width = string_width(global.choiceLabels[0]);
		}
		if(type == LIST_TYPE.ARE_YOU_SURE)
		{
			width = string_width("ARE YOU SURE?") + padding;
		}
	
		for(var i = 0; i < ds_list_size(list); i++)
		{
			var _arr = list[| i];
			var	_name = _arr[PR.NAME];
			height = string_height(_name) + padding + itemH * i;
		}
	}

	return _list;


}
