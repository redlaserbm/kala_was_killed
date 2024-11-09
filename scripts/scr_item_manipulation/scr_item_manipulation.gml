// This script concerns item combinations

item_index = ds_map_create();
ds_map_add(item_index, "Temmie's knife", 0);
ds_map_add(item_index, "Chocolate cake", 1);
ds_map_add(item_index, "Sliced cake", 2);
ds_map_add(item_index, "Laser's big ego", 3);
ds_map_add(item_index, "Yippee plushie", 4);

item_combo = ds_grid_create(25,25);
item_combo[# 0, 1] = ["Temmie's knife", "Sliced cake"];

function scr_add_items(_items = [], _context = obj_inventory, _instant = false) {
	// For each item in _items, make sure the item doesn't already exist in the inventory
	if _instant {
		for (var _i = 0; _i < array_length(_items); _i++) {
			var _already_exists = false;
			for (var _j = 0; _j < array_length(_context.state.inventory); _j++) {
				if _context.state.inventory[_j] == _items[_i] {
					_already_exists = true;
					break;
				}
			}
			if !_already_exists {
				array_push(_context.state.inventory, _items[_i]);
			}
		}
	} else {
		context = _context;
		items = _items;
		var _method = function() {
			for (var _i = 0; _i < array_length(items); _i++) {
				var _already_exists = false;
				for (var _j = 0; _j < array_length(context.state.inventory); _j++) {
					if context.state.inventory[_j] == items[_i] {
						_already_exists = true;
						break;
					}
				}
				if !_already_exists {
					array_push(context.state.inventory, items[_i]);
				}
			}
		}
		array_push(end_action, _method);	
	}
}

// For combining two items in the player's inventory
function scr_combine_items(_item_1, _item_2, _context = obj_inventory){
	
	if (!is_undefined(_item_1)) && (!is_undefined(_item_2)) {
		
		// Determine the new items we will get as a consequence of combining _item_1 and _item_2
		var _new_items = global.item_combo[# min(_item_1, _item_2), max(_item_1, _item_2)];
		
		if typeof(_new_items) == "array" {
			var _i = 0;
			var _item_preserve = false;
			
			// The with context line lets *other* objects in the game perform item combinations if necessary
			with _context {
				while (_i < array_length(_new_items)) {
					if (hover_pos >= 0) && (state.inventory[hover_pos] == _new_items[_i]) {
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
					if (click_pos >= 0) && (state.inventory[click_pos] == _new_items[_i]) {
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
		}
	} else {
		click_pos = hover_pos;	
	}
}

// Checks whether an item of the given name exists in the player's inventory. Returns booleans
function scr_check_item(_name) {
	var _exists = false;
	for (var _i = 0; _i < array_length(obj_inventory.state.inventory); _i++) {
		if obj_inventory.state.inventory[_i] == _name {
			_exists = true;
			break;
		}
	}
	return _exists;
}