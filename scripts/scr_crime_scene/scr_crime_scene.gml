// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_crime_scene(_text_id){
	
	switch(_text_id) {
		case "kala":
			scr_text(spr_laser, 1, "You sure she's dead?");
			scr_text(spr_temmie, 1, "Go ahead, take one hard look at that lifeless corpse and tell me that it's still alive.");
			scr_text(spr_laser, 1, "It's still alive.");
			scr_text(spr_temmie, 1, "...");
			scr_text(spr_temmie, 1, "No it isn't.");
			scr_text(spr_laser, 1, "Look, I'm just saying, maybe she could rise from the dead like in those zombie movies.");
			scr_text(spr_temmie, 1, "...")
			scr_text(spr_laser, 1, "You ever seen ParaNorman?");
			scr_text(spr_laser, 1, "I haven't, but this kind of thing *probably* happened in that movie.");
			break;
			
		case "tree":
			scr_text(spr_laser, 1, "Oh hey, look, a happy little tree!");
			scr_text(spr_laser, 1, "...");
			scr_text(spr_laser, 1, "Ok, well maybe it's not so happy anymore...");
			scr_text(spr_temmie, 1, "Hmm... The tree took some power lines with it when it fell down.");
			break;
			
		case "tree_1":
			scr_text(spr_laser, 1, "Ok so, getting into specifics, how long after a happy little tree falls does it take for the tree to stop being happy?");
			scr_text(spr_temmie,1, "Honestly, it depends on a couple of things like: how long since it fell, the species of tree,");
			scr_text(spr_temmie,1, "why it fell, and so many other---", [scr_force_go()]);
			scr_text(spr_laser, 1, "Oooh shiny object!");
			scr_text(spr_temmie,1, "Were you even listening to me at all?");
			scr_text(spr_laser, 1, "No, anyways, I found something cool.");
			scr_text(spr_temmie,1, "A key? There's a chance it could open the door to the car...");
			scr_add_items(["Car key"]);
			break;
			
		case "tree_2":
			scr_text(spr_temmie, 1, "So, if I try to answer your question again, you will listen to me, right?");
			scr_text(spr_laser, 1, "Absolutely.");
			scr_text(spr_temmie, 1, "So as I saying, it depends on a couple things lik---", [scr_force_go()]);
			scr_text(spr_laser, 1, "(literally dozing off to sleep like a jackass)");
			scr_text(spr_temmie,1, "I will give you so many freaking splinters when you wake up.");
			scr_text(spr_laser, 1, "...");
			scr_text(spr_laser, 1, "Oh, what was that? Sorry I was kinda tired."); 
			scr_text(spr_temmie, 1, "I'm disappointed in you.");
			break;
			
		case "no_keys":
			scr_text(spr_temmie, 1, "Shit I ain't got the keys");
			break;
			
	}
}