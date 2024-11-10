/// @description This is the menu that shows up when you first start the game!

// The main submenu
option[0,0] = {text:"Start",type:"standard"};
option[0,1] = {text:"Load Game", type:"standard"};
option[0,2] = {text:"Options", type:"standard"};
option[0,3] = {text:"Quit", type:"standard"};

// Options Submenu
option[1,0] = {text:"Master Volume", type:"slider"};
option[1,1] = {text:"Music Volume", type:"slider"};
option[1,2] = {text:"SFX Volume", type:"slider"};
option[1,3] = {text:"Back", type:"standard"};

// For Loading Save Files
option[2,0] = {text: "Save File 1", type:"standard"};
option[2,1] = {text: "Save File 2", type:"standard"};
option[2,2] = {text: "Save File 3", type:"standard"};
option[2,3] = {text: "Back", type:"standard"};

menu_pos = 0; // Which menu are we accessing?
option_pos = -1; // Which option have we selected on the menu (if applicable)?

// Struct which holds variables that determine whether certain sliders should get drawn or not.
sliders = {
	volume: false,	
}

accept_key = false;

alpha = global.textbox.alpha;

depth = -15001;