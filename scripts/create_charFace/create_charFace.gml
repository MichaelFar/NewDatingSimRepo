// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_charFace(_x, _y, _faceID)
{
	var _face = instance_create_depth(_x, _y, -50, oCharFace);

	with (_face)
	{
		sprite_index = _faceID;
		faceIndex = _faceID;
		//global.currentFace = faceIndex;
		//global.currentBody = _bodyID;
	}
	
	return _face;
}