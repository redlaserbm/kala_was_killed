// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_inventory_description(_text_id){
	var _return_text = noone;
	switch(_text_id) {
		case "Temmie's knife":
			_return_text = "Temmie's trusty knife. Cuts cleanly through her adversaries. Please don't stand in her way she will stab you with this."
			break;
			
		case "Laser":
			_return_text = "Your \"trusty\" forensic sidekick. Hold-click to ask him for help.";
			break;
			
		case "Chocolate cake":
			_return_text = "Mm..Food! But also bound to give you diabetes. Seriously, have you checked how much sugar is in this thing?";
			break;
		 	
		case "Sliced cake":
			_return_text = "Mm..Food! Still bound to give you diabetes, but it's easier to share with your friends now.";
			break;
			
		case "Car key":
			_return_text = "Vroom Vroom. Oh also you kinda need this to unlock the car in this crime scene.";
			break;
		
		case "Police report":
			_return_text = "A summary from police chief Jakkop on what happened to Kala based on an eyewitness account from Leif.";
			break;
			
		case "Road observation":
			_return_text = "Inconsistent with the police report, there are no tire tracks on the road that would indicate a car dodging a falling tree.";
			break;
			
		case "Power lines":
			_return_text = "When the tree fell, it took down power lines with it, meaning that the surrounding area was pitch black at the time of the crash.";
			break;
			
		case "Crime scene map":
			_return_text = "A coarsely detailed diagram of the car crash and surrounding area.";
			break;
			
		case "Leif's brick":
			_return_text = "It's a brick with Leif's name on it. Why is there a brick with his name on it? Idk go ask him about it.";
			break;
			
		case "Kala's phone":
			_return_text = "Kala's phone. She has an image of Leif for her lockscreen background, suggesting that she knows him pretty well.";
			break;
			
		case "Lifework pen":
			_return_text = "A pen for drawing in 3D. More powerful than you think it is...";
			break;
			
		case "Temmie's lightblade":
			_return_text = "An extremely dangerous sword composed of light particles. Perfect for heavy duty adversarial encounters.";
			break;
			
		case "Newspaper":
			_return_text = "A local newspaper from the time Laser's house was blown to smithereens. Hold-click to examine.";
			break;
			
		case "Kala's journal":
			_return_text = "Kala's personal journal, covering her personal life starting from a few years back. Hold-click to examine.";
			break;
	}
	return _return_text;
}