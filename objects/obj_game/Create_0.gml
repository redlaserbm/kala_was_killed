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
	elevator_started: false
}

music_fade_time = 2; // Controls how long it takes for music to fade in seconds

// Set the loop points for audio tracks in the game (if necessary)
init_setup = false;

bg_music = snd_main_menu;
bg_music_new = snd_main_menu;