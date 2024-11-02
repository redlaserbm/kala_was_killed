// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @param _text_id
function scr_dialogue(_text_id){
	
	switch(_text_id) {
		case "convo":
			scr_text(spr_laser, 1, "Just got my hip thrusts in at the gym, ask me anything!");
			scr_text(spr_temmie, 1, "You have *zero* play.");
			scr_text(spr_laser, 1, "That's... not a question...");
			scr_text(spr_laser, 1, "That's just you making fun of my inability to pick up women.");
			scr_text(spr_temmie, 1, "Ok, and?");
			scr_text(spr_laser, 1, "I hate you.");
			scr_text(spr_temmie, 1, "No you don't.");
			break;
		
		case "debrief":
			scr_text(spr_leif, 0, "Yeah, so I called you guys in here because we got a serious matter on our hands.");
			scr_text(spr_temmie, 0, "Mhmm...");
			scr_text(spr_leif, 0, "So it seems, someone was recently murdered nearby.");
			scr_text(spr_temmie, 0, "Oh no, how sad. (Not really.)",);
			scr_text(spr_leif, 0, "Yeah, I think someone needed to kick off the plot to their sweet little video game and didn't know how else to do it.");
			scr_text(spr_leif, 0, "Tbh, I was just watching the local news while out for lunch at the restaurant and got word of the case then."); 
			scr_text(spr_temmie, 0, "So what's cyclops sitting next to me got to do with this?");
			scr_text(spr_leif, 0, "Well, Temmie, you and him are gonna work together to solve this murder mystery that's on our hands.");
			scr_text(spr_temmie, 0, "WHAT?!");
			scr_text(spr_laser, 0, "Woohoo! I'm gonna be a detective! Detective Laser, on the case!");
			scr_text(spr_temmie, 0, "Leif, you can't fuckin' do this to me. You do not know half the disappointment this... creature posing as a man is to me.");
			scr_text(spr_leif, 0, "Okay, okay, okay, Temmie, listen up. *clears throat*.");
			scr_text(spr_leif, 0, "This man has a freaking Ph.D. You are literally standing in the same room as a freaking doctor.");
			scr_text(spr_temmie, 0, "A doctor of freaking numbers. How tf is that gonna help in a murder investigation?");
			scr_text(spr_laser, 0, "Well, thanks to my help last week we *were* able to figure out the case of who ate 9.");
			scr_text(spr_temmie, 0, "...");
			scr_text(spr_laser, 0, "It was 7 btw.");
			scr_option("stfu twink", "debrief_twink");
			scr_option("No, it wasn't", "debrief_gaslight");
			break;
			
			case "debrief_twink":
				scr_text(spr_laser, 0, "Whatever hoe.");
				break;
				
			case "debrief_gaslight":
				scr_text(spr_laser, 0, "Don't gaslight me.");
				break;
			
		case "scenario":
			scr_text(noone, 0, "The year is 2025. Or maybe it's 2026? idk. It's hard to tell because you've been trapped in an elevator for what feels like forever.");
			scr_text(noone, 0, "This would not be so bad if your smartass \"friend\" Laser wasn't *also* in here throwing a pissy fit about the whole situation.");
			scr_text(spr_laser, 1, "Hey, buddy, I can hear you. Can you narrate without being a total jackass?");
			scr_text(noone, 0, "Oh, uh, sure, yeah, you got it buddy. (kys)");
			scr_text(spr_laser, 1, "Thanks.");
			scr_text(noone, 0, "Anyways, you're trapped in an elevator and need to find a way out, kinda like in one of those escape rooms.");
			scr_text(noone, 0, "There's a panel at the end and if you push the right buttons on it you can escape.");
			scr_text(noone, 0, "Ok that's enough narration, good luck on escaping!");
			scr_text(spr_temmie, 1, "...");
			break;
			
		case "elevator_panel_first_visit":
			// This conversations triggers during the first time you exit the elevator panel.
			scr_text(spr_laser, 1, "You *sure* you know what you're doing? I sense a lot of mindless fiddling about.");
			scr_text(spr_temmie, 1, "I will fight you.");
			scr_text(spr_laser, 1, "...");
			break;
			
		case "elevator_panel_second_visit":
			scr_text(spr_laser,1, "Y'know, you're only supposed to press *one* button, that *one* button being for the *one* floor you want to go to.");
			scr_text(spr_laser, 1, "Here, let me try that shit... Uhh... Let's go to floor 1. *click*");
			scr_text(spr_temmie, 1, "...");
			scr_text(spr_laser, 1, "...");
			scr_text(spr_temmie, 1, "Laser...");
			scr_text(spr_laser, 1, "Why tf are we not moving?");
			scr_text(spr_temmie, 1, "Okay smartass, clearly we are in one of those stupid puzzles where things are not as they seem.");
			scr_text(spr_temmie, 1, "If it really was *that* easy, we would've already been out of here by now. But we are not.");
			scr_text(spr_temmie, 1, "So, for now, how about you stfu and let me solve the puzzle so we can both get out of here, ok?");
			scr_text(spr_laser, 1, "*sigh* Fine... (whatever bitch)");
			scr_text(spr_temmie, 1, "Glad we're on the same page! :)");
			break;
			
		case "elevator_solved":
			scr_text(spr_laser, 1, "Woah, we're moving! You solved it?");
			scr_text(spr_temmie, 1, "You sound surprised.");
			scr_text(spr_laser, 1, "Well, I mean, you don't strike me as the kind of person that's good at puzzles.");
			if itm_panel.state.panel_visits >= 2 {
				scr_text(spr_temmie, 1, "You pressed a single button on the panel and stood there and did nothing like that was gonna solve anything. I don't wanna hear it.");
				scr_text(spr_laser, 1, "Ok, but I *was* on to something, you gotta admit that, no?");
				scr_text(spr_temmie, 1, "...");
				scr_text(spr_temmie, 1, "No, you weren't. Anyways, let's get out of here.");
			} else {
				scr_text(spr_temmie, 1, "Dude.");
				scr_text(spr_temmie, 1, "I needed less than two tries to get the right combo. I know what I'm doing. You don't.");
				scr_text(spr_laser, 1, "I still could've solved it faster tho. I'm like, super smart you just haven't seen it yet.");
				scr_text(spr_temmie, 1, "...");
				scr_text(spr_temmie, 1, "C'mon dumdum, let's get out of here.");
			}
			scr_flag("elevator_rumble", false, false);
			array_push(end_action, function() {
			instance_create_depth(0,0,depth, obj_victory);	
			});
			break; 
		
		case "elevator_poster_laser":
			scr_text(spr_temmie, 1, "Laser... You disappoint me.");
			scr_text(spr_laser, 1, "Wtf did I do I literally did nothing");
			scr_text(spr_temmie, 1, "Explain to me what's happening with this poster then.", [scr_draw_sprite(spr_poster, 0, 150,0)]);
			scr_text(spr_laser, 1, "It's a rizz hotline. People call me and I rizz them up. For a fee.");
			scr_text(spr_temmie, 1, "...");
			scr_text(spr_laser, 1, "It's my side gig.");
			scr_text(spr_temmie, 1, "It's embarrassing.");
			scr_text(spr_laser, 1, "Temmie, there's *nothing* embarrassing about rizzing up these hoes the way I do.");
			scr_text(spr_temmie, 1, "Suure...");
			scr_text(spr_laser, 1, "Y-You're just mad that I'm getting all the ladies and you're not!");
			scr_text(spr_temmie, 1, "Suuuuuure....");
			scr_text(spr_laser, 1, "Don't say \"sure\" like that you're hurting my self-confidence...");
			scr_text(spr_temmie, 1, "Suuuuuuuuuuuure...");
			scr_text(spr_laser, 1, "...");
			break; 
			
		case "elevator_poster_laser_1":
			scr_text(spr_temmie, 1, "I didn't even notice the first time around, the phone number isn't even formatted correctly!",  [scr_draw_sprite(spr_poster, 0, 150,0)]);
			scr_text(spr_laser, 1, "Wait it isn't?");
			scr_text(spr_laser, 1, "...");
			scr_text(spr_laser, 1, "Oh shit it isn't...");
			scr_text(spr_laser, 1, "Ok well I still get calls from all the hoes tho. Like, the numerals are still all correct and stuff.");
			scr_text(spr_temmie, 1, "...");
			scr_text(spr_laser, 1, "I mean, you can call the line yourself if you need some rizz tips from the god-tier rizzler himself, Laser. (*sunglasses emote*)");
			scr_text(spr_temmie, 1, "...");
			scr_text(spr_temmie, 1, "I want to kill myself.");
			scr_text(spr_laser, 1, "ok");
			break;
			
		case "elevator_poster_laser_2":
			scr_text(spr_laser, 1, "Pay attention to the phone number Temmie, it's *very* important.", [scr_draw_sprite(spr_poster, 0, -75,0)]);
			scr_text(spr_temmie, 1, "Laser.");
			scr_text(spr_laser, 1, "Yes, Temmie?");
			scr_text(spr_temmie, 1, "I am not taking \"rizz\" tips from a touch-deprived robot with no game.");
			scr_text(spr_laser, 1, "No bitch, I'm talking about for getting out of this damned elevator.");
			scr_option("What do you mean?", "tip");
			scr_option("whatever hoe", "no_tip");
			break;
			
			case "tip":
				scr_text(spr_laser, 1, "The poster's bottom text defines a function that takes letters to numbers.", [scr_draw_sprite(spr_poster, 0, -75,0)]);
				scr_text(spr_laser, 1, "The top line displays the inputs, in this case, letters, and the bottom line displays the output; numerals.", [scr_draw_sprite(spr_poster, 0, -75,0)]);
				scr_text(spr_laser, 1, "Using this, we can interpret text seen on other posters in this elevator.", [scr_draw_sprite(spr_poster, 0, -75,0)]);
				scr_text(spr_laser, 1, "So, if for instance I see an \"O\", I would interpret that as an 8.", [scr_draw_sprite(spr_poster, 0, -75,0)]);
				scr_text(spr_temmie,1, "Hmm...");
				break;
			
			case "no_tip":
				scr_text(spr_laser, 1, "Don't say I didn't try to help you.");
				scr_text(spr_temmie, 1, "..."); 
				break;
			
		case "elevator_poster_laser_3":
			scr_text(spr_temmie, 1, "...", [scr_draw_sprite(spr_poster, 0, 150,0)]);
			scr_text(spr_laser, 1, "I think what's happening is the poster implictly defines a function whose input is letters and whose output is numerals.");
			break;
			
		case "elevator_poster_temmie":
			scr_text(spr_laser, 1, "Woah, Temmie, I didn't know you were a lawyer!", [scr_draw_sprite(spr_poster, 2, -75,0)]);
			scr_text(spr_temmie, 1, "It's my side gig. It's how I make extra $$$.");
			scr_text(spr_laser, 1, "Wait, so, what kind of lawyer stuff do you specialize in?");
			scr_text(spr_temmie, 1, "Uhh... Murder. Homicide. Arson. Kidnapping...");
			scr_text(spr_temmie, 1, "I'm a pro se defense attorney.");
			scr_text(spr_laser,1, "Pro se? What does that mean?");
			scr_text(spr_temmie, 1, "Don't worry about it.");
			scr_text(spr_laser, 1, "...ok.");
			break;
			
		case "elevator_poster_temmie_1":
			scr_text(spr_temmie, 1, "...",  [scr_draw_sprite(spr_poster, 2, 150,0)]);
			scr_text(spr_laser, 1, "Ok, so let's suppose like, I murdered someone in cold blood. Y'know, a hypothetical. (Feds don't watchlist me now)");
			scr_text(spr_laser, 1, "Does that mean you'd defend me in court?");
			scr_text(spr_temmie, 1, "No.");
			scr_text(spr_laser, 1, "Aww man...");
			break;
		
		case "elevator_poster_rito":
			scr_text(spr_laser, 1, "Wait, there's a bird running to be president?", [scr_draw_sprite(spr_poster, 3, -75,0)]);
			scr_text(spr_temmie, 1, "Well, the election in 2004 came down to a giant douche and a turd sandwich.");
			scr_text(spr_laser, 1, "Ok, but isn't giant douche just 100% the superior option there?");
			scr_text(spr_temmie, 1, "...");
			break;
			
		case "elevator_poster_nums":
			scr_text(spr_laser, 1, "Y'know this kinda reminds me of something but I can't quite put my finger on it...", [scr_draw_sprite(spr_poster, 1, -75,0)]);
			scr_text(spr_temmie,1, "Don't...");
			break;
			
		case "Temmie's knife":
			scr_text(spr_laser, 1, "Y'know, you shouldn't run around with sharp objects like that...");
			scr_text(spr_temmie, 1, "Why not?");
			scr_text(spr_laser, 1, "I don't trust you with sharp objects.");
			scr_text(spr_temmie, 1, "I will stab you with this.");
			scr_text(spr_laser, 1, "This is why I don't trust you.");
			scr_open_inventory();
			break;
			
		// CUTSCENE DIALOGUE 
		
	}
}