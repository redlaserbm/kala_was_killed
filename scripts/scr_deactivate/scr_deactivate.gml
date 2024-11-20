// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_deactivate(_instance = self){
	
	show_debug_message("---");
	show_debug_message("Running scr_deactivate")
	show_debug_message("Deactivating: " + object_get_name(_instance.object_index))
	
	_instance.state.active = false;
	
	show_debug_message(_instance.state.previous_active);
	
	if (_instance.state.previous_active != noone) && instance_exists(_instance.state.previous_active) && _instance.state.previous_active.state.standby {
		show_debug_message("Deactivated object had a memorized object on standby: ");
		show_debug_message(object_get_name(_instance.state.previous_active.object_index));
		
		scr_activate(_instance.state.previous_active, false);	
		_instance.state.previous_active.state.standby = false;
		_instance.state.previous_active = noone;
	} else {
		show_debug_message("No deactivated object on standby.");	
	}
	
	
	show_debug_message("end scr_deactivate");
}