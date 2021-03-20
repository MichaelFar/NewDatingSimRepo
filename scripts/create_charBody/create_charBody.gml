function create_charBody(_x, _y, _bodyID, _faceID) 
{
	instance_destroy(oCharBody);
	instance_destroy(oCharFace);
	//global.currentBody = -1;
	//global.currentFace = -1;
	var _charID = instance_create_layer(_x, _y, "Instances", oCharBody);

	with (_charID)
	{
		sprite_index = _bodyID;
		faceIndex = _faceID;
		global.currentFace = faceIndex;
		global.currentBody = _bodyID;
	}
	
	return _charID;


}
