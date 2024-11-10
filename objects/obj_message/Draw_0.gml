/// @description Insert description here
// You can write your code in this editor
var _textbox_x = camera_get_view_x(view_camera[0]);
var _textbox_y = camera_get_view_y(view_camera[0]);

var _textbox_width = string_width(display_text) + 2*text_border_x;
var _textbox_height = string_height(display_text) + 2*text_border_y;

// Draw the textbox spr that will contain our message
var _x1 = _textbox_x + 640 - _textbox_width;
var _y1 = _textbox_y + 0;
draw_sprite_ext(textbox_spr, 0, _x1, _y1, _textbox_width/textbox_spr_w, _textbox_height/textbox_spr_h, 0, c_white, alpha);

// Draw the text message itself
draw_text(_x1 + text_border_x, _y1 + text_border_y, display_text);