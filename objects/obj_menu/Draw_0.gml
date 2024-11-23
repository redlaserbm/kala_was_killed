/// @description Insert description here
// You can write your code in this editor

accept_key = mouse_check_button_pressed(mb_left) && (obj_game.current_state != 1);

var _xval = 0;
var _yval = 0;
 
scr_draw_options(_xval, _yval, option[menu_pos]);
// draw_text(150,0,option_pos);

switch_menu_pos = function(_pos) {
	menu_pos = _pos;
	option_pos = -1; 
}

switch (menu_pos) {
	case 0:
		switch (option_pos) {
			case 0:
				switch_menu_pos(1);
				break;
		}
		break;
	
	case 1:
		switch (option_pos) {
			case 0:
				switch_menu_pos(4);
				with (obj_inventory) {
					scr_activate();
				}
				break;
			case 1:
				switch_menu_pos(4);
				with (obj_logger) {
					scr_activate();
				}
				break;
			case 2:
				switch_menu_pos(2);
				break;
			case 3:
				switch_menu_pos(7);
				break;
			case 4:
				switch_menu_pos(0);
				break;
		}	
		break;
	
	// For Saving/Loading or accessing more settings
	case 2:
		switch (option_pos) {
			case 0:
				// Access menu for saving games
				switch_menu_pos(5);
				break;
			case 1:
				// Access menu for loading save files
				switch_menu_pos(6);
				break;
			case 2:
				switch_menu_pos(3);
				break;
			case 3:
				switch_menu_pos(1);
				break;
		}
		break;
	
	// The options menu (for SFX)
	case 3:
		switch (option_pos) {
			case 3:
				switch_menu_pos(2);
				break;
		}
		break;
	
	// Menu that shows when we open an active item
	case 4:
		switch (option_pos) {
			case 0:
				if (instance_number(obj_inventory) > 0) && !((is_string(obj_inventory.state.detective)) && obj_inventory.state.active) && !(instance_number(itm_map) > 0 && !(itm_map.state.context_check == false)) {
					// If we click the back button while the inventory is pulled up...
					// Close the inventory!
					// If we click the back button while examining an item in the inventory...
					// Return to the inventory! Wipe any text interactions currently occurring as a consequence of examining an item.
					switch_menu_pos(0);
					for (var _i = 0; _i < instance_number(obj_interactable); _i++) {
						var _interactable = instance_find(obj_interactable, _i);
						if _interactable.state.active {
							scr_deactivate(_interactable);
							break;
						}
					}
					
					//if obj_inventory.active || obj_logger.active {
					//	switch_menu_pos(0);
					//	for (var _i = 0; _i < instance_number(obj_interactable); _i++) {
					//		var _interactable = instance_find(obj_interactable, _i);
					//		if _interactable.active {
					//			scr_deactivate();
					//		}
					//	}
					//} else {
					//	for (var _i = 0; _i < instance_number(obj_textbox); _i++) {
					//		var _textbox = instance_find(obj_textbox, _i);
					//		if _textbox.dictionary = scr_item_examination {
					//			_textbox.force_destroy = true;
					//			instance_destroy(_textbox);	
					//		}
					//	}
					//	scr_activate(obj_inventory);	
					//}
				}
				option_pos = -1;
				break;
		}
		break;
		
	case 5: 
		if (option_pos >= 0) && (option_pos < 3) {
			scr_game_save(option_pos);	
			option_pos = -1;
		} else if (option_pos == 3) {
			switch_menu_pos(2);
		}
		break;
		
	case 6:
		if (option_pos >= 0) && (option_pos < 3) {
			scr_game_load(option_pos);	
			option_pos = -1;
		} else if (option_pos == 3) {
			switch_menu_pos(2);
		}
		break;
	
	// Debug menu
	case 7:
		switch (option_pos) {
			case 0:
				scr_warp(2);
				switch_menu_pos(0);
				break;
			case 1:
				scr_warp(3);
				switch_menu_pos(0);
				break;
			case 2:
				scr_warp(4);
				switch_menu_pos(0);
				break;
			case 3:
				scr_warp(5);
				switch_menu_pos(0);
				break;
			case 4:
				switch_menu_pos(1);
				break;
		}
		break;
	
}

if menu_pos == 0 {
	collapse_timer += 1;	
} else {
	collapse_timer = 0;	
	collapse_flag = false;
}

if collapse_timer > 5 {
	collapse_flag = true;	
}


// draw_text(250,0,menu_pos);