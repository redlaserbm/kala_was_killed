// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Primary dictionary for scene 4
function scr_confrontation(_text_id){
	switch (_text_id) {
		case "found": 
			scr_text(spr_kala, 1, "Huh?");
			scr_text(spr_temmie,1, "There you are!");
			scr_text(spr_kala, 1, "...");
			
			// Laser please add details here
			
			scr_text(spr_temmie, 1, "Kala, I was an art student like you. I had dreams and aspirations just like you did.");
			scr_text(spr_temmie, 1, "Everything you did here... you denied me those dreams. You're the reason I had to drop out and take this odd job in order to make ends meet.");
			scr_text(spr_temmie, 1, "I didn't have a chance because of you!");
			
			scr_text(spr_kala, 1, "...");
			scr_text(spr_kala, 1, "Boohoo.");
			scr_text(spr_kala, 1, "I had to do what I did to make my ends meet as well.");
			scr_text(spr_kala, 1, "They knew I was too good at what I did. They knew I was too powerful. They tried to stop me from doing what I wanted to do.");
			scr_text(spr_temmie, 1, "They?");
			scr_text(spr_kala, 1, "Your department.");
			scr_text(spr_kala, 1, "They tried to stop me from getting my art supplies.");
			scr_text(spr_kala, 1, "I knew no other way to succeed in life. They tried to starve me.");
			break;
			
		case "make_ends_meet":
			scr_text(spr_temmie, 1, "Make ends meet? What do you mean? You're famous over social media, there's no way in hell you could be struggling to live.");
			scr_text(spr_kala, 1, "Exposure doesn't pay bills, Temmie. Money does.");
			scr_text(spr_kala, 1, "Let me remind you how this industry works. Only a select few who ever go down the route I go get to live off of it.");
			scr_text(spr_kala, 1, "And of those who do, only a few get rich from doing so.");
			scr_text(spr_kala, 1, "I don't do what I do out of spite. I do it because I get kicked out of my place if I don't.");
			scr_text(spr_temmie, 1, "...");
			break;
			
		case "make_ends_meet_1":
			scr_text(spr_kala, 1, "What's funny about your sob story is that you live easier than I do.");
			scr_text(spr_temmie, 1, "Meaning?");
			scr_text(spr_kala, 1, "You don't struggle with bills like I do. Sick days and bad mental health don't cost you your livelihood.");
			scr_text(spr_kala, 1, "Your retarded robot sidekick lives lavish enough to have his own house!");
			scr_text(spr_kala, 1, "He lives lavish enough to afford to put it back together after it gets blown to smithereens!");
			scr_text(spr_temmie, 1, "...");
			scr_text(spr_kala, 1, "You should be thanking me for what I did.");
			scr_text(spr_kala, 1, "I put you down a more stable career path; one where you don't have to resort to shady tactics just to pay off rent.");
			break;
			
		case "temmie_dream":
			scr_text(spr_temmie, 1, "Kala... It was never about the money for me.");
			scr_text(spr_temmie, 1, "It was about the dream.");
			scr_text(spr_temmie, 1, "And it's not just about my dream, but the dreams of all my former classmates, and all the other aspiring artists I've met in my time.");
			break;
	}
}