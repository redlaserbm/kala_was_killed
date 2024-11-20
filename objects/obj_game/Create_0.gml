/// @description Insert description here
// You can write your code in this editor

depth = 2;
bg_spr = spr_japan;

global.bg_current = spr_japan;
global.bg_new = spr_japan;

timer = 0;

// audio_play_sound(snd_oneshot, 1, true);

// There are multiple game states that may exist in our game. 
// These game states exist to assert what certain keys will do in certain sitautions.

// For now, I'm going to keep things simple by introducing *two* states, one for advancing through dialogue...
// And another for reading through logs.

game_state[0] = "game";
game_state[1] = "log";
game_state[2] = "inventory";

current_state = 0;

game_loaded = false;

// Flags for tracking game progress
state = {
	flags : {}	
}
state.flags = {
	elevator_complete: false,
	elevator_rumble: false,
	elevator_started: false,
	
	police_report: false,
	keys_remark: false,

	interrogation_start: false,	
	interrogation_car: false, // Turns true when Temmie successfully interrogates Leif about how the car ended up inside Laser's house
	interrogation_help: false, // Turns true when Temmie successfully interrogates Leif about how the lights could've been on at Laser's house

	interrogation_nuance: false, // This flag triggers if Leif argues during the dialogue that the brick is irrelevant to the crime scene.
	interrogation_complete: false,

	realm_start: false
}

// Set the loop points for audio tracks in the game (if necessary)
init_setup = false;

instance_create_depth(0,0,0,obj_music);
