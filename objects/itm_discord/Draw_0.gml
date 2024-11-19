/// @description Insert description here
// You can write your code in this editor
var _left_click = mouse_check_button_pressed(mb_left) && (obj_menu.hover_pos < 0);

if active && _left_click {
	active = !active;	
}

// Always draw the discord icon
draw_sprite(sprite_index, 0, x, y);

// If active, draw the discord GUI
if active {
	draw_sprite(spr_the_horse, 0, 0,0);
}
