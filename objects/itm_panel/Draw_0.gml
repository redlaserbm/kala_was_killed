/// @description Insert description here
// You can write your code in this editor

// This is placeholder code for the time being, we'll edit this shortly
var _q = keyboard_check_pressed(ord("Q"));
accept_key = mouse_check_button_pressed(mb_left);

exit_panel = function() {
	state.panel_visits += 1;
	scr_deactivate();
		
	if (state.panel_visits == 1) {
		scr_textbox_create("elevator_panel_first_visit");
	} else if (state.panel_visits == 2) {
		scr_textbox_create("elevator_panel_second_visit");	
	}
	
}

if active {
	option_pos = -1;
	
	// Draw the panel 
	draw_sprite(spr_panel_back,0,190,0);
	
	// If necessary, form the buttons to the panel
	// We are going to cheese the code by only checking if *any* button currently exists.
	if instance_number(itm_button) < 1 {
		// Form the buttons
		for (var _i = 0; _i < rows; _i++) {
			for (var _j = 0; _j < columns; _j++) {
				var _x = offset_x + border_x + (_j/(columns-1))*(layout_width - button_width);	
				var _y = offset_y + border_y + (_i/(rows-1))*(layout_height - button_height);
			
				var _numeral = 2*_i + _j+1;
				if _numeral == 10 {
					_numeral = 0;	
				}
				instance_create_depth(_x,_y, -1, itm_button, {numeral: _numeral});
			}
		}
	}
	
	// Draw text prompts next to the panel corresponding to entering your input and also backing out of the input...
	var _x = offset_x + panel_width + options_spacing;
	var _y = 480;
	var _options = [{text: "Accept", type:"standard"}, {text:"Back", type:"standard"}];
	scr_draw_options(_x, _y,_options, "bottom_left");
	
	// Code for interpreting clicking on the "Accept" or "Back" keys
	if option_pos == 0 {
		// If we click on "Accapt"
		var _input_correct = true;
		
		for (var _i = 0; _i < 10; _i++) {
			var _idx = "b" + string(_i);
			if (_i == 1) || (_i == 5) || (_i == 6) || (_i == 8) {
				if state[$ _idx] != 1 {
					_input_correct = false;
					break;
				}
			} else {
				if state[$ _idx] != 0 {
					_input_correct = false;
					break;
				}
			}
		}
		
		if _input_correct {
			// We solved the puzzle!	
			audio_play_sound(snd_success, 1, false, 0.10);
			
			var _hash = variable_get_hash("elevator_complete");
			struct_set_from_hash(obj_game.state.flags, _hash, true);
			
			_hash = variable_get_hash("elevator_rumble");
			struct_set_from_hash(obj_game.state.flags, _hash, true);
			
			scr_deactivate();
			scr_textbox_create("elevator_solved");
		} else {
			// We didn't solve the puzzle! :(
			exit_panel();
			audio_play_sound(snd_failure, 1, false, 0.10);
		}
		
	} else if option_pos == 1 {
		// If we click on "Back"
		exit_panel();
	}
}