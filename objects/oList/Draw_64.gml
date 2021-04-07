/// @description Insert description here
// You can write your code in this editor
var i = 0;
draw_set_font(textBoxFont);
draw_set_color(c_gray);
//draw_roundrect(x, y, x + width, y + height, 0);
NineSliceBox(SlicedBox, x, y, x + width, y + height);
draw_set_color(-1);

var _size = ds_list_size(list);

for (i = 0; i < _size; i++)
{
	var _arr = list[| i];
	var	_name = _arr[PR.NAME];
	var	_sel = _arr[PR.SELECTED];
	var	_vals = _arr[PR.VALUES];
	height = string_height(_name) + padding + itemH * i;
	
	var	_x = x + padding;
	var	_y = y + padding + itemH * i;

	
	if(i != hoverID)
	{ 
		if(type != LIST_TYPE.CHOICE_MENU)
		{
			draw_set_color(c_black);
			
		}
		else if(global.masterClickTracker[i])
		{
			draw_set_color(c_green);
		}
		else
		{
			draw_set_color(c_black);
		}	
	}
	
	if(_name == "~~~~~~LOCKED~~~~~~")
	{
		draw_set_color(c_red);
	}
	if(_name == "ARE YOU SURE?" || _name == "ARE YOU SURE YOU WISH TO OVERRIDE THIS SAVE?" || _name == "LOAD THIS SAVE?")
	{
		draw_set_color(c_black);
	}
	if(draw_get_color() == c_green)
	{
		draw_set_color(c_green);
	}
	if(string_pos(".txt", _name) != 0)
	{
		_name = string_replace(_name, ".txt", "");
		draw_text(_x, _y, _name);
	}
	
		draw_text(_x, _y, _name);
	
	if (_sel > -1)
	{
		if(i < array_length(global.currentSettings) && type == LIST_TYPE.SETTINGS)
		{ 
			show_debug_message("currentSettings is " + string(global.currentSettings[i]));
			var _val = _vals[global.currentSettings[i]];
			
		}
		else
		{
			if(_name == "Text Speed")
			{
				_sel = 0;
				show_debug_message("_sel is now " + string(_sel));
			}
			var _val = _vals[_sel];
		}
		draw_set_halign(fa_right);
		if(type == LIST_TYPE.SETTINGS)
		{
			if(_name != "Text Speed" && _name != "Fullscreen")
			{
				draw_text(x + width - padding, _y, string(_val) + "%");
			}
			else
			{
				if(_name == "Fullscreen")
				{
					if(_val)
					{
						draw_text(x + width - padding, _y, "Yes");
					}
					else
					{
						draw_text(x + width - padding, _y, "No");
					}
				}
				else
				{
					draw_text(x + width - padding, _y, string(_val));
				}
			}
		}
		else
		{
			
			draw_text(x + width - padding, _y, _val);
		}
		draw_set_halign(fa_left);
	}
	
	draw_set_color(c_white);
}
