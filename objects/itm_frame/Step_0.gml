/// @description Insert description here
// You can write your code in this editor
state.standby = false;
if state.active {
	if state.interactions < 1 {
		scr_textbox_create("frame_curious");		
	} else {
		scr_room_goto(rm_kala_frame, true);	
	}
	
	state.interactions += 1;
	state.active = false;
}