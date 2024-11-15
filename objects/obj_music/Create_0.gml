/// @description This object is responsible for determining what music gets played in the game at what time

// Controls how long it takes for music to fade in seconds
music_fade_time = 2;

bg_music = snd_main_menu;
bg_music_new = snd_main_menu;

init_setup = false;

change_music = function(_music, _fade_time = music_fade_time) {
	bg_music_new = _music;
	music_fade_time = _fade_time;
}