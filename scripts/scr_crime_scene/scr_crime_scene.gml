// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_crime_scene(_text_id){
	
	switch(_text_id) {
		case "police_report":
			scr_text(spr_jakkop, 1, "Okay, so you're gonna wanna take notes guys.");
			scr_text(spr_temmie, 1, "Mhm...");
			scr_text(noone, 0, "You are Temmie, a detective for the LIA sent in to investigate the death of popular artist Kalanit Saidon.");
			scr_text(noone, 0, "An officer is already on the scene to offer you preliminary details about what happened.");
			scr_text(spr_jakkop, 1, "We got an eyewitness account from the afro guy over there about a car crash that just occurred here.");
			scr_text(spr_jakkop, 1, "Basically, a tree fell, and Kala, who was driving the car, swerved to miss it, lost control and hit Laser's house.");
			scr_text(spr_laser, 1, "Wait wtf...");
			scr_text(spr_laser, 1, "Brooo, my house noooo!!!!!!!");
			scr_text(noone, 0, "That's your sidekick, Laser. He helps you investigate crime scenes like this one using his badass forensic robot tech.")
			scr_text(spr_laser, 1, "Jesus, my shit got smashed to pieces. How am I gonna look at naked women on the internet in the privacy of my own home now?");
			scr_text(noone, 0, "At least, he's *supposed* to help..."); 
			scr_text(spr_laser, 1, "I spent like, 2 months fixing up my house after the last explosion dude.");
			scr_text(spr_laser, 1, "Literally brick-by-brick I put that house back together myself.");
			scr_text(spr_temmie, 1, "You called a home remodelor.");
			scr_text(spr_laser, 1, "Okay, but that's like basically the same thing.");
			scr_text(spr_temmie, 1, "Also, someone died and you're more concerned about your house. Anyways...");
			scr_text(spr_temmie, 1, "Jakkop, when did the crash occur?");
			scr_text(spr_jakkop, 1, "...");
			scr_text(spr_temmie, 1, "Jakkop?");
			scr_text(spr_laser, 1, "(Psst... Temmie...)");
			scr_text(spr_laser, 1, "You have to put some respect on his name.");
			scr_text(spr_temmie, 1, "Respect?");
			scr_text(spr_laser, 1, "Uhh... you gotta call him Officer Jakkop, or else he'll ignore you.");
			scr_text(spr_jakkop, 1, "You hear something? The wind must be blowing really loudly tonight.")
			scr_text(spr_temmie, 1, "...");
			scr_text(spr_temmie, 1, "Okay *officer* Jakkop when did the crash occur?");
			scr_text(spr_jakkop, 1, "Afro guy says the crash occurred at about 9pm, and Kala ended up dying on impact after hitting the house.");
			scr_text(spr_temmie, 1, "Mhm...");
			scr_text(spr_jakkop, 1, "Here's a police report on the scene. Based on afro guy's account, we think Kala's death is an accident, but we wanted you to confirm.");
			scr_add_items(["Police report", "Crime scene map"]);
			scr_text(noone, 0, "You just received some items. To view your inventory, click on the menu on the top left of the screen.");
			break;
			
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
			scr_text(spr_temmie, 1, "Hmm... The tree took some power lines with it when it fell down. I'll take note of this for later.");
			scr_add_items(["Power lines"]);
			break;
			
		case "tree_1":
			scr_text(spr_laser, 1, "Ok so, getting into specifics, how long after a happy little tree falls does it take for the tree to stop being happy?");
			scr_text(spr_temmie,1, "Honestly, it depends on a couple of things like: how long since it fell, the species of tree, why it fel---", [scr_force_go()]);
			scr_text(spr_laser, 1, "Oooh shiny object!");
			scr_text(spr_temmie,1, "Were you even listening to me at all?");
			scr_text(spr_laser, 1, "No, anyways, look, I found something cool.");
			scr_text(spr_laser, 1, "Here, check this out!");
			scr_text(spr_temmie,1, "A key? There's a chance it could open the door to the car...");
			scr_add_items(["Car key"]);
			break;
			
		case "tree_2":
			scr_text(spr_temmie, 1, "Hmm...");
			scr_text(spr_laser, 1, "What's up?");
			scr_text(spr_temmie, 1, "While you were busy being distracted by shiny objects, there was a peculiar detail I noticed myself.");
			scr_text(spr_laser, 1, "What'd you find?");
			scr_text(spr_temmie, 1, "There aren't any tire tracks on the road that would indicate a car swerving to avoid the tree.");
			scr_text(spr_laser, 1, "Maybe Kala was just really good at swerving?");
			scr_text(spr_temmie, 1, "I don't know, but it seems odd... I'm going take note of this in case we need it later.");
			scr_add_items(["Road observation"]);
			break;
			
		case "tree_3":
			scr_text(spr_temmie, 1, "So, if I try to answer your question about happy little trees again, you *will* listen to me, right?");
			scr_text(spr_laser, 1, "Absolutely.");
			scr_text(spr_temmie, 1, "So as I was saying, it depends on a couple things lik---", [scr_force_go()]);
			scr_text(spr_laser, 1, "(literally instantly dozing off to sleep like a jackass)");
			scr_text(spr_temmie,1, "I will give you so many freaking splinters when you wake up.");
			scr_text(spr_laser, 1, "...");
			scr_text(spr_laser, 1, "Oh, what was that? Sorry I was kinda tired."); 
			break;
			
		case "no_keys":
			scr_text(spr_laser, 1, "If we get a look inside the car, we can probably confirm that Kala died because of the car crash.");
			scr_text(spr_temmie, 1, "Hmm... The door's locked. I could get in if I smash the window, however.");
			scr_text(spr_jakkop, 1, "Hey uh, Temmie, listen up, you're gonna wanna take notes here.");
			scr_text(spr_temmie, 1, "Notes, what notes?");
			scr_text(spr_jakkop, 1, "Yeah, the higher-ups told me I can't have you breaking stuff around here.");
			scr_text(spr_temmie, 1, "And what if I break shit anyways?");
			scr_text(spr_jakkop, 1, "Fines and jail time. Uh, yeah, that's what the higher-ups said.");
			scr_text(spr_laser, 1, "Wait, aren't you \"higher-ups\" in this case?");
			scr_text(spr_jakkop,1, "...");
			scr_text(spr_jakkop,1, "Wait sorry I wasn't listening can you repeat yourself?");
			scr_text(spr_laser, 1, "I said, aren't you the \"higher-ups\" in this case?");
			scr_text(spr_jakkop,1, "Wait no, I wasn't paying attention can you repeat one more time?");
			scr_text(spr_laser, 1, "Okay, sure, I was sayin---", [scr_force_go()]);
			scr_text(spr_temmie,1, "Laser.");
			scr_text(spr_laser, 1, "Yes?");
			scr_text(spr_temmie, 1, "He's not going to listen to you. Let's just find another way. The keys to the car might be around here somewhere.");
			break;
			
		case "no_keys_knife":
			// Dialogue interaction for when:
			// 1. You have attempted to open the car without keys at least once
			// 2. You attempt to use Temmie's knife to open the door
			scr_text(spr_laser, 1, "Hey Temmie, I know you *really* want to smash the windows in on this car, but I also don't want to see you hauled off to jail.");
			scr_text(spr_temmie,1, "Hm...");
			scr_text(spr_laser, 1, "I'm sure we can just find the keys to this car if we look around hard enough...");
			break;
			
		case "keys":
			scr_text(spr_temmie, 1, "Hey, Laser.");
			scr_text(spr_laser, 1, "Yes, Temmie?");
			scr_text(spr_temmie, 1, "Those keys from earlier, I think they can open the door to this car.");
			scr_text(spr_laser, 1, "How can you be so sure?");
			scr_text(spr_temmie, 1, "I read the item description within the inventory.");
			scr_text(spr_laser, 1, "Good thing I coded that in this video game, or else you wouldn't know what else to do!");
			scr_text(spr_temmie, 1, "...");
			scr_text(spr_laser, 1, "I'm a smart guy, ain't I?");
			scr_text(spr_temmie, 1, "Just give me the damn keys so I can open up the car.");
			scr_text(spr_laser, 1, "Ok.");
			scr_room_goto(rm_car_interior);
			break;
			
		case "keys_remark":
			scr_text(spr_temmie, 1, "Hey, Laser.");
			scr_text(spr_laser, 1, "Hmm?");
			scr_text(spr_temmie, 1, "Don't you think it's weird that the keys weren't already in the ignition?");
			scr_text(spr_laser, 1, "What do you mean?");
			scr_text(spr_temmie, 1, "I mean, the police report stated Kala lost control of her car, crashed into your house, and died upon impact...");
			scr_text(spr_laser, 1, "Hmm... So if the scene wasn't tampered with, the keys should've still been inside the ignition...");
			scr_text(spr_temmie, 1, "Bingo. This scene was tampered with.");
			scr_text(spr_laser, 1, "So, there'll certainly be *something* of interest around here.");
			break;
			
		case "leif_brick":
			scr_text(spr_temmie, 1, "Hmm... That's weird.");
			scr_text(spr_temmie, 1, "There's a brick on the gas pedal.");
			scr_text(spr_laser, 1, "Lemme see that thing.");
			scr_text(spr_laser, 1, "Huh, this thing's got some writing on it. It says... L-e-i-f. Weird.");
			scr_text(spr_temmie, 1, "Hey wait a minute isn't that the afro boy's name?");
			scr_text(spr_laser, 1, "We should probably take this for later.");
			scr_add_items(["Leif's brick"]);
			scr_remove_from_room(room, itm_brick);
			break;
			
		case "leif":
			scr_text(spr_temmie, 1, "Hey, you, afro boy, what's your name?");
			scr_text(spr_leif, 1, "Call me Leif.");
			scr_text(spr_temmie, 1, "Okay afro boy, tell me more about what happened here at the scene.");
			scr_text(spr_laser, 1, "Wait, Temmie, Jakkop already got an account of what happened at the scene from Leif earlier.");
			scr_text(spr_laser, 1, "We should probably explore more and come back to Leif if we find any *new* information not already seen in the report.");
			scr_text(spr_temmie, 1, "Hmm...");
			break;
			
		case "leif_1":
			scr_text(spr_laser, 1, "Hey Temmie, I understand we have *some* evidence we can present to Leif, but...");
			scr_text(spr_laser, 1, "I think we should explore more, so we can build a compelling case against him.");
			scr_text(spr_temmie, 1, "Hmm..."); 
			break;
		
		case "leif_2":
			scr_text(spr_temmie, 1, "Okay let's get his ass!");
			scr_room_goto(rm_interrogation);
			break;
			
		case "laser_stab":
			scr_text(spr_laser, 1, "Oww! wtf");
			scr_text(spr_temmie, 1, "Hehehehe");
			scr_text(spr_laser, 1, "I hate you.");
			scr_text(spr_temmie, 1, "No you don't.");
			scr_text(spr_laser, 1, "Well, I *am* gonna hate you if you keep stabbing me with that thing.");
			scr_open_inventory(); 
			break;
			
		case "shifter":
			scr_text(spr_temmie, "Oh shit the car was in reverse.");
			scr_add_items(["Shifter observation"]);
			break;
			
		case "kala_phone":
			scr_text(spr_temmie, 1, "This must be Kala's phone. Although...");
			scr_text(spr_temmie, 1, "If I pull up the lock screen...");
			scr_text(spr_laser, 1, "That's a picture of our eyewitness, Leif.");
			scr_text(spr_laser, 1, "You think they were friends or something?");
			scr_text(spr_temmie, 1, "I dunno, but this will probably be useful for later.");
			scr_add_items(["Kala's phone"]);
			scr_remove_from_room(room, itm_phone);
			break;
	}
}