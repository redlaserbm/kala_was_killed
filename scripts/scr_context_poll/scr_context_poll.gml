// During certain parts of the game, the player will be asked important questions and must answer them
// by selecting an item from their inventory, similar to ace attorney
// The below script governs these sorts of questions

function scr_context_poll(_context, _item){
	var _text_id = "text";
	switch (_context) {
		
		// When Temmie questions Leif about the lights being on at Laser's house
		case "ce_help":
			switch (_item) {
				case "Power lines":
					_text_id = "ce_help_correct";
					state.detective = noone;
					break;
					
				default:
					_text_id = "incorrect";
					break;
			}
			break;
		
		// When Temmie questions Leif about how the car crash occurred
		case "ce_car":
			switch (_item) {
				case "Leif's brick":
					_text_id = "ce_car_counter";
					break;
				
				case "Road observation":
					_text_id = "ce_car_correct";
					state.detective = noone;
					break;
					
				default:
					_text_id = "incorrect";
					break;
			}
			break;
			
		case "hiding_something":
			switch (_item) {
				case "Leif's brick":
					state.detective = noone;
					_text_id = "brick_theory";
					break;
				
				default:
					_text_id = "incorrect";
					break;
			}
			break;
			
		case "brick_theory_2":
			switch (_item) {
				case "Kala's phone":
					state.detective = noone;
					_text_id = "brick_theory_3";
					break;
				
				default:
					_text_id = "incorrect";
					break;
			}
	}
	
	// In general, the game needs to know a _text_id and a dictionary to reference to call the correct textbox
	// However, I'm trying to simplify code by having the game *infer* the correct dictionary. See obj_game for more details.
	return _text_id
}