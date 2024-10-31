// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_update(_struct){
	// This is a script which compiles the state variables from all active interactable objects
	// They are stored into a struct like so:
	// The KEYS of the struct are names of items
	// The VALUES of the structs are the state struct for these items
	
	// NOTE: Because of how structs work, there is no need for us to explicitly return
	// _struct. All modifications are inherently "in-house".
	
	// These are objects which the script will *never* update, even if they're active at the time
	var _static_names = ["obj_logger"];
		
	// These are objects which the script will always update, even if they are not active at the time
	var _textbox_updated = false;
	
	for (var _i = 0; _i < instance_number(obj_interactable); _i++) {
		// Identify the item we will extract information from
		var _itm = instance_find(obj_interactable,_i);
		
		// Identify the key in the _struct whose value we will modify
		var _idx = object_get_name(_itm.object_index);
		
		if (_idx == "obj_textbox") {
			_textbox_updated = true;	
		}
		
		// We will perform updates under the following circumstances:
		// 1. The item cannot be an item that is forbidden from being updated
		// 2. The item must be active, OR it must be the inventory or textbox items
		if (array_get_index(_static_names, _idx) < 0) {
			
			// We assume that the values for _struct are structs themselves. If not, make it so!
			if !is_struct(_struct[$ _idx]) {
				_struct[$ _idx] = {};	
			}
			
			// Get the names of all state variables whose values we need to store
			scr_copy_struct(_itm.state, _struct[$ _idx]);
		}
	}
	
	if !_textbox_updated {
		_struct[$ "obj_textbox"] = {text_id: "-1", page: -1};	
	}
	
	// show_debug_message(_struct);
}