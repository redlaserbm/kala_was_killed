// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_obj_init(){
	// Script for initializing important objects that the game needs to run correctly.
	// This script is run whenever a new game is started, OR a save file is loaded.
	var _objects_to_load = [obj_logger, obj_menu, obj_inventory, obj_itemizer];
	for (var _i = 0; _i < array_length(_objects_to_load); _i++) {
		if instance_number(_objects_to_load[_i]) < 1 {
			instance_create_depth(0,0,-1,_objects_to_load[_i]);
		}
	}
}