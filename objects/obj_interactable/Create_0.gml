///@description This is an object that can be interacted with.

// Determines whether or not you can interact with the object.
active = false;

// A collection of *state* variables. 
// When the game is saved, the value of these state variables is stored.
state = {};

// Check obj_game.state on conception to see if there's information about this object's state
// that was already stored prior. Copy that data over here if necessary!
if is_struct(obj_game.state[$ object_get_name(object_index)]) && array_length(struct_get_names(obj_game.state[$ object_get_name(object_index)])) > 0 {
	state = variable_clone(obj_game.state[$ object_get_name(object_index)]);
}