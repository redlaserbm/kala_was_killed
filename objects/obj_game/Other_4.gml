/// @description Insert description here
// You can write your code in this editor

// This object spawns multiple other important objects essential to the game.
// The reason for having separate objects over containing everything in obj_game is code cleanliness purposes
if (room != rm_main_menu) {
	scr_obj_init();
}

if room == rm_main_menu {
	instance_create_depth(0,0,-1, obj_main_menu);	
}

if (room == rm_elevator) && !state.flags.elevator_started {
	state.flags.elevator_started = true;
	scr_textbox_create("scenario");
}

if (room = rm_slider) {
	instance_create_depth(100,100,0, obj_slider, {variable_name: "volume", struct_name: global.settings});	
}