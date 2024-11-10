/// @description Insert description here
// You can write your code in this editor

event_inherited();
scr_activate();

// Amount of time (in frames for either a fade out or fade in to occur)
transition_time = 60;
timer = 0;

if !variable_instance_exists(self, "target_room") {
	target_room = rm_main_menu;	
}