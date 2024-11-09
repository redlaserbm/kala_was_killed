/// @description Insert description here
// You can write your code in this editor
if active {
	// Check the number of items in the player's inventory that are relevant to Leif's case
	// Three cases based on whether player has none, some, or all of the relevant items.
	var _items = 0;
	_items += 1*scr_check_item("Power lines");
	_items += 1*scr_check_item("Road observation");
	_items += 1*scr_check_item("Leif's brick");
	
	if _items == 0 {
		scr_textbox_create("leif", scr_crime_scene);
	} else if _items < 3 {
		scr_textbox_create("leif_1", scr_crime_scene);
	} else {
		// This will trigger a scene change.
		scr_textbox_create("leif_2", scr_crime_scene);
	}
}