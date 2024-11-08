// This script concerns item combinations

item_index = ds_map_create();
ds_map_add(item_index, "Temmie's knife", 0);
ds_map_add(item_index, "Chocolate cake", 1);
ds_map_add(item_index, "Sliced cake", 2);
ds_map_add(item_index, "Laser's big ego", 3);
ds_map_add(item_index, "Yippee plushie", 4);

item_combo = ds_grid_create(25,25);
item_combo[# 0, 1] = ["Temmie's knife", "Sliced cake"];

// This is intended to be used only within the context of obj_inventory
function scr_add_items(_new_items){
	// First, delete the items are to be combined
	var _i = 0;
	var _item_preserve = false;
	while (_i < array_length(_new_items)) {
		if (state.inventory[hover_pos] == _new_items[_i]) {
			_item_preserve = true;
			array_delete(_new_items, _i, 1);
			break;
		}
		_i++;
	}
	if !_item_preserve {
		array_delete(state.inventory,hover_pos,1);
		if hover_pos < click_pos {
			click_pos = click_pos - 1;	
		}
	}
	
	_i = 0;
	_item_preserve = false;
	while (_i < array_length(_new_items)) {
		if (state.inventory[click_pos] == _new_items[_i]) {
			_item_preserve = true;
			array_delete(_new_items, _i, 1);
			break;
		}
		_i++;
	}
	if !_item_preserve {
		array_delete(state.inventory,click_pos,1);
	}
	
	// Next, amend the new items to the inventory
	_i = array_length(state.inventory);
	for (var _j = 0; _j < array_length(_new_items); _j++) {
		state.inventory[_i + _j] = _new_items[_j];
	}
}

// Checks whether an item of the given name exists in the player's inventory. Returns booleans
function scr_check_item(_name) {
	var _exists = false;
	for (var _i = 0; _i < array_length(state.inventory); _i++) {
		if state.inventory[_i] == _name {
			_exists = true;
			break;
		}
	}
	return _exists;
}