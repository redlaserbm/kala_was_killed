/// @description Insert description here
// You can write your code in this editor

var _vol_music = global.settings.volume_music;
var _vol_master = global.settings.volume;

if !init_setup {
	init_setup = true;
	bg_music = audio_play_sound(bg_music,0,true, _vol_music*_vol_master);
}

if alarm[0] == -1 {
	if bg_music_new != asset_get_index(audio_get_name(bg_music)) {
		audio_sound_gain(bg_music, 0, 1000*music_fade_time*_vol_music*_vol_master);
		alarm[0] = music_fade_time*60;
	} else {
		audio_sound_gain(bg_music, _vol_master*_vol_music, 0);
	}
}