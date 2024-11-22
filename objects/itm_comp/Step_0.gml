/// @description Insert description here
// You can write your code in this editor

state.standby = false;
if state.active {
	if state.interactions < 1 {
		scr_textbox_create("comp_find");
	} else {
		scr_room_goto(rm_kala_comp, true);
	}
	state.interactions += 1;	
}