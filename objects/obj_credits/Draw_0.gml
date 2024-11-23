/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);

y_start = y_start - scroll_speed;

var _y = y_start;
for (var _i = 0; _i < array_length(credits); _i++) {
	// Draw the label associated with credits
	draw_text(320, _y, credits[_i].label + ":");
	_y = _y + indent;	
	for (var _j = 0; _j < array_length(credits[_i].contributors); _j++) {
		draw_text(320, _y, credits[_i].contributors[_j]);
		_y = _y + indent;	
	}
	_y = _y + indent;
}