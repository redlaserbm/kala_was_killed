/// @description Insert description here
// You can write your code in this editor

var _textbox_x = camera_get_view_x(view_camera[0]);
var _textbox_y = camera_get_view_y(view_camera[0]);

var _up = mouse_wheel_up();
var _down = mouse_wheel_down();

var _aggregate_height = 0;

if state.active {
	// Do not try to draw the logs unless we are in the log state!
	
	// I'll use this variable to automatically determine the y-coordinate of each textbox in the logger.
	var _textbox_y_offset = 480;
	
	for (var _i = array_length(text)-1; _i > -1; _i--) {
		
		var _str_height = string_height_ext(text[_i], line_sep, line_width);
		var _textbox_height = max(_str_height + 2*text_border_y,portrait_height + 2*portrait_border_y);
		
		// Draw the textbox
		draw_sprite_ext(textbox_spr, textbox_img, _textbox_x + textbox_x_offset, _textbox_y + _textbox_y_offset - _textbox_height  + scroll_offset, textbox_width/textbox_spr_w, (_str_height + 2*text_border_y)/textbox_spr_h, 0, c_white, alpha);
		
		_aggregate_height += _textbox_height;
		
		// Draw the text on the textbox
		var _drawtext = text[_i];
		draw_set_color(make_color_rgb(255,255,255));
		draw_text_ext(_textbox_x + textbox_x_offset + text_border_x, _textbox_y + _textbox_y_offset - _textbox_height + text_border_y + scroll_offset, _drawtext, line_sep, line_width);
		
		// Draw the portrait
		draw_sprite_ext(ds_map_find_value(global.mini_speaker, portrait[_i]), 0, _textbox_x + portrait_x_offset + portrait_border_x, _textbox_y + _textbox_y_offset - _textbox_height + portrait_border_y + scroll_offset - 15, 0.5, 0.5, 0, c_white, 1);
		
		// Determine the y offset for the *next* textbox.
		_textbox_y_offset -= _textbox_height;
	}
} else {
	scroll_offset = 0;	
}

if _up && (480 - _aggregate_height + scroll_offset <= 0) {
	scroll_offset += scroll_speed;	
} else if _down {
	scroll_offset -= scroll_speed;	
}

if scroll_offset < 0 {
	scroll_offset = 0;	
}