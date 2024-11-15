/// @description Insert description here
// You can write your code in this editor
// var _left_click = mouse_check_button_pressed(mb_left) && (instance_number(obj_menu) > 0 && obj_menu.hover_pos < 0);
accept_key = mouse_check_button_pressed(mb_left);

if active {
	scr_draw_options(640,480, ["Next", "Back"], "bottom_right");
	if option_pos > -1 {
		state.page = state.page + (-2*option_pos+1);
		state.page = clamp(state.page, 0,2);
		option_pos = -1;
	}
	
	draw_sprite(spr_journal_entries, state.page, 0,0);	
	
	
}