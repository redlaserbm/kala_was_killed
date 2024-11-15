/// @description Insert description here
// You can write your code in this editor
var _left_click = mouse_check_button_pressed(mb_left) && (active_timer > 5);
var _mx = mouse_x;
var _my = mouse_y;

if active {
	active_timer += 1;
	draw_sprite(spr_map,0,0,0); 
	
	if _left_click {
		switch (state.context_check) {
			case "check":
				active = false;
				if point_in_rectangle(_mx, _my, 254,287,319,350) {
					scr_textbox_create("brick_theory_1");
					// state.context_check = false;
				} else if point_in_rectangle(_mx, _my, 256,0,320,60) {
					scr_textbox_create("brick_theory_counter");
				} else {
					scr_textbox_create("incorrect_map");
				}
				break;
			
			case "check_1":
				active = false;
				if point_in_rectangle(_mx, _my, 256,360,320,460) {
					scr_textbox_create("brick_theory_2");
					// state.context_check = false;
				} else {
					scr_textbox_create("incorrect_map");
				}
				break;
			
			default:
				break;
		}
	}
} else {
	active_timer = 0;	
}