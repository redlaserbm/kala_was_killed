/// @description Insert description here
// You can write your code in this editor
accept_key = mouse_check_button_pressed(mb_left);

// The submenu dedicated to loading save files will have different text depending on whether
// a save file exists in the slot or not.
for (var _i = 0; _i < 3; _i++) {
	// Determine if there is a save file in slot _i	
	var _filename = "savedata_" +  string(_i) + ".sav";
	if file_exists(_filename) {
		option[2,_i].text = "Save File " + string(_i+1);	
	} else {
		option[2,_i].text = "No Data";	
	}
}

scr_draw_options(620, 460,option[menu_pos], "bottom_right");

sliders.volume = false;
switch (menu_pos) {
	case 0:
		switch (option_pos) {
			case 0:
				room_goto(rm_road);
				instance_destroy();
				break;
			
			case 1:
				menu_pos = 2;
				option_pos = -1;
				break;
				
			case 2:
				menu_pos = 1;
				option_pos = -1;
				break;
				
			case 3:
				game_end();
				break;
		}
		break;
	
	case 1:
		sliders.volume = true;
		switch (option_pos) {
			case 3:
				menu_pos = 0;
				option_pos = -1;
				break;
		}
		break;
		
	case 2:
		if (option_pos >= 0) && (option_pos < 3) {
			scr_game_load(option_pos);	
			option_pos = -1;
		} else if (option_pos == 3) {
			menu_pos = 0;
			option_pos = -1;
		}
		break;
}


// Redundant since this object is not persistent
//if room != rm_main_menu {
//	instance_destroy();
//}