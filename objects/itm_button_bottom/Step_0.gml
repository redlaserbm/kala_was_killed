/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
state.standby = false;

var _struct = obj_game.state;

var _name = object_get_name(itm_frame);

if state.active {
	_struct[$ _name].config[2] = (_struct[$ _name].config[2] + 1) % 3;
	state.active = false;
}		