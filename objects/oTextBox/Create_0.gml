/// @description Insert description here
// You can write your code in this editor
text = "I hate mondays ";
objectType = "TB";
index = 0;
k = 0;
click = false;
currentArray = 0;
name = 0;
hasName = false;
boxWidth = sprite_width;
boxHeight = sprite_height;
hover = 0;
textType = "";
charCount = 0;
typeSpeed = global.textSpeed;
script = -1;
_nameCount = 0;
createdName = false;
flag = 0;
x_textName =  sprite_get_xoffset(sprite_index);
y_textName = sprite_get_yoffset(sprite_index);
x_namePlate = x - (x_textName);
y_namePlate = y - y_textName;
shouldType = true;
global.namePlateX = x_namePlate;
global.namePlateY = y_namePlate;
global.currentFlag = flag;