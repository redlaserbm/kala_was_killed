// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_item_examination(_text_id) {
	switch (_text_id) {
		case "Temmie's knife":
			if !obj_game.state.flags.temmie_alone {
				scr_text(spr_laser, 1, "Y'know, you shouldn't run around with sharp objects like that...");
				scr_text(spr_temmie, 1, "Why not?");
				scr_text(spr_laser, 1, "I don't trust you with sharp objects.");
				scr_text(spr_temmie, 1, "I will stab you with this.");
				scr_text(spr_laser, 1, "This is why I don't trust you.");
			} else {
				scr_text(spr_temmie, 1, "I'd get so much more done if the department just let me stab the suspects...");
				break;
			}
			// scr_open_inventory();
			break;
		
		case "Laser":
			var _int = irandom(2);
			switch (room) {
				
				case rm_interrogation:
					scr_text(spr_laser, 1, "Hey, Temmie, you know that saying about how the pen is mightier than the sword?");
					scr_text(spr_laser, 1, "It's funny, 'cuz you can literally use your new pen to make a mighty sword lol.");
					// scr_open_inventory();
					break;
				
				default:
					switch (_int) {
						case 0:
						scr_text(spr_laser, 1, "It's best practice to check your surroundings multiple times. Sometimes you miss something the first time around, or the second...");
						scr_text(spr_temmie, 1, "Hmm...");
						// scr_open_inventory();
						break;
			
						case 1:
							scr_text(spr_laser, 1, "Did you know you can combine items in the inventory?");
							scr_text(spr_laser, 1, "First, click on an item to equip it. If you click on another item in the inventory, the game will try and combine the two items together.");
							scr_text(spr_laser, 1, "I haven't found much use for it yet, but it might come in handy later on...");
							// scr_open_inventory();
							break;
			
						case 2:
							scr_text(spr_laser, 1, "If you need even more information about an item in the inventory, you can hold-click it.");
							scr_text(spr_laser, 1, "For most items this will give you more information, which is helpful in case you've forgotten anything during my yapping.");
							scr_text(spr_temmie, 1, "That's helpful since you do tend to yap way too much and with way too little substance while doing it.");
							scr_text(spr_laser, 1, "...");
							// scr_open_inventory();
							break;
					}
					break;
			}
			break;
		
		case "Police report":
			scr_text(spr_laser, 1, "Ok, so the police report reads as follows:");
			scr_text(spr_laser, 1, "Leif observed a car at about 9pm driving on the ro---", [scr_force_go()]);
			scr_text(spr_temmie, 1, "I'm not listening to all that but I'm proud of you or sorry for your loss whichever one makes more sense idgaf."); 
			scr_text(spr_laser, 1, "...");
			// scr_open_inventory();
			break; 
			
		default:
			// scr_open_inventory();
			instance_destroy();
			break;
	}
}