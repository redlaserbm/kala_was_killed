/// @description Insert description here
// You can write your code in this editor
state.standby = false;
if state.active {
	// Check the number of items in the player's inventory that are relevant to Leif's case
	// Three cases based on whether player has none, some, or all of the relevant items.
	var _items = 0;
	_items += 1*scr_check_item("Power lines");
	_items += 1*scr_check_item("Road observation");
	_items += 1*scr_check_item("Leif's brick");
	_items += 1*scr_check_item("Kala's phone");
	_items += 1*scr_check_item("Crime scene map");
	
	if (_items == 0) || (state.interactions < 1 && _items < 5) {
		scr_textbox_create("leif");
	} else if scr_check_equipped("Leif's brick") && (state.interactions > 0) && (_items < 5) {
		scr_textbox_create("leif_special_brick");
	} else if _items < 5 {
		scr_textbox_create("leif_1");
	} else {
		// This will trigger a scene change.
		scr_textbox_create("leif_2");
	}
	state.interactions += 1;
}