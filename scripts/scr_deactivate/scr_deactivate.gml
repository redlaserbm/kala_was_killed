// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_deactivate(_instance = self){
	//scr_update(obj_game.state);
	
	show_debug_message("Deactivating:")
	show_debug_message(object_get_name(_instance.object_index));
	
	_instance.active = false;
	
	if (_instance.state.previous_active != noone) {
		show_debug_message("Activating memorized instance");
		scr_activate(_instance.state.previous_active);	
		_instance.state.previous_active = noone;
	}
}