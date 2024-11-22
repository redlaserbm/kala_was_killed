/// @description Insert description here
// You can write your code in this editor

var _subimgs = [0,0,0];

x = 160;
y = 220;

for (var _i = 0; _i < array_length(state.config); _i++) {
	if state.config[_i] == 0 {
		_subimgs[_i] = 0;
	} else {
		_subimgs[_i] = 1;
	}
}

draw_sprite(spr_door_segment, _subimgs[0], 160, 220);
draw_sprite(spr_door_segment, _subimgs[1], 160, 280);
draw_sprite(spr_door_segment, _subimgs[2], 160, 340);

var _puzzle_solved = function() {
	var _solved = true;
	for (var _i = 0; _i < array_length(state.config); _i++) {
		if state.config[_i] != 0 {
			_solved = false;
			break;
		}
	}
	return _solved;
}

state.standby = false;
if state.active {
	if _puzzle_solved() {
		scr_textbox_create("solved");
	} else {
		if (state.interactions < 1) || !variable_struct_exists(obj_game.state, "itm_control") || (obj_game.state[$ "itm_control"].interactions < 1) {
			scr_textbox_create("secret_passage");
		} else {
			scr_textbox_create("unsolved");	
		}
	}
	state.interactions += 1;
}