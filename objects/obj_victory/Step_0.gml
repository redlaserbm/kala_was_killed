/// @description Insert description here
// You can write your code in this editor

var _left_click = mouse_check_button_pressed(mb_left);

if _left_click {
	instance_destroy();	
	game_end();
}