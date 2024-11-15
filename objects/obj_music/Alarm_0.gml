/// @description Insert description here
// You can write your code in this editor
var _vol_music = global.settings.volume_music;
var _vol_master = global.settings.volume;

audio_stop_sound(bg_music);
if !is_undefined(bg_music_new) {
	bg_music = audio_play_sound(bg_music_new,0,true, _vol_music*_vol_master);
}