// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_warp(_scene = 2){
	// For now I'm keeping this simple by just having this script go straight to scene 2
	// I'll expand the functionality of this code later
	scr_game_unload();
	
	switch (_scene) {
		case 2:
			obj_game.state.flags.interrogation_start = false;
			obj_game.state.flags.interrogation_help = false;
			obj_game.state.flags.interrogation_car = false;
			obj_game.state.flags.interrogation_nuance = false;
			obj_game.state.flags.interrogation_complete = false;
			room_goto(rm_interrogation);
	
			scr_obj_init();
	
			// Make sure that the inventory has all the items we need to complete the interrogation!
			scr_add_items(["Power lines", "Road observation", "Leif's brick", "Crime scene map", "Kala's phone"], obj_inventory, true);
			break;
			
		case 3:
			obj_game.state.flags.temmie_alone = true;
			
			room_goto(rm_kala);
			scr_obj_init();
			
			scr_remove_items(["Power lines", "Road observation", "Leif's brick", "Crime scene map", "Kala's phone", "Laser"], obj_inventory, true);
			scr_add_items(["Kala's key"], obj_inventory, true);
			break;
			
			
		case 4:
			room_goto(rm_realm);
			scr_obj_init();
			break;
			
		case 5:
			
			room_goto(rm_credits);
			break;
			
	}
	
	
}