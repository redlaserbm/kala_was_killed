// This draw event is responsible for identifying what background to draw in the game.
// In other words, this draw event is basically a "theatre background" of sorts.

switch (room){
		
	case rm_car_interior:
		if (instance_number(obj_transition) < 1) && (!state.flags.keys_remark) {
			state.flags.keys_remark = true;
			scr_textbox_create("keys_remark", global.dictionary);
		}
		break;
		
	case rm_interrogation:
		if (instance_number(obj_transition) < 1) && !state.flags.interrogation_start {
			state.flags.interrogation_start = true;
			scr_textbox_create("testimony", global.dictionary);
		}
		break;
		
	case rm_realm:
		if (instance_number(obj_transition) < 1) && !state.flags.realm_start {
			state.flags.realm_start = true;
			scr_textbox_create("found", global.dictionary);
		}
		break;
		
	case rm_kala:
		if (instance_number(obj_transition) < 1) && !state.flags.kala_start {
			state.flags.kala_start = true;
			scr_textbox_create("start", global.dictionary);
		}
		break;
		
	// Legacy code from "Temmie is Trapped!"
	case rm_leif:
		draw_sprite(spr_leif_office,0,0,0);
		break;
		
	case rm_hipthrusts:
		draw_sprite(spr_japan,0,0,0);
		break;
		
	case rm_elevator:
		if state.flags.elevator_rumble {
			draw_sprite(spr_elevator, 0, 0, 5*sin(1.5*timer))
		} else {
			draw_sprite(spr_elevator,0,0,0);
		}
		break;
}

if alarm[1] > 0 {
	draw_text(440,0,"game saved");
}

if alarm[2] > 0 {
	draw_text(440,0,"game loaded");
}

// draw_text(150,50,instance_number(obj_itemizer));