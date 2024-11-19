// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_activate(_instance = self){
	
	var _previous_active = noone;
	
	// Make all interactables inactive
	for (var _i = 0; _i < instance_number(obj_interactable); _i++) {
		var _interactable = instance_find(obj_interactable,_i);
		
		// NOTE: Our current infrastracture does NOT support multiple items being active at once
		if _interactable.active {
			_previous_active = _interactable;
		}
		
		_interactable.active = false;
	}
	
	// Make the target interactable active
	if instance_exists(_instance) {
		
		show_debug_message("Trying to activate:");
		show_debug_message(_instance);
		
		// Make the instance active
		_instance.active = true;
		
		// Memorize the previous active instance
		with (_instance) {
			if struct_exists(state, "previous_active") && state.previous_active == noone {
				state.previous_active = _previous_active;
			}
		}
		
		show_debug_message("Previous active is now ");
		show_debug_message(_previous_active);
		if _previous_active != noone {
			show_debug_message("This object is of type " + object_get_name(_previous_active.object_index));
		}
		
		// If there are any special instructions this specific instance needs to follow when activated...
		// Execute those instructions!
		_instance.special_activate();
	
		show_debug_message("New active item: " + object_get_name(_instance.object_index));
	} else {
		show_debug_message("Tried to activate " + string(_instance) + " but failed!");
	}
	// show_debug_message(obj_game.state.previous_active_item);
}