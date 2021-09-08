/// @description Insert description here
// You can write your code in this editor
global.boxX = (room_width * .5);
global.boxY = (room_height * .75);
audio_stop_all();
index = 0;
metaString = "";
audio_group_load(LilaBarks);
global.branches = 0;//All branches of dialogue player can access
global.currentBranch = 0;//where the player is within the branches
global.instructions = 0;//instructions written at the end of each text file
global.metaData = 0;
global.LockAndKeys = 0;
global.flags = 0;//flags that player triggers to cause something else to happen
global.flags[0] = 0;
global.names = 0;//names of characters that appear when they speak
global.newFlagIndex = 0;//the index of where dialogue should resume if given a replacement flag
global.playerFlagCounter = 0;//amount of player flags triggered
global.boolFlags = 0;
global.playerName = "";
global.currentTBID = 0;
global.saveFileContents = 0;
global.currentFlag = 0;
global.charWithSprites = 0;
global.backGrounds = 0;
global.currentBackground = 0;
global.keys = 0;
global.keys[0] = "";
global.keyCount = 0;
global.currentBark = -1;
global.currentBody = -1;
global.currentFace = -1;
global.inLog = false;
global.textHistory[0] = 0;
global.textHistoryTracker = 0;
global.canScrollUp = true;
global.canScrollDown = true;
global.shouldLog = true;


event_user(0);