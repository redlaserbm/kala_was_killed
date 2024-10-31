/// @description Insert description here
// You can write your code in this editor

if active {
	if state.interactions == 0 {
		scr_textbox_create("elevator_poster_laser");
	} else if state.interactions == 1 {
		scr_textbox_create("elevator_poster_laser_1");	
	} else {
		scr_textbox_create("elevator_poster_laser_2");
	}
	
	scr_deactivate();
	state.interactions += 1;
}