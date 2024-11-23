// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_interrogation(_text_id){
	
	switch (_text_id) {
		case "testimony":
			scr_text(spr_temmie, 1, "Can you run through what happened at the scene of the crime one more time?");
			scr_text(spr_leif, 1, "Sure. At about 9pm I was walking along the side of the road, when suddenly, a tree started falling onto the road!");
			scr_text(spr_leif, 1, "At the same time, Kala was approaching the tree in her car going really fast and veered left to dodge it.");
			scr_text(spr_leif, 1, "As she did that, she lost control of the car, spun it around backwards, and ended up hitting that house over there.");
			scr_text(spr_laser, 1, "Not just *any* house. *My* house.");
			scr_text(spr_temmie, 1, "Y'know, thinking about it in hindsight, I'm kinda glad it was *your* house that got hit and not someone else's.");
			scr_text(spr_laser, 1, "...");
			scr_text(spr_temmie, 1, "Anyways, go on Leif.");
			scr_text(spr_leif, 1, "I was surprised no one else came to help Kala after the crash. The lights were on at Laser's house but...");
			scr_text(spr_laser, 1, "I wasn't home. I was tending to job duties at the time.");
			
			scr_text(spr_temmie, 1, "Hmm... something seems off about Leif's story just now but I'm not sure where to begin, maybe I should question Leif about...");
			
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
			scr_text(spr_temmie, 1, "The reason why is... ");
			scr_open_inventory("ce_car");
			break;
			
		case "ce_car_counter":
			scr_text(spr_temmie, 1, "I don't think *Kala* crashed the car into the wall.");
			scr_text(spr_temmie, 1, "I think you rigged the car to crash with this brick!");
			scr_text(spr_leif, 1, "Nice theory, but there's one problem, Temmie.");
			scr_text(spr_temmie, 1, "What's the problem?");
			scr_text(spr_leif, 1, "Kala definitely crashed the car, I saw it with my own eyes.");
			scr_text(spr_leif, 1, "The brick probably landed there by chance after the accident occurred.");
			scr_text(spr_temmie, 1, "(Hmm... I still think Leif is suspicious, but I need to present another piece of evidence.)");
			scr_text(spr_temmie, 1, "(Is there anything I can present that invalidates the basis of Leif's argument just now?)");
			obj_game.state.flags.interrogation_nuance = true;
			scr_open_inventory();
			break;
			
		case "ce_car_correct":
			obj_game.state.flags.interrogation_car = true;
			scr_text(spr_temmie, 1, "Kala couldn't have swerved to avoid a falling tree if there were no swerve marks on the road to begin with!");
			scr_text(spr_leif, 1, "Oh uh... Maybe she was just really good at swerving? I don't know what to tell you man, I *definitely* saw her crash the car.");
			scr_text(spr_temmie, 1, "Leif, I'm gonna be honest. You are not a good liar. I can tell when you're lying. Don't lie to me, ok?");
			scr_text(spr_leif, 1, "...");
			scr_text(spr_leif, 1, "Ok.");
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
			scr_open_inventory("ce_help");
			break;
			
		case "ce_help_correct":
			obj_game.state.flags.interrogation_help = true;
			scr_text(spr_temmie, 1, "Since the tree knocked down power lines when it fell, the lights couldn't have been on at Laser's house at the time of the crash!");
			scr_text(spr_leif, 1, "Oh... uh... maybe Laser is smart and has a backup generator?");
			scr_text(spr_laser, 1, "The agency tells me I can't have those around my place, something about it being a \"shock risk\".");
			scr_text(spr_leif, 1, "...");
			scr_text(spr_temmie, 1, "...");
			scr_text(spr_leif, 1, "Look, I can explain, I swear!");
			if obj_game.state.flags.interrogation_car && obj_game.state.flags.interrogation_help {
				scr_goto("hiding_something", scr_interrogation);
			} else {
				scr_goto("something_off_partial", scr_interrogation);
			}
			break;
		
		case "hiding_something":
			scr_text(spr_temmie, 1, "Leif, are you hiding something from us?");
			scr_text(spr_leif, 1, "Even if you don't want to believe what I saw, how else do you explain how Kala's car ended up in Laser's house?");
			scr_text(spr_temmie, 1, "(He's got a point... Even if his story is all wrong, I need to find the *right* explanation for how Kala's car ended up there.)");
			scr_text(spr_temmie, 1, "(Maybe there's a piece of evidence I've overlooked previously.)");
			scr_open_inventory("hiding_something");
			break; 
		
		case "brick_theory":
			scr_text(spr_temmie, 1, "I have a theory. I think the whole scene is a setup.");
			scr_text(spr_temmie, 1, "You killed Kala well before this crash occurred, and then tried to make it look like she died in a car crash.");
			scr_text(spr_temmie, 1, "You put Kala in the driver's seat and placed this brick in Kala's car, causing the car to accelerate into Laser's house.");
			if obj_game.state.flags.interrogation_nuance {
				scr_text(spr_leif, 1, "Didn't we go over this already? That brick probably fell on the pedal by coincidence *after* the crash.");
				scr_text(spr_temmie, 1, "What crash? You mean the crash that didn't happen because there weren't any swerve marks on the road?");
				scr_text(spr_leif, 1, "...");
				scr_text(spr_leif, 1, "Ok then, if your theory really is true, then where do you think the car was when I placed the brick inside?");
			} else {
				scr_text(spr_leif, 1, "Hah. That's cute.")
				scr_text(spr_leif, 1, "If that was really the case, where do you think the car was when I placed the brick inside?");
			}
			scr_map_poll("check");
			break;
			
		case "brick_theory_counter":
			itm_map.state.context_check = false;
			scr_text(spr_temmie, 1, "Laser add details here.");
			scr_map_poll("check");
			break;
			
		case "brick_theory_1":
			itm_map.state.context_check = false;
			scr_text(spr_temmie, 1, "Clearly you set the car up near the lake.");
			scr_text(spr_laser, 1, "Wait, Temmie, if Leif put the brick in the car at that spot, and then the car sped into my house...");
			scr_text(spr_laser, 1, "Wouldn't it have impacted my house *front* first instead of *rear* first?");
			scr_text(spr_temmie, 1, "No. I think Leif made a mistake when he rigged Kala's car with the brick.");
			scr_text(spr_temmie, 1, "When he was setting up the scene, he *actually* wanted the car to go here...");
			scr_map_poll("check_1");
			break;
			
		case "brick_theory_2":
			itm_map.state.context_check = false;
			scr_text(spr_temmie, 1, "Leif's mistake was that he accidentally put the car in reverse instead of drive, so the car went the wrong way.");
			scr_text(spr_leif, 1, "This theory stuff is fun and all, but, how can you be so sure that it was *me* who actually placed the brick?");
			scr_text(spr_temmie, 1, "Hmm..."); 
			scr_text(spr_laser, 1, "Hey Temmie, Leif seems really panicked right now about the whole situation. I think he's only feigning confidence in his innocence.");
			scr_text(spr_laser, 1, "If you pull a bluff, he might just fall for it...");
			scr_open_inventory("brick_theory_2");
			break;
			
		case "brick_theory_3":
			scr_text(spr_temmie, 1, "Leif, see this?");
			scr_text(spr_leif, 1, "Oh shoot, my phone, I've been looking for it all day! Where you'd find it?");
			scr_text(spr_temmie, 1, "Inside Kala's car.");
			scr_text(spr_leif, 1, "...");
			scr_text(spr_temmie, 1, "Leif. I know damn well you got your dirty hands involved all over this mess.");
			scr_text(spr_temmie, 1, "So why don't you admit it. You killed her. You tried to hide it. You failed. And I'm gonna lock you up for a long time.");
			scr_text(spr_leif, 1, "...");
			scr_text(spr_leif, 1, "Ok, I've had enough fun playing your what-if game, Temmie.");
			scr_text(spr_leif, 1, "I want you play mine.");
			scr_change_music(snd_still_alive);
			scr_goto("brick_theory_37");
			break;
		
		case "brick_theory_37":
			scr_text(spr_temmie, 1, "Hm?");
			scr_text(spr_leif, 1, "Yeah, you see, what if... Kala was still alive?");
			scr_text(spr_temmie, 1, "That's impossible! We were all over that corpse just now there's no way she could be alive right now.");
			scr_text(spr_laser, 1, "Temmie, I'm telling you, it's just like in those zombie movies!");
			scr_text(spr_temmie, 1, "Laser, respectfully, stfu.");
			scr_text(spr_leif, 1, "I mean, there's no way a car going in reverse could actually go fast enough to kill someone, right?");
			scr_text(spr_leif, 1, "Perhaps, if she was alive before the crash, she would still be alive now.");
			scr_text(spr_leif, 1, "Maybe you're right. Maybe Kala did go for a backwards ride in her car straight into Laser's house.");
			scr_text(spr_leif, 1, "But maybe you're also wrong. Maybe she's woken up at this point. Maybe she's started running away.");
			scr_text(spr_temmie, 1, "Running away?");
			scr_text(spr_leif, 1, "Well, she's hiding a secret from you guys, and that secret is the very reason she would be running away right now.");
			scr_text(spr_leif, 1, "Do they really keep you in the dark about all this? Your none the wiser about the drama within your own agency!");
			scr_text(spr_leif, 1, "It's like I'm talking to a pawn on the chess board...");
			scr_text(spr_temmie, 1, "(Huh? I'm getting a transmission from the police chief...)");
			scr_text(spr_jakkop, 1, "Hey uh, Temmie, we got a problem at the crime scene, you're gonna wanna take notes.");
			scr_text(spr_temmie, 1, "What the hell happened this time?");
			scr_text(spr_jakkop, 1, "Yeah so get this, there was a dead body inside the car, and now there isn't.");
			scr_text(spr_temmie, 1, "How do you miss a whole entire dead body disappearing?");
			scr_text(spr_jakkop, 1, "Yeah so get this, I was hungry and wanted food, so I drove off to the donut shop to get some donuts, and then I came back.");
			scr_text(spr_temmie, 1, "This is ridiculous!");
			scr_text(spr_jakkop, 1, "Yeah idk where she went but uh, I guess that's your job now to go find her uhhh, yeah good luck.");
			scr_goto("brick_theory_5");
			break;
			
		case "brick_theory_5":
			scr_text(spr_leif, 1, "I happen to know exactly where she's disappeared off to. And I'll be happy to tell you...");
			scr_text(spr_temmie, 1, "Ok then, tell us jackass.");
			scr_text(spr_leif, 1, "...on the condition that I get to walk free.");
			scr_text(spr_temmie, 1, "What?");
			scr_text(spr_leif, 1, "Temmie, think about it this way. You thought I killed someone. That someone is running off free into the distance.");
			scr_text(spr_leif, 1, "Try placing me in a court of law and see how far the prosecution's case goes.");
			scr_text(spr_laser, 1, "You literally destroyed my house! Do you realize how long it's gonna take to fix that?");
			scr_text(spr_laser, 1, "Every day that house isn't fixed is a day I can't let robo junk hang in the comfort of my own kitchen.");
			scr_text(spr_temmie, 1, "(look of absolute disgust)");
			scr_text(spr_temmie, 1, "Ok Leif, I get it. Tell me where she is and I'll let you go.");
			scr_text(spr_laser, 1, "What? That's thousands in property damage he caused it's literally a slam dunk case if we bring him in!");
			scr_text(spr_laser, 1, "We got him admitting to the crime and then some!");
			scr_text(spr_temmie, 1, "I don't want to hear it also you totally deserved it if *that's* what you do in your kitchen.");
			scr_text(spr_temmie, 1, "Leif, where is she?");
			
			scr_text(spr_leif, 1, "It's... kinda complicated. To be honest, she didn't tell me a lot either, just a few hints about where she might be.");
			scr_text(spr_leif, 1, "But you should check her apartment complex. There's a secret passage she's forged inside her room which she probably darted off to.");
			scr_text(spr_leif, 1, "Before you go, however, you should take this. It's a copy of Kala's key.");
			scr_text(spr_leif, 1, "Once you get in, it's up to you to figure out how to access the secret passage.");
			scr_add_items(["Kala's key"]);
			scr_goto("interrogation_end");
			break;
			
		case "interrogation_end":
			scr_text(spr_temmie, 1, "Hmm... I see.");
			scr_text(spr_temmie, 1, "Hey, Laser.");
			scr_text(spr_laser, 1, "Yes?");
			scr_text(spr_temmie, 1, "I need you to stay behind and supervise the release of Leif.");
			scr_text(spr_laser, 1, "Why are we releasing him aga---", [scr_force_go()]);
			scr_text(spr_temmie, 1, "Just do it, I don't want to hear any backtalk.");
			scr_text(spr_laser, 1, "...");
			scr_text(spr_temmie, 1, "Thanks, butler.");
			scr_text(spr_laser, 1, "Is that all I am to you?");
			scr_text(spr_temmie,1, "...");
			scr_text(spr_temmie, 1, "Yes.");
			scr_text(spr_laser, 1, "*sigh*");
			scr_goto("interrogation_end_1");
			scr_remove_items(["Laser", "Power lines", "Road observation", "Leif's brick", "Crime scene map", "Kala's phone"]);
			break;
			
			
		case "interrogation_end_1":
			scr_text(noone, 0, "Laser escorts Leif out of the room. You are now alone.");
			obj_game.state.flags.temmie_alone = true;
			scr_text(spr_temmie, 1, "(I need to figure out Kala's whereabouts...)");
			scr_text(spr_temmie, 1, "(This key from Leif will get me into her apartment room...)");
			scr_text(spr_temmie, 1, "(But from there, I'll need to figure out how to access that secret passage...)");
			scr_room_goto(rm_kala);
			break;
			
		case "incorrect":
			var _detective = obj_inventory.state.detective;
			obj_inventory.state.detective = noone;
			scr_text(spr_laser, 1, "Haha you got it wrong lol");
			scr_text(spr_temmie, 1, "I will murder you and your whole entire family.");
			scr_text(spr_temmie, 1, "Anyways, let's try this again.");
			scr_open_inventory(_detective);
			break;
			
		case "incorrect_map":
			var _context = itm_map.state.context_check;
			itm_map.state.context_check = false;
			scr_text(spr_laser, 1, "Haha you got it wrong lol");
			scr_text(spr_temmie, 1, "I will murder you and your whole entire family.");
			scr_text(spr_temmie, 1, "Anyways, let's try this again.");
			scr_map_poll(_context);
			break;
	}
	
	
}