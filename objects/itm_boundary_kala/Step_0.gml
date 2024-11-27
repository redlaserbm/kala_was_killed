/// @description Insert description here
// You can write your code in this editor
state.standby = false;
if state.active {
	if state.interactions != 3 {
		scr_room_goto(rm_kala, true);
	} else {
		scr_textbox_create("bad_at_puzzles");	
	}
	state.active = false;
	state.interactions += 1;
}