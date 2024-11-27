/// @description Insert description here
// You can write your code in this editor

// For convenience reasons, the dialogue of the game is split across multiple different files
// This switch allows the game to automatically determine which one needs to be referenced.
switch (room) {
	case rm_elevator:
		global.dictionary = scr_dialogue;
		break;
	case rm_road:
		global.dictionary = scr_crime_scene;
		obj_music.change_music(snd_investigation_outdoors);
		break;
	case rm_car_interior:
		global.dictionary = scr_crime_scene;
		if state.flags.keys_remark {
			obj_music.change_music(snd_investigation_indoors);
		} else {
			obj_music.change_music(snd_still_alive);	
		}
		break;
	case rm_interrogation:
		global.dictionary = scr_interrogation;
		obj_music.change_music(snd_leif_interrogation);
		break;
	case rm_kala:
		global.dictionary = scr_kala_room;
		obj_music.change_music(snd_kala_room);
		if !state.flags.kala_unlock {
			audio_play_sound(snd_unlock, 1, false);	
			state.flags.kala_unlock = true;
		}
		break;
	case rm_kala_comp:
		global.dictionary = scr_kala_room;
		obj_music.change_music(snd_kala_room);
		break;
	case rm_realm:
		global.dictionary = scr_confrontation;
		obj_music.change_music(snd_realm);
		break;
	case rm_credits:
		instance_create_depth(0,0, depth, obj_credits);
		obj_music.change_music(snd_ending_0);
		break;
}

// This object spawns multiple other important objects essential to the game.
// The reason for having separate objects over containing everything in obj_game is code cleanliness purposes
if (room != rm_main_menu) {
	scr_obj_init();
}

if room == rm_main_menu {
	instance_create_depth(0,0,-1, obj_main_menu);	
}

if (room == rm_elevator) && !state.flags.elevator_started {
	state.flags.elevator_started = true;
	scr_textbox_create("scenario");
}

if room == rm_road && !state.flags.police_report {
	state.flags.police_report = true;
	scr_textbox_create("police_report", scr_crime_scene);
}

if (room = rm_slider) {
	instance_create_depth(100,100,0, obj_slider, {variable_name: "volume", struct_name: global.settings});	
}