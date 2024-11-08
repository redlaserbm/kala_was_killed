/// @description Insert description here
// You can write your code in this editor
if active {
	if scr_check_item("Car key") {
		room_goto(rm_car_interior);	
	} else {
		scr_textbox_create("no_keys", scr_crime_scene);	
	}
	
}