// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_game_save(_slot = 0){
	
	// To begin, let's perform one last update of the game's state (as a way of double-checking things)
	// scr_update(obj_game.state);
	
	// Next, let's copy the state struct from obj_interactable
	var _game_data = variable_clone(obj_game.state);
	
	if instance_number(obj_textbox) < 1 {
		_game_data[$ "obj_textbox"] = {text_id: "-1", page: -1, dictionary: "default"};	
	}
	
	_game_data.current_room = room_get_name(room);
	
	var _filename = "savedata_" +  string(_slot) + ".sav";
	var _json = json_stringify(_game_data);
	var _buffer = buffer_create( string_byte_length(_json) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json);
	
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
	
	show_debug_message(_game_data);
	
	//Display a message showing that the game was saved.
	obj_game.alarm[1] = 60;
}

function scr_game_load(_slot = 0){
	// UNLOADING THE CURRENT GAME STATE
	
	//If the player is viewing any text, immediately destroy the textbox without running its associated end actions
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
	
	// Finally, destroy obj_itemizer
	instance_destroy(obj_itemizer);
	
	// LOADING THE SAVE STATE
	
	// First, let's get the save file we created earlier
	var _filename = "savedata_" +  string(_slot) + ".sav";
	if !file_exists(_filename) {
		show_debug_message("loading failed!");
		exit;		
	}
	
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _load_array = json_parse(_json);
	
	// Next, let's update obj_game's state to reflect the state of the loaded file
	obj_game.state = _load_array;
	
	// Next, let's go to the room where the save file is located.
	room_goto(asset_get_index(_load_array.current_room));
	
	// Next, spawn the necessary objects to get the game up and running.
	scr_obj_init();
	
	// Finally, if necessary, display the text that the player was looking at at the time that they saved
	if _load_array.obj_textbox.text_id != "-1" {
		
		// Create the textbox and skip to the page they were viewing
		scr_textbox_create(_load_array.obj_textbox.text_id, _load_array.obj_textbox.dictionary);
		with (obj_textbox) {
			page = _load_array.obj_textbox.page;
		
			// Infer the current background image that should be displayed by looking back at previous pages
			var _i = array_length(bg) - 1
			while bg[_i] == noone {
				_i -= 1;
				if _i < 0 {
					break;	
				}
			}
			if _i > 0 {
				obj_game.fade_time = 0;
				obj_game.bg_new = bg[_i];	
			}
			
			// Do the same thing but for the music
			_i = array_length(sound) - 1
			while sound[_i] == noone {
				_i -= 1;
				if _i < 0 {
					break;	
				}
			}
			if _i > 0 {
				obj_game.bg_music_new = sound[_i];	
			}
			
		}
	}
	
	// Display a message notifying that the game file was loaded successfully
	obj_game.alarm[2] = 1;
	
	show_debug_message("Loaded game!");
	show_debug_message(_load_array);
}