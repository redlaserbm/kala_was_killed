// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Primary dictionary for scene 4
function scr_confrontation(_text_id){
	switch (_text_id) {
		
		case "found":
			scr_text(spr_kala, 1, "Huh?");
			scr_text(spr_temmie, 1, "There you are...");
			
			scr_text(spr_kala, 1, "So, you know about what happened those years ago?");
			scr_text(spr_kala, 1, "...");
			scr_text(spr_kala, 1, "The story the public heard was that an arsonist caused the explosion.");
			scr_text(spr_kala, 1, "The reality was, he just blew up...");
			scr_text(spr_kala, 1, "I don't know why it happened, the software they gave me to use on him was buggy, but...");
			scr_text(spr_kala, 1, "One day, he was fine, the next day, I look at the news and see rubble."); 
			scr_text(spr_kala, 1, "And right then, the agency bagged my head and brought me into that very interrogation room you were at earlier.");
			
			scr_text(spr_temmie, 1, "...");
			scr_text(spr_kala, 1, "They didn't want me to testify in court, because they didn't want the word to get out about what *really* happened that day.");
			scr_text(spr_kala, 1, "If it did, the government would pulled all the funding for Laser right then and there."); 
			scr_text(spr_kala, 1, "Public trust in the LIA would've completely evaporated.");
			scr_text(spr_kala, 1, "The agency would've dissolved. None of us would've had jobs. Not even you.");
			scr_text(spr_temmie, 1, "...");
			scr_text(spr_kala, 1, "They offered me a deal.");
			scr_text(spr_kala, 1, "They wouldn't prosecute me, and the truth wouldn't come out, as long as I stayed on board and helped fix up their little mess.");
			
			scr_text(spr_temmie, 1, "Why wouldn't they just hire someone else?");
			scr_text(spr_kala, 1, "Model rigging isn't a one-size fits all kinda job. You can't just give my work to someone else and they just do it.");
			scr_text(spr_kala, 1, "It doesn't work like that. At least, not without the notes I've written down about the job.");
			scr_text(spr_kala, 1, "I stashed them somewhere safe so I could leverage my ability against them.");
			scr_text(spr_kala, 1, "If I didn't, they probably would've thrown me in a jail cell anyways.");
			
			scr_text(spr_temmie, 1, "But why run now after all this time?");
			scr_text(spr_temmie, 1, "They gave you a deal, they let you run free. So, everything worked out in the end, no?");
			scr_text(spr_kala, 1, "No, it didn't.");
			
			scr_text(spr_kala, 1, "They kept me on, but they docked my pay in the process. I couldn't speak up about it.");
			scr_text(spr_temmie, 1, "Why not?");
			scr_text(spr_kala, 1, "It was either poor pay and a job or no pay and a jail cell.");
			scr_text(spr_kala, 1, "Even if they didn't want the secret to get out, they still had this to leverage against me.");
			scr_text(spr_kala, 1, "It turns out the LIA is an awful place to work for.");
			scr_text(spr_kala, 1, "I got micromanaged super hard after the explosion.");
			scr_text(spr_kala, 1, "I had so many supervisors constantly calling me out for the most minor, most imperceptible imperfections in my work.")
			scr_text(spr_kala, 1, "I'd meet up with them twice a week to have them belittle me for every little shortcoming that showed through the microscope.");
			
			scr_text(spr_kala, 1, "I told them the rent was hard to make. I asked for half my cut back. I told them I was doing everything and then some to keep the project afloat.");
			scr_text(spr_kala, 1, "They spat in my face over it.");
			scr_text(spr_kala, 1, "After all the abuse they put me through, they had the gall to tell me that I'm supposed to be grateful for it all, grateful that I'm not jailed.");
			scr_text(spr_kala, 1, "But truthfully, this life might as well feel like jail right now.");
			
			scr_text(spr_temmie, 1, "...");
			scr_text(spr_kala, 1, "Every little transgression put me closer and closer to that breaking point until, finally, we ended up here.");
			scr_text(spr_temmie, 1, "...");
			scr_text(spr_kala, 1, "Well, I managed to make it all the away over here, only for you to drag me back into this mess.");
			scr_text(spr_temmie, 1, "...");
			scr_text(spr_kala, 1, "But, Temmie, it doesn't have to be like this.");
			scr_text(spr_kala, 1, "They don't have to know this exchange between us ever happened.");
			scr_text(spr_kala, 1, "You can just say that I got away. They can clean up the mess later. I can figure out my life later too.");
			scr_text(spr_kala, 1, "...Just keep your distance away from Laser for a bit, ok?");
			scr_text(spr_temmie, 1, "What do you mean?");
			scr_text(spr_kala, 1, "Let's just say I might've done another oopsies in his rigging as a parting gift for the agency.");
			
			scr_text(spr_kala, 1, "...");
			scr_text(spr_temmie, 1, "Kala, I have a job to do.");
			scr_text(spr_kala, 1, "And what good does it do for you to do that job?");
			scr_text(spr_kala, 1, "I did my job, and look where that got me.")
			scr_text(spr_kala, 1, "...");
			scr_text(spr_kala, 1, "Whatever, go ahead, detain me, enrich your career, see far how up you can climb the ladder before they knock *you* down.");
			
			scr_text(noone, 1, "Do you want to detain Kala?");
			scr_option("Yes", "kala_detain");
			scr_option("No", "kala_free");
			break;
			
		case "kala_free":
			if scr_check_item("Kala's journal") {
				scr_goto("kala_free_good");	
			} else {
				scr_goto("kala_free_bad");
			}
			instance_destroy();
		
		case "kala_free_good":
			scr_text(spr_temmie, 1, "(After all they put her through, I couldn't stomach jailing her and putting her through even more hell.)");
			scr_text(spr_temmie, 1, "(At the same time, even if Kala wasn't clear about it, I got the gist that she rigged Laser to blow up.)");
			scr_text(spr_temmie, 1, "(Kala's words made it seem like I had to choose between her interests and mine. By choosing hers, I would doom the agency to an explosive end."); 
			scr_text(spr_temmie, 1, "(But it turns out, I didn't have to choose.)");
			scr_text(spr_temmie, 1, "(Kala left behind an extensive journal of notes on how to properly rig up Laser...)");
			scr_text(spr_temmie, 1, "(Including how to rig him to explode and how to \"disarm\" him as well. These notes probably would've been too sophisticated any other agent but...)");
			scr_text(spr_temmie, 1, "(The reality is, I'm an artist at heart like her. I wanted to have her job, but, life choose this opportunity for me instead.)");
			scr_text(spr_temmie, 1, "(The agency didn't realize it, but my art school dropout experience was just enough to make sense of what was going on.)");
			scr_text(spr_temmie, 1, "(I let Kala go, confident with her notes I could save the agency in the process.)");
			scr_text(spr_temmie, 1, "(We were able to disarm Laser and stop him from blowing up the LIA.)");
			scr_text(spr_temmie, 1, "(Oh, and also I was able to reprogram him to act less like a little bitch to everyone in the process)");
			
			scr_text(spr_temmie, 1, "(Kala got away. We searched everywhere for leads on her, but for as much art as she posted on social media in the days after...)");
			scr_text(spr_temmie, 1, "(We never got a bead on where she may have ran off to.)");
			scr_text(spr_temmie, 1, "(Not that we ever really needed to. After I disarmed Laser, I was moved to Kala's old role, and life moved on as normal after that.)");
			break;
		
		case "kala_free_bad":
			scr_text(spr_temmie, 1, "(After all they put her through, I couldn't stomach jailing her and putting her through even more hell.)");
			scr_text(spr_temmie, 1, "(At the same time, even if Kala wasn't clear about it, I got the gist that she rigged Laser to blow up.)");
			scr_text(spr_temmie, 1, "(Honestly, for as much as the department wanted him around me in my cases, I couldn't stand being around him.)");
			scr_text(spr_temmie, 1, "(So I drove far away and let his inevitable death happen.)");
			scr_text(spr_temmie, 1, "(The explosion was front page news, and once they knew that I knew too much about it, all eyes started turning my way.)");
			
			scr_text(spr_temmie, 1, "(Kala got away. We searched everywhere for leads on her, but for as much art as she posted on social media in the days after...)");
			scr_text(spr_temmie, 1, "(We never got a bead on where she may have ran off to.)");
			scr_text(spr_temmie, 1, "(It's hard to imagine that she wasn't living a happier life, however, after what went down.)");
			break;
		
		case "kala_detain":
			scr_text(spr_temmie, 1, "(After all they put her through, it was hard to imagine detaining Kala at the end of it all.)");
			scr_text(spr_temmie, 1, "(At the same time, even if Kala wasn't clear about it, I got the gist that she rigged Laser to blow up.)");
			scr_text(spr_temmie, 1, "(Even if the agency treated her badly, I couldn't allow her to jeopardize not just my livelihood but the lives of others.)");
			scr_text(spr_temmie, 1, "(I detained Kala, and gave the green light for the agency to raid her apartment. As it turns out...)");
			scr_text(spr_temmie, 1, "(Kala left behind an extensive journal of notes on how to properly rig up Laser...)");
			scr_text(spr_temmie, 1, "(Including how to rig him to explode and how to \"disarm\" him as well. These notes probably would've been too sophisticated any other agent but...)");
			scr_text(spr_temmie, 1, "(The reality is, I'm an artist at heart like her. I wanted to have her job, but, life choose this opportunity for me instead.)");
			scr_text(spr_temmie, 1, "(The agency didn't realize it, but my art school dropout experience was just enough to make sense of what was going on.)");
			scr_text(spr_temmie, 1, "(We were able to disarm Laser and stop him from blowing up the LIA.)");
			scr_text(spr_temmie, 1, "(Oh, and also I was able to reprogram him to act less like a little bitch to everyone in the process)");
			
			scr_text(spr_temmie, 1, "(Perhaps my one regret after everything was over was that I left Kala to rot in a jail cell...)");
			break;
	}
}