/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// State variables
if array_length(struct_get_names(state)) < 1 {
	// For tracking the keys entered into the elevator panel
	for (var _i = 0; _i < 10; _i++) {
		var _idx = "b" + string(_i);
		state[$ _idx] = 0;
	}

	// For tracking how many times the panel has been visited
	state[$ "panel_visits"] = 0;
}

// ------------------

// These are parameters to help us draw the buttons in the correct location.
offset_x = 195;
offset_y = 0;

panel_spr = spr_panel_back;
panel_width = sprite_get_width(panel_spr);
panel_height = sprite_get_height(panel_spr);

border_x = 20;
border_y = 20;

layout_width = panel_width - 2*border_x;
layout_height = panel_height - 2*border_y;

button_spr = spr_button;
button_width = sprite_get_width(spr_button);
button_height = sprite_get_height(spr_button);

// This is spacing between the back panel and the options dialogue that is to appear to the right of the panel
options_spacing = 20;

columns = 2;
rows = 5;

accept_key = false;
option_pos = -1;