///@description This is an object that can be interacted with.

// Determines whether or not you can interact with the object.
active = false;

// A collection of *state* variables. 
// When the game is saved, the value of these state variables is stored.
state = {};

if is_struct(obj_game.state[$ object_get_name(object_index)]) && array_length(struct_get_names(obj_game.state[$ object_get_name(object_index)])) > 0 {
	// There are already values stored for this object prior. Use those values. 
	state = obj_game.state[$ object_get_name(object_index)];
} else {
	// There are no values stored for this object. Have obj_game use the values we initialize.
	obj_game.state[$ object_get_name(object_index)] = state;
}