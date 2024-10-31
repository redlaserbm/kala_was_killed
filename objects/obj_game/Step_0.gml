/// @description Insert description here
// You can write your code in this editor
timer += 1;

// This section is intended to keep track of the current state of the game that we're in
// We want to ensure that multiple interfaces do not co-exist at the same time on the game screen.
var _key_log = keyboard_check_pressed(global.key_log);

var _vol_music = global.settings.volume_music;
var _vol_master = global.settings.volume;

if !init_setup {
	init_setup = true;
	bg_music = audio_play_sound(bg_music,0,true, _vol_music*_vol_master);
}

if bg_music_new != asset_get_index(audio_get_name(bg_music)) && alarm[0] == -1 {
	audio_sound_gain(bg_music, 0, 1000*music_fade_time*_vol_music*_vol_master);
	alarm[0] = music_fade_time*60;
}

if alarm[0] == -1 {
	audio_sound_gain(bg_music, _vol_master*_vol_music, 0);
}