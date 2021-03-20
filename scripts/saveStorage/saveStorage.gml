function saveStorage() {
	if(file_exists("listOfSaves.txt"))
	{
		file_delete("listOfSaves.txt");
	}
	//var index = 0;
	var i = 0;
	var openFile = file_text_open_write("listOfSaves.txt");

	//var _buffer = 0;

	file_text_write_string(openFile, global.numSaves);
	file_text_writeln(openFile);

	for(i = 0; i < array_length(global.savedGames); i++)
	{
			file_text_write_string(openFile, global.savedGames[i]);
			if( i < array_length(global.savedGames) - 1)
			{
				file_text_writeln(openFile);
			}
	}


	file_text_close(openFile);


}
