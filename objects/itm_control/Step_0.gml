/// @description Insert description here
// You can write your code in this editor

state.standby = false;

if state.active {
	state.interactions += 1;
	instance_create_depth(0,0,obj_itemizer.depth, obj_window);
}