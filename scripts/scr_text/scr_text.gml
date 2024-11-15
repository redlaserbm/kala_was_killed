// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// @param _text
// @param _character_info
// @param _bg

function scr_text(_sprite = noone, _image = 0, _text = "", _methods = []){
	
	// Your standard textbox will have a *sprite*, an *image*, and *text* associated with it.
	// Sometimes, textboxes need to take additional actions such as displaying images or changing music
	// The *struct* argument is designed to handle those additional actions.
	
	text[page_number] = _text;
	portrait[page_number] = _sprite;
	image[page_number] = _image;
	
	methods[page_number] = _methods;
	
	// Deprecated
	bg[page_number] = noone;
	sound[page_number] = noone;
	is_visible[page_number] = true;
	
	page_number++;
}

function scr_draw_sprite(_spr, _img, _x, _y){
	scr_spr = _spr;
	scr_img = _img;
	scr_x = _x;
	scr_y = _y;
	var _method = function() {
		draw_sprite(scr_spr, scr_img, scr_x, scr_y);
	}
	return _method
}

function scr_force_go() {
	var _method = function() {
		force_go = true;	
	}
	return _method;
}

function scr_change_music(_music, _fade_time = obj_music.music_fade_time) {
	var _method = function () {
		obj_music.bg_music_new = _music;	
	}
	return _method;
}