// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_activate(_instance = self){
	
	
	// Make all interactables inactive
	for (var _i = 0; _i < instance_number(obj_interactable); _i++) {
		var _interactable = instance_find(obj_interactable,_i);
		
		if _interactable.active {
			obj_game.state.previous_active_item = object_get_name(_interactable.object_index);
		}
		
		_interactable.active = false;
	}
	
	// Make the target interactable active
	_instance.active = true;
	
	if object_get_name(_instance.object_index) == object_get_name(obj_inventory) {
		// show_debug_message("ACTIVATED INVENTORY");
		obj_menu.menu_pos = 4;
		obj_menu.option_pos = -1;
		_instance.click_pos = -1;
	}
	
	obj_game.state.active_item = object_get_name(_instance.object_index);
	
	show_debug_message(obj_game.state.active_item);
	show_debug_message(obj_game.state.previous_active_item);
}