/// @description Insert description here
// You can write your code in this editor
accept_key = mouse_check_button_pressed(mb_left);

scr_draw_options(620, 460,option[menu_pos], "bottom_right");

sliders.volume = false;
switch (menu_pos) {
	case 0:
		switch (option_pos) {
			case 0:
				room_goto(rm_elevator);
				instance_destroy();
				break;
			
			case 1:
				scr_game_load();
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
}