/// @description Insert description here
// You can write your code in this editor

draw_set_font(global.main_font);

var _drawtext = "You escaped!";

var _h = string_height(_drawtext);
var _w = string_width(_drawtext);

var _spacing = 15;

draw_sprite_ext(global.textbox.spr, 0, 0, 480/2 - _h/2 - _spacing, 640/global.textbox.spr_w, (2*_spacing + _h)/global.textbox.spr_h, 0, make_color_rgb(255,255,255), global.textbox.alpha);

draw_text(640/2 - _w/2, 480/2 - _h/2, _drawtext);