/// @description Insert description here
// You can write your code in this editor
state.standby = false;

var _struct = obj_game.state;

var _name = object_get_name(itm_frame);

if state.active {
	_struct[$ _name].config[1] = (_struct[$ _name].config[1] + 2) % 3;
	_struct[$ _name].config[2] = (_struct[$ _name].config[2] + 2) % 3;
	state.active = false;
}		