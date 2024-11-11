// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_interrogation(_text_id){
	
	switch (text_id) {
		case "testimony":
			scr_text(spr_temmie, 1, "Can you run through what happened at the scene of the crime one more time?");
			scr_text(spr_leif, 1, "Sure. At about 9pm I was walking along the side of the road, when suddenly, a tree started falling on the road!");
			scr_text(spr_leif, 1, "At the same time, Kala was approaching the tree in her car going really fast and veered left to dodge it.");
			scr_text(spr_leif, 1, "As she did that, she lost control of the car, spun it around backwards, and ended up hitting that house over there.");
			scr_text(spr_laser, 1, "Not just *any* house. *My* house.");
			scr_text(spr_temmie, 1, "Y'know, thinking about it in hindsight, I'm kinda glad it was *your* house that got hit and not someone else's.");
			scr_text(spr_laser, 1, "...");
			scr_text(spr_temmie, 1, "Anyways, go on Leif.");
			scr_text(spr_leif, 1, "I was surprised no one else came to help Kala's after the crash. The lights were on at Laser's house but...");
			scr_text(spr_laser, 1, "I wasn't home. I was tending to job duties at the time.");
			
			scr_text(spr_temmie, 1, "Hmm... something seems off about Leif's testimony but I'm not sure where to begin, maybe I should question Leif about...");
			
			scr_option("the lights being on at Laser's house", "ce_help");
			scr_option("how the car crash occurred", "ce_car");
			break;
			
		case "something_off_partial":
			scr_text(spr_temmie, 1, "(Hmm... I still think there's more to Leif's testimony I need to explore...)");
			if !obj_game.state.flags.interrogation_car {
				scr_text(spr_temmie, 1, "(I still need to question Leif about how the car ended up inside Laser's house...)");
				scr_goto("ce_car", scr_interrogation);
			} else {
				scr_text(spr_temmie, 1, "(I still need to question Leif about the lights being on at Laser's house...)");
				scr_goto("ce_help", scr_interrogation);
			}
			break;
		
		case "ce_car":
			scr_text(spr_temmie, 1, "Leif, when you say that Kala lost control of her car on the road and crashed into Laser's house... I don't believe you.");
			scr_text(spr_leif, 1, "Why's that?");
			scr_text(spr_temmie, 1, "The reason why is... (Which item in my inventory contradicts Leif's account?)");
			scr_open_inventory("Road observation", {text_id: "ce_car_correct", dictionary: scr_interrogation}, {text_id: "incorrect", dictionary: scr_interrogation});
			break;
			
		case "ce_car_correct":
			obj_game.state.flags.interrogation_car = true;
			scr_text(spr_temmie, 1, "Kala couldn't have swerved to avoid a falling tree if there were no swerve marks on the road to begin with!");
			scr_text(spr_leif, 1, "Oh shit");
			if obj_game.state.flags.interrogation_car && obj_game.state.flags.interrogation_help {
				scr_goto("hiding_something", scr_interrogation);
			} else {
				scr_goto("something_off_partial", scr_interrogation);
			}
			break;
			
		case "ce_help":
			scr_text(spr_temmie, 1, "You said that no one came to help even though the lights were on at Laser's house, yes?");
			scr_text(spr_leif, 1, "Yeah. What's wrong with that?");
			scr_text(spr_temmie, 1, "The issue with that is...");
			scr_open_inventory("Power lines", {text_id: "ce_help_correct", dictionary: scr_interrogation}, {text_id: "incorrect", dictionary: scr_interrogation});
			break;
			
		case "ce_help_correct":
			obj_game.state.flags.interrogation_help = true;
			scr_text(spr_temmie, 1, "Since the tree knocked down power lines when it fell, the lights couldn't have been on at Laser's house at the time of the crash!");
			scr_text(spr_leif, 1, "Oh shit");
			if obj_game.state.flags.interrogation_car && obj_game.state.flags.interrogation_help {
				scr_goto("hiding_something", scr_interrogation);
			} else {
				scr_goto("something_off_partial", scr_interrogation);
			}
			break;
		
		case "hiding_something":
			scr_text(spr_temmie, 1, "Leif, are you hiding something from us?");
			break; 
			
		case "incorrect":
			scr_text(spr_laser, 1, "Haha you got it wrong lol");
			scr_text(spr_temmie, 1, "I will murder you and your whole entire family.");
			scr_text(spr_temmie, 1, "Anyways, let's try this again.");
			scr_open_inventory();
			break;
	}
	
	
}