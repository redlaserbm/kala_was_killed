/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if !struct_exists(state, "context") {
	state.context = "first_view";
}
depth = obj_itemizer.depth + 1;
active_timer = 0;