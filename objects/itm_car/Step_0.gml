/// @description Insert description here
// You can write your code in this editor
if state.active {
	if scr_check_item("Car key") {
		if state.key_interactions < 1 {
			scr_textbox_create("keys", scr_crime_scene);
			state.key_interactions += 1;
		} else {
			scr_room_goto(rm_car_interior, true);	
		}
	} else {
		if (state.interactions >= 1) && (obj_inventory.click_pos >= 0) && (obj_inventory.state.inventory[obj_inventory.click_pos] == "Temmie's knife") {
			scr_textbox_create("no_keys_knife", scr_crime_scene);	
		} else {
			scr_textbox_create("no_keys", scr_crime_scene);	
		}
	}
	state.interactions += 1;
}