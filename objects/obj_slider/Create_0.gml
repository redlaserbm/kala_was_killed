/// @description Insert description here

// Sliders are objects which can be clicked-and-dragged to influence variables throughout the game
// The most obvious use is for options menus, but I've also tried to build this as general as possible
// to accomodate for more creative applications....

mx_old = mouse_x;
my_old = mouse_y;

mx = mouse_x;
my = mouse_y;

drag = false; //Determines whether the object will move with the mouse's movement or not.
drag_sensitivity = 0.5;



if !(variable_instance_exists(id,"speaker_variable")) {
	// The "speaker" variable is the variable that the slider will modify
	speaker_struct = global.settings;
	speaker_variable = "volume";
	
	limit_x = [50,100];
	
	// The "listener" variable is what the slider uses to determine if it should be on screen or not.
	creator = instance_find(obj_menu,1).id;
	creator_menu_pos = 2;
}

// Set the slider's x-position depending on the value of the speaker variable
var _val = struct_get_from_hash(speaker_struct, variable_get_hash(speaker_variable));
x = limit_x[0] + _val*(limit_x[1] - limit_x[0]);