function get_meta() {

	var _metaString = "";

	for(var i = 2; i < array_length(global.metaData[global.currentBranch]); i++)
	{
		_metaString += global.metaData[global.currentBranch][i];
	}
	_metaString = string_replace(_metaString, "Group:", "");
	_metaString = string_replace(_metaString, "???", "Zero");
	_metaString = string_replace(_metaString, ":", "");


	return _metaString;


}
