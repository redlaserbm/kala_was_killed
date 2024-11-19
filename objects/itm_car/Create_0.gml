/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if !struct_exists(state, "interactions") {
	state.interactions = 0;
}	

if !struct_exists(state, "key_interactions") {
	state.key_interactions = 0;
}	
