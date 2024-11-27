/// @description Insert description here
// You can write your code in this editor
if obj_game.state.flags.frame_solved {
	alarm[0] = obj_transition.transition_time;
}

if !obj_game.state.flags.frame_look && !obj_game.state.flags.frame_solved {
	alarm[1] = obj_transition.transition_time;
}