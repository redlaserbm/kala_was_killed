/// @description Insert description here
// You can write your code in this editor
var _left_click = mouse_check_button_pressed(mb_left) && (obj_menu.hover_pos < 0) && state.active;
var _hold_click = mouse_check_button(mb_left) && state.active;

var _mx = mouse_x;
var _my = mouse_y;

draw_set_font(fnt_ocr);
window_height = 2*window_border + label_height + text_border_y + string_height(text) + button_sep + button_height;

if state.active || state.standby {
	
	active_timer += 1;
	// Draw the back of the window.
	
	draw_sprite_stretched(spr_window_back, 0, offset_x, offset_y, window_width, window_height);	
	
	// Draw the window label
	draw_sprite_stretched(spr_window_top, 0, offset_x + window_border, offset_y + window_border, window_width - 2*window_border, label_height);

	// Draw the text for this window (if there is any)
	var _text_x = offset_x + 0.5*window_width - 0.5*string_width(text);
	var _text_y = offset_y + window_border + label_height + text_border_y;
	
	// Draw the main text for this window
	draw_text_ext_color(_text_x, _text_y, text, 0, 640, c_black, c_black, c_black, c_black, 1);
	
	// Draw the buttons for this window
	var _button_x = offset_x + window_border;
	var _button_y = _text_y + string_height(text) + button_sep;
	
	var _num_buttons = array_length(buttons);
	var _space = window_width - 2*window_border;
	var _button_width = (_space - (_num_buttons - 1)*button_spacing)/_num_buttons;
	
	
	for (var _i = 0; _i < _num_buttons; _i++) {
		// Whenever the button is pushed, we will show on the frame that it's clicked, a different sprite
		// This is so the player knows they clicked on the button
		var _on_button = point_in_rectangle(_mx, _my, _button_x, _button_y, _button_x + _button_width, _button_y + button_height);
		var _button_text = buttons[_i];
		var _button_text_color = c_black;
		draw_set_font(fnt_ocr_small);
		
		if _hold_click && _on_button { 
			_button_text_color = c_white;
			draw_sprite_stretched(spr_button_comp_pressed, 0, _button_x, _button_y, _button_width, button_height);	
		} else {
			draw_sprite_stretched(spr_button_comp, 0, _button_x, _button_y, _button_width, button_height);
			// Drawing the text on the button
		}	
		draw_text_color(_button_x + 0.5*_button_width - 0.5*string_width(_button_text), _button_y + 0.5*button_height - 0.5*string_height(_button_text), buttons[_i],_button_text_color,_button_text_color, _button_text_color,_button_text_color, 1);
		
		// Checking for if we've clicked the button
		if _left_click && point_in_rectangle(_mx, _my, _button_x, _button_y, _button_x + _button_width, _button_y + button_height) {
			
			state.clicks += 1;
			
			switch (_i) {
				case 0:
					obj_game.state[$ object_get_name(itm_mechanism)].config[0] = (obj_game.state[$ object_get_name(itm_mechanism)].config[0] + 1) % 3;
					obj_game.state[$ object_get_name(itm_mechanism)].config[1] = (obj_game.state[$ object_get_name(itm_mechanism)].config[1] + 1) % 3;
					obj_game.state[$ object_get_name(itm_mechanism)].config[2] = (obj_game.state[$ object_get_name(itm_mechanism)].config[2] + 1) % 3;
					break;
					
				case 1:
					obj_game.state[$ object_get_name(itm_mechanism)].config[1] = (obj_game.state[$ object_get_name(itm_mechanism)].config[1] + 2) % 3;
					obj_game.state[$ object_get_name(itm_mechanism)].config[2] = (obj_game.state[$ object_get_name(itm_mechanism)].config[2] + 2) % 3;
					break;
					
				case 2:
					obj_game.state[$ object_get_name(itm_mechanism)].config[2] = (obj_game.state[$ object_get_name(itm_mechanism)].config[2] + 1) % 3;
					break;
			}
			
			// The first time this object is clicked, we'll have Temmie react to something, so the player knows something happened
			if state.clicks == 1 {
				scr_textbox_create("comp_react");	
			}
		} else {
			//Draw the button
			
		}
		
		// Drawing the text on the button
		_button_x += _button_width + button_spacing;
	}
}

// For now, ill just make left-clicking outside of the window cause it to become inactive
if _left_click && !point_in_rectangle(_mx, _my, offset_x, offset_y, offset_x + window_width, offset_y + window_height) && active_timer > 2 {
	instance_destroy();
}