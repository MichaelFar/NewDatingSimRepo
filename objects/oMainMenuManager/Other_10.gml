/// @description Create the main menu
// You can write your code in this editor
var _width = 300;
var _height = 100;

create_button((room_width / 2) - (_width / 2), (room_height / 5), _width, _height, "New Game", on_click);

create_button((room_width / 2) - (_width / 2), (room_height / 5) + _height + 40, _width, _height, "Load Save", on_click);

create_button((room_width / 2) - (_width / 2), (room_height / 5) + (_height + 40) * 2, _width, _height, "Options", on_click);

create_button((room_width / 2) - (_width / 2), (room_height / 5) + (_height + 40) * 3, _width, _height, "Quit", on_click);




//instance_destroy(oSaveLoad);

//instance_destroy(oOptions);

instance_destroy(oList);