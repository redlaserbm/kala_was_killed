/// @description Insert description here
// You can write your code in this editor

var _left_click = mouse_check_button_pressed(mb_left);

var _num_str = "b" + string(numeral);

if _left_click && position_meeting(mouse_x,mouse_y, self) {
	itm_panel.state[$ _num_str] = itm_panel.state[$ _num_str] + 1;
	itm_panel.state[$ _num_str] = itm_panel.state[$ _num_str] % 2;
	audio_play_sound(snd_button, 1, false, 0.25*global.settings.volume*global.settings.volume_sfx);	
}

image_index = 10*itm_panel.state[$ _num_str]+numeral;

if (instance_number(itm_panel) < 1){
	instance_destroy();	
}
if !itm_panel.active {
	instance_destroy();	
}