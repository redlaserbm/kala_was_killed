/// @description Insert description here
// You can write your code in this editor
var _left_click = mouse_check_button_pressed(mb_left) && (obj_menu.hover_pos < 0);

if state.active && _left_click {
	state.active = !state.active;	
}

// Always draw the discord icon
draw_sprite(sprite_index, 0, x, y);

// If active, draw the discord GUI
if state.active {
	draw_sprite(spr_the_horse, 0, 0,0);
}
