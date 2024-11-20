/// @description Variable initialization

event_inherited();
scr_activate();

depth = -15000;

var _struct = global.textbox; 

textbox_width = _struct.width;
textbox_height =  _struct.height;

option_width = 0;
option_height = 80;

// Unlike in that tutorial, we need separate variables for the x and y borders
textbox_x_offset = _struct.offset_x;
textbox_y_offset = _struct.offset_y;

nameplate_x_offset = _struct.nameplate_offset_x;

nameplate_width = _struct.nameplate_width;
nameplate_height = _struct.nameplate_height;

nameplate_y_offset = textbox_y_offset - nameplate_height;

text_border_x = _struct.border_x;
text_border_y = _struct.border_y;

nameplate_border_y = _struct.nameplate_border_y;

option_border_x = _struct.option_border_x; // I get it, this is annoying, but I'm trying to make the display look nice, okay?
option_border_y = _struct.option_border_y;

line_sep = _struct.line_sep; // Admittedly I'm not sure how to set this number, this is just a good guess rn...
line_width = textbox_width - text_border_x - text_border_y - 0;

// Set the sprite to use for the textbox, as well as the image from that sprite to use and how fast it should animate...
textbox_spr = _struct.spr;
textbox_img = 0;
textbox_img_speed = 6/60;

textbox_spr_w = sprite_get_width(textbox_spr);
textbox_spr_h = sprite_get_height(textbox_spr);

// Set the sprite for the cursor used during options dialogue
cursor_spr = spr_cursor;
cursor_spr_w = sprite_get_width(cursor_spr);
cursor_spacing = 12; // Governs how much *horizontal* space to leave between the cursor and the text it's selecting.

// Set the sprite to use for the textbox portrait
// portrait_spr = spr_laser;

// the text
page = 0;
page_number = 0;

// LASER NOTE: When using scr_text, this line gets overwritten. It's just here so the compiler doesn't get mad at us.
text[0] = "text";
portrait[0] = spr_laser;
image[0] = 0;
methods[0] = [];

bg[0] = noone;
sound[0] = noone;
is_visible[0] = true;

// When saving the game, we need to know the text_id that was used to create it so we can reconstruct the text upon loading the game again
text_id = "";

// Options
option[0] = "Yes";
option_link_id[0] = noone;

option_pos = noone;
hover_pos = noone;
option_number = 0;

text_length[0] = string_length(text[0]);
draw_char = 0;

text_speed = 0.5;

setup = false;

accept_key = false;
skip_key = false;
up_down_input = false;

timer = 0;

alpha = 0.85;

// Array of method variables which prescribes actions to take upon deletion of the textbox
end_action[0] = function() {
};

// When loading a new save state, it may be necessary to destroy the current textbox without running its end actions. Set this variable to true whenever that's necessary
force_destroy = false;

// This property causes a textbox to NOT wait for the player before advancing dialogue.
force_go = false;







