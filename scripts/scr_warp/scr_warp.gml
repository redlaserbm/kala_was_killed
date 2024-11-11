// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_warp(){
	// For now I'm keeping this simple by just having this script go straight to scene 2
	// I'll expand the functionality of this code later
	scr_game_unload();
	
	room_goto(rm_interrogation);
	scr_obj_init();
	
	// Make sure that the inventory has all the items we need to complete the interrogation!
	scr_add_items(["Power lines", "Road observation", "Leif's brick", "Crime scene map", "Kala's phone"], obj_inventory, true);
	
}