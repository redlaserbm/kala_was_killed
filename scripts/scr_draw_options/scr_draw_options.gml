// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_options(_xval, _yval, _options, _alignment = "top_left") {
	// Scripting function which allows interactables to draw a list of options that the player can choose from
	// _options is assumed to be an array with elements consisting of structs that give information about the options
	// Example: _options[0] = {text:"hi mom", type: "standard"}
	
	// TODO: This script must be able to draw slider options. (For example, in the main menu, when drawing the
	//"SFX Volume" text there should also be a slider next to that text.)
	
	draw_set_font(global.main_font);
	
	// Legacy support
	if is_string(_options[0]) {
		for (var _i = 0; _i < array_length(_options); _i++) {
			var _text = _options[_i];
			_options[_i] = {
				text: _text,
				type: "standard"
			}
		}
	}
	
	// This script reads the state variable "accept_key" to track whether or not an option has been click in.
	// This script updates the state variable "option_pos" to indicate, when an option is picked, which one was picked.
	
	// The following alignment options are available:
	// top_left, bottom_left, top_right, bottom_right
	
	// How *wide* should the options dialogue be?
	var _max_width = 0;
	for (var _i = 0; _i < array_length(_options); _i++) {
		var _w = string_width(_options[_i].text);
		if _options[_i].type == "slider" {
			// If the option is a slider, we need to make extra width for that slider
			_w += global.textbox.slider_width + global.textbox.border_x;
		}
		if _w > _max_width {
			_max_width = _w;	
		}
	}
	var _option_width = _max_width + 2*global.textbox.option_border_x;
	
	// How *high* should the options dialogue be?
	var _option_height = 2*global.textbox.option_border_y
	_option_height = _option_height + global.textbox.line_sep*(array_length(_options)-1)
	_option_height = _option_height + string_height(_options[array_length(_options)-1].text);
	
	// If the alignment is anything different from top_left, we must modify _xval and/or _yval based on the measurements above
	switch (_alignment) {
		case "top_left":
			break;
		case "bottom_left":
			_yval = _yval - _option_height;
			break;
		case "top_right":
			_xval = _xval - _option_width;
			break;
		case "bottom_right":
			_yval = _yval - _option_height;
			_xval = _xval - _option_width;
			break;
	}
	
	// Draw the back of the textbox
	draw_sprite_ext
	(
		global.textbox.spr, 
		0, _xval, _yval, 
		_option_width/global.textbox.spr_w, 
		_option_height/global.textbox.spr_h, 
		0, c_white, global.textbox.alpha
	);
	
	// Highlight the option currently being hovered over by the mouse, if such an option exists.
	var _mx = mouse_x;
	var _my = mouse_y;
	var _nudge = 0;
	
	// Draw each option available to the player. 
	// If that option is currently being hovered over by the mouse, *highlight* that option...
	var _hover_pos = noone;
	for (var _i = 0; _i < array_length(_options); _i++) {
		
		var _x1 = _xval + global.textbox.option_border_x;
		var _y1 =  _yval + global.textbox.option_border_y + _nudge;
		if point_in_rectangle(_mx, _my, _x1, _y1, _x1 + string_width(_options[_i].text), _y1 + string_height(_options[_i].text)) && (_options[_i].type == "standard") {
			_hover_pos = _i;
			draw_sprite_stretched
			(
				spr_black,
				0,
				_x1 - global.textbox.highlight_border_x, 
				_y1 - global.textbox.highlight_border_y,
				string_width(_options[_i].text) + 2*global.textbox.highlight_border_x, //width
				string_height(_options[_i].text) + 2*global.textbox.highlight_border_y //height
			);
			if accept_key {
				audio_play_sound(snd_click, 1, false, global.settings.volume*global.settings.volume_sfx);
				option_pos = _i;
			}
		}
		
		var _drawoption = _options[_i].text;
		var _color = make_color_rgb(255,255,255);
		if (_i == _hover_pos) {
			draw_text_colour(_x1, _y1, _drawoption, _color, _color, _color, _color, 255);
		} else {
			draw_text_ext(_x1, _y1, _drawoption, global.textbox.line_sep, 640);
		}
		
		if _options[_i].type == "slider" {
			scr_draw_slider(_x1 + _max_width - global.textbox.slider_width - 0.5*global.textbox.border_x, _y1 + 0.5*string_height(_options[0].text) - 0.5*sprite_get_height(spr_circle), global.settings, ds_map_find_value(global.map_settings, _options[_i].text));
		}
		
		_nudge += global.textbox.line_sep;
	}
	
	hover_pos = _hover_pos;
}