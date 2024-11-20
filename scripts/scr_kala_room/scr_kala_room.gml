// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_kala_room(_text_id){
	switch (_text_id) {
		case "solved":
			scr_text(spr_temmie, 1, "So this is what you've been hiding...");
			scr_room_goto(rm_realm);
			break;
			
		case "unsolved":
			scr_text(spr_temmie, 1, "Y'know, maybe Laser was right. Maybe I am bad at puzzles...");
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
				scr_text(spr_temmie, 1, "Hmm... I'll save this for later.");
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