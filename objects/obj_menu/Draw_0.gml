/// @description Insert description here
// You can write your code in this editor

accept_key = mouse_check_button_pressed(mb_left) && (obj_game.current_state != 1);

var _xval = 0;
var _yval = 0;

scr_draw_options(_xval, _yval, option[menu_pos]);
	
switch (menu_pos) {
	case 0:
		switch (option_pos) {
			case 0:
				menu_pos = 1;
				option_pos = -1;
				break;
		}
		break;
	
	case 1:
		switch (option_pos) {
			case 0:
				menu_pos = 4;
				option_pos = -1;
				with (obj_inventory) {
					scr_activate();
				}
				break;
			case 1:
				menu_pos = 4;
				option_pos = -1;
				with (obj_logger) {
					scr_activate();
				}
				break;
			case 2:
				menu_pos = 2;
				option_pos = -1;
				break;
			case 3:
				menu_pos = 0;
				option_pos = -1;
				break;
		}	
		break;
	
	// For Saving/Loading or accessing more settings
	case 2:
		switch (option_pos) {
			case 0:
				scr_game_save();
				menu_pos = 0;
				option_pos = -1;
				break;
			case 1:
				scr_game_load();
				menu_pos = 0;
				option_pos = -1;
				break;
			case 2:
				menu_pos = 3;
				option_pos = -1;
				break;
			case 3:
				menu_pos = 1;
				option_pos = -1;
				break;
		}
		break;
	
	// The options menu (for SFX)
	case 3:
		switch (option_pos) {
			case 3:
				menu_pos = 2;
				option_pos = -1;
				break;
		}
		break;
	
	// Menu that shows when we open the logger or the inventory
	case 4:
		switch (option_pos) {
			case 0:
				menu_pos = 0;
				option_pos = -1;
				obj_logger.active = false;
				obj_inventory.active = false;
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
// draw_text(150,0,instance_number(obj_slider));