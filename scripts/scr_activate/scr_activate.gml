// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_activate(){
	
	// Make all interactables inactive
	for (var _i = 0; _i < instance_number(obj_interactable); _i++) {
		var _interactable = instance_find(obj_interactable,_i);
		_interactable.active = false;
	}
	
	// Make the current interactable active
	active = true;
	
	if object_get_name(object_index) == object_get_name(obj_inventory) {
		show_debug_message("ACTIVATED INVENTORY");
		obj_menu.menu_pos = 4;
		obj_menu.option_pos = -1;
	}
}