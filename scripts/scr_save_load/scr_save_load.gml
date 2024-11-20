// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_game_save(_slot = 0){
	
	// To begin, let's perform one last update of the game's state (as a way of double-checking things)
	// scr_update(obj_game.state);
	
	// Next, let's copy the state struct from obj_interactable
	var _game_data = variable_clone(obj_game.state);
	
	if instance_number(obj_textbox) < 1 {
		show_debug_message("There are no textboxes on screen");
		_game_data[$ "obj_textbox"] = {text_id: "-1", page: -1, dictionary: "default"};	
	}
	
	_game_data.current_room = room;
	show_debug_message("Data saved at " + room_get_name(_game_data.current_room));
	
	var _filename = "savedata_" +  string(_slot) + ".sav";
	var _json = json_stringify(_game_data);
	var _buffer = buffer_create( string_byte_length(_json) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json);
	
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
	
	show_debug_message(_game_data);
	
	//Display a message showing that the game was saved.
	// obj_game.alarm[1] = 60;
}

function scr_game_unload() {
	// Helper function which unloads the current game state
	var _i = 0;
	for (_i = instance_number(obj_textbox) - 1; _i > -1 ; _i--) {
		var _textbox = instance_find(obj_textbox, _i);
		_textbox.force_destroy = true;
		instance_destroy(_textbox);
	}
	
	// Next, destroy any other interactable object in the room
	for (_i = instance_number(obj_interactable) - 1; _i > -1 ; _i--) {
		var _item = instance_find(obj_interactable,_i);
		instance_destroy(_item);
	}
	
	// Destroy other objects
	instance_destroy(obj_itemizer);
	// instance_destroy(obj_music);
}

function scr_game_load(_slot = 0){
	
	// LOADING THE SAVE STATE
	
	// First, let's get the save file we created earlier
	var _filename = "savedata_" +  string(_slot) + ".sav";
	if !file_exists(_filename) {
		show_debug_message("loading failed!");
		exit;		
	}
	
	scr_game_unload();
	
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _load_array = json_parse(_json);
	
	// Next, let's update obj_game's state to reflect the state of the loaded file
	obj_game.state = _load_array;
	
	// Next, let's go to the room where the save file is located.
	room_goto(_load_array.current_room);
	
	show_debug_message("Loaded into " + room_get_name(_load_array.current_room));
	
	// Next, spawn the necessary objects to get the game up and running.
	scr_obj_init();
	
	// If there was an active item at the time of saving, we must produce this active item
	var _items = struct_get_names(_load_array);
	for (var _i = 0; _i < array_length(_items); _i++) {
		// show_debug_message("info");
		// show_debug_message( _load_array[$ _items[_i]]);
		// show_debug_message( _items[_i]);
		if variable_struct_exists( _load_array[$ _items[_i]], "active") { 
			if _load_array[$ _items[_i]].active {
				if _items[_i] == object_get_name(obj_textbox) {
					// There are special instructions for obj_textbox because these special instructions allow us
					// to get away with storing less data in the state variables.
					if _load_array.obj_textbox.text_id != "-1" {
		
						// Create the textbox and skip to the page they were viewing
						// show_debug_message("Loading textbox");
						scr_textbox_create(_load_array.obj_textbox.text_id, _load_array.obj_textbox.dictionary);
						with (obj_textbox) {
							page = _load_array.obj_textbox.page;
						}
					}
				} else {
					show_debug_message("Activating " + _items[_i]);
					instance_create_depth(0,0,obj_itemizer.depth, asset_get_index(_items[_i]));
				
				}
			}
		}
	}
	
	// This code is probably redundant. We will address this soon.
	
	
	//}
	
	show_debug_message("Loaded game!");
	show_debug_message(_load_array);
}