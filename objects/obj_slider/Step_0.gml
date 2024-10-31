/// @description Insert description here
// You can write your code in this editor

var _left_click_hold = mouse_check_button(mb_left);
var _left_click_press = mouse_check_button_pressed(mb_left);


mx = mouse_x;
my = mouse_y;

if (_left_click_press && position_meeting(mx, my, self)) {
	drag = true;
}

if drag {
	if !_left_click_hold {
		drag = false;	
	}
	x += drag_sensitivity*(mx - mx_old);
	// y += my - my_old;
	x = clamp(x, limit_x[0], limit_x[1]);
}


mx_old = mx;
my_old = my;

var _hash = variable_get_hash(speaker_variable);
struct_set_from_hash(speaker_struct, _hash, (x - limit_x[0])/(limit_x[1] - limit_x[0]));

// Destroy the slider if it is no longer needed.
if creator.menu_pos != creator_menu_pos {
	instance_destroy();	
}
