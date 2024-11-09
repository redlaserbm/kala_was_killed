// These scripts contain END ACTIONS
// When a textbox is finished running and has end actions associated with it...
// It will run those end actions before destroying itself! 
function scr_add_item(_name){
	
	index = 0;
	while global.inventory_map[index] != _name {
		index += 1;
		if index >= array_length(global.inventory_map) {
			break;	
		}
	}
	
	if index < array_length(global.inventory_map) {
		// Ensure that we only modify the inventory if the object we want to add exists!
		var _method = function() { 
			inventory_add(obj_inventory,index);
		};
		array_push(end_action, _method);
		
	}
}

function scr_goto(_name){
	// This script is useful if there's multiple lines of dialogue that need to lead into the same text at the end 
	goto_string = _name;
	var _method = function() { 
		scr_textbox_create(goto_string);
	};
	array_push(end_action, _method);
}

function scr_room_goto(_name){
	room_name = _name;
	var _method = function() {
		if room_exists(room_name) {
			room_goto(room_name);
		}
	}
	array_push(end_action, _method);
}

function scr_flag(_name, _instant = false, _value = true){
	
	hash = variable_get_hash(_name);
	value = _value;
	
	if _instant {
		struct_set_from_hash(obj_game.flags, hash, value);
	} else {
		var _method = function() {
			struct_set_from_hash(obj_game.flags, hash, value);
		}
		array_push(end_action, _method);
	}
}

function scr_remove_from_room(_room, _item){
	// Removes item _item from being shown in room _room
	e_room = _room;
	e_item = _item;
	var _method = function() {
		with obj_itemizer {
			var _current_item_pool = ds_map_find_value(room_items, other.e_room);
			for (var _i = 0; _i < array_length(_current_item_pool); _i++) {
				if _current_item_pool[_i] == other.e_item {
					array_delete(_current_item_pool, _i, 1);	
				}
			}
		}
		
		for (var _i = instance_number(other.e_item) - 1; _i > -1; _i--) {
			instance_destroy(instance_find(other.e_item,_i));
		}
	}
	array_push(end_action, _method);
}

function scr_atmosphere(_bg = ds_map_find_value(global.room_bg, room), _snd = ds_map_find_value(global.room_music, room)) {
	end_snd = _snd;
	end_bg = _bg;
	var _method = function() {
		with (obj_game) {
			bg_new = end_bg;
			bg_music_new = end_snd;
		}
	}
}

function scr_open_inventory() {
	var _method = function() {
		with (obj_inventory) {
			scr_activate();	
		}
		instance_destroy();
	}
	array_push(end_action, _method);
		
}