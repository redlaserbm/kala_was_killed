/// @description Insert description here
// You can write your code in this editor

var _struct = obj_game.state;

var _name = object_get_name(itm_frame);

var _digital = function(_val) {
	if _val > 0 {
		return 1;	
	} else {
		return 0;	
	}
}

draw_sprite(spr_frame_top, _digital(_struct[$ _name].config[0]), 0, 0);
draw_sprite(spr_frame_middle, _digital(_struct[$ _name].config[1]), 0, 0);
draw_sprite(spr_frame_bottom, _digital(_struct[$ _name].config[2]), 0, 0);

draw_sprite(spr_frame_temmie, 0, 0, 0);

if (_struct[$ _name].config[0] + _struct[$ _name].config[1] + _struct[$ _name].config[2] <= 0) && !obj_game.state.flags.frame_solved {
	scr_textbox_create("frame_solved");	
	obj_game.state.flags.frame_solved = true;
}
