/// @description Insert description here
// You can write your code in this editor

// Find the most recent background in the textbox and transition towards it, if necessary
event_inherited();

if !force_destroy {
	var _i = array_length(bg) - 1
	while bg[_i] == noone {
		_i -= 1;
		if _i < 0 {
			break;	
		}
	}
	if _i > 0 {
		obj_game.bg_new = bg[_i];	
	}

	// Find the most recent background and transition to that if necessary
	var _i = array_length(bg) - 1
	while sound[_i] == noone {
		_i -= 1;
		if _i < 0 {
			break;	
		}
	}
	if _i > 0 {
		obj_game.bg_music_new = sound[_i];	
	}

	if option_link_id[0] == noone {
		// No, it didn't. Destroy the textbox.
		for (var _i = 0; _i < array_length(end_action); _i++) {
			end_action[_i]();
		}
	} else {	
		for (var _i = 0; _i < array_length(end_action); _i++) {
			end_action[_i]();
		}
	
		if option_link_id[option_pos] != "close_dialogue" {
			scr_textbox_create(option_link_id[option_pos]);
		}
	}
}











