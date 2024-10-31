/// @description Insert description here
// You can write your code in this editor
if active {
	if state.interactions == 0 {
		scr_textbox_create("elevator_poster_temmie");
	} else {
		scr_textbox_create("elevator_poster_temmie_1");	
	}
	
	state.interactions += 1;
	scr_deactivate();
}