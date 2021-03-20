/// @description Insert description here
// You can write your code in this editor
    if(position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_space))
    {
        //Text Box has been clicked
		click = !click;
    }

	if(click && script >= 0)
	{
	click = !click;
	script_execute(script);	
	}
	
	if(hasName && !createdName) 
	{
		create_namePlate(name, x_namePlate, y_namePlate);
		show_debug_message("There are " + string(_nameCount) + " name plates");
		//_nameCount++;
		createdName = true;
	}
	else if(!hasName)
	{
		instance_destroy(oNamePlate);
	}
