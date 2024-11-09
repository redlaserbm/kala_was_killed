/// @description Insert description here
// You can write your code in this editor
if active {
	if state.interactions == 0 {
		scr_textbox_create("tree", scr_crime_scene);
	} else if state.interactions == 1 {
		scr_textbox_create("tree_1", scr_crime_scene);	
	} else if state.interactions == 2 {
		scr_textbox_create("tree_2", scr_crime_scene);
	} else {
		scr_textbox_create("tree_3", scr_crime_scene);
	}
	
	scr_deactivate();
	state.interactions += 1;
}