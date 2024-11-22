/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if !variable_struct_exists(state, "config") {
	state.config = [1,0,1];
}

if !variable_struct_exists(state, "interactions") {
	state.interactions = 0;	
}