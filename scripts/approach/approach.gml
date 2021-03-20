// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function approach(_start, _end, _shift) {
	if(_start < _end)
	{
		return min(_start + _shift, _end); 
	}
	else
	{
	    return max(_start - _shift, _end);
	}
}