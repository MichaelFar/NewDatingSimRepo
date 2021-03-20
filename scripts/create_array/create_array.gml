// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_array(){
///array(*args);
	var arr;
	for (var i = 0; i < argument_count; i++)
	{
	    arr[i] = argument[i];
	}
	return arr;
}