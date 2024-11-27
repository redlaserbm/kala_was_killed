// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_kala_room(_text_id){
	switch (_text_id) {
		case "frame_solved":
			if !obj_game.state.flags.frame_solved {
				scr_text(spr_temmie, 0, "Oh, hey, I got it!");
				scr_text(spr_temmie, 0, "And Laser said I was bad at puzzles...");
				scr_text(spr_temmie, 0, "Hmm...");
			}
			scr_text(spr_temmie, 0, "Well, it's a secret passage alright!");
			scr_text(noone, 0, "Do you want to enter through the portal?");
			scr_option("Yes", "frame_solved_yes");
			scr_option("No" , "frame_solved_no");
			break;
			
		case "frame_solved_yes":
			scr_room_goto(rm_realm);
			instance_destroy();
			break;
			
		case "frame_solved_no":
			scr_text(spr_temmie, 0, "Lemme search around a little more...");
			scr_text(spr_temmie, 0, "Juuust in case I missed something.");
			break;
		
		case "frame_curious":
			scr_text(spr_temmie, 1, "Huh, what's this thing?");
			scr_room_goto(rm_kala_frame);
			break;
		
		case "start":
			scr_text(spr_temmie, 1, "Ok Kala, time for me to play your little game of hide-and-seek...");
			break;
			
		case "secret_passage":
			scr_text(spr_temmie, 1, "Leif said something about there being a secret passage...");
			scr_text(spr_temmie, 1, "Could this be it? If it is though, how do I access it?");
			break;
			
		case "secret_passage_look":
			scr_text(spr_temmie, 1, "Well... It's got the \"secret passage\" look to it, but it doesn't look like it's completely set up.");
			scr_text(spr_temmie, 1, "Maybe I can activate it myself...");
			break;
			
		case "comp_find":
			scr_text(spr_temmie, 1, "Maybe there's something useful on her computer?");
			scr_room_goto(rm_kala_comp);
			break;
			
		case "solved":
			scr_text(spr_temmie, 1, "So this is what you've been hiding...");
			scr_room_goto(rm_realm);
			break;
			
		case "bad_at_puzzles":
			scr_text(spr_temmie, 1, "Y'know, maybe Laser was right. Maybe I am bad at puzzles...");
			scr_text(spr_temmie, 1, "*sigh*"); 
			scr_text(spr_temmie, 1, "Ok, there's gotta be *something* around here that can explain what's happening...");
			scr_room_goto(rm_kala);
			break;
		
		case "comp_react":
			scr_text(spr_temmie, 1, "Huh? Something moved in the background...");
			break;
			
		case "temmie_news":
			scr_text(spr_temmie, 1, "Hm...");
			scr_text(spr_temmie, 1, "It's a news article from the time Laser's house blew up.");
			scr_text(noone, 0, "Do you want to read the newspaper?");
			scr_option("Yes", "temmie_read");
			scr_option("No", "temmie_news_store");
			break;
			
			case "temmie_read":
				itm_news.state.context = "second_view";
				scr_activate(itm_news);
				instance_destroy();
				break;
				
			case "temmie_news_store":
				scr_text(spr_temmie, 1, "Okay, I'll save this for later.");
				scr_add_items(["Newspaper"]);
				scr_remove_from_room(room, itm_news);
				break;
				
		case "journal":
			scr_text(spr_temmie, 1, "A journal?");
			scr_text(spr_temmie, 1, "...and it has Kala's name on it.");
			scr_text(spr_temmie, 1, "A part of me wants to take the journal --- It might help me figure out whatever Leif was saying about Kala's secret.");
			scr_text(spr_temmie, 1, "On the other hand, that's Kala's personal belongings. I really shouldn't meddle in that stuff...");
			scr_text(noone, 1, "Do you want to take Kala's journal?");
			scr_option("Yes", "journal_yes");
			scr_option("No", "journal_no");
			break;
			
			case "journal_yes":
				scr_add_items(["Kala's journal"]);
				scr_remove_from_room(room, itm_journal);
				instance_destroy();
				break;
				
			case "journal_no":
				scr_text(spr_temmie, 1, "Hm...");
				scr_text(spr_temmie, 1, "I think I'll leave it be.");
				break;
		
		case "comp_discord":
			scr_text(spr_temmie, 1, "Laser add details here.");
			break;
		
		case "comp_control":
			scr_text(spr_temmie, 1, "Laser, you also need details here.");
			break;
	}
}