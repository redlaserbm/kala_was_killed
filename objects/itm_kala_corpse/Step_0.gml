/// @description Insert description here
// You can write your code in this editor
if state.active {
	if state.interactions % 2 == 0 {
		scr_textbox_create("kala",scr_crime_scene);	
	} else {
		scr_textbox_create("kala_1", scr_crime_scene);	
	}
	state.interactions += 1;	
}