///@description This is an object that can be interacted with.

// A collection of *state* variables. 
// When the game is saved, the value of these state variables is stored.
state = {};

// Determines whether or not you can interact with the object.
state.active = false;

// Records the previous active object at the time the object was made active
state.previous_active = noone;

// Determines if an inactive item should still display its interface
state.standby = false;

if is_struct(obj_game.state[$ object_get_name(object_index)]) && array_length(struct_get_names(obj_game.state[$ object_get_name(object_index)])) > 0 {
	// There are already values stored for this object prior. Use those values. 
	state = obj_game.state[$ object_get_name(object_index)];
} else {
	// There are no values stored for this object. Have obj_game use the values we initialize.
	obj_game.state[$ object_get_name(object_index)] = state;
}



special_activate = function () {
	
}

special_deactivate = function () {
	
}