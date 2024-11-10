/// @description This object displays a message for a fixed period of time and then disappears

depth = -15000;

var _struct = global.textbox; 

textbox_width = _struct.width;
textbox_height =  _struct.height;

// Unlike in that tutorial, we need separate variables for the x and y borders
textbox_x_offset = _struct.offset_x;
textbox_y_offset = _struct.offset_y;

text_border_x = _struct.border_x;
text_border_y = _struct.border_y;

line_width = textbox_width - text_border_x - text_border_y - 0;

// Set the sprite to use for the textbox, as well as the image from that sprite to use and how fast it should animate...
textbox_spr = _struct.spr;
textbox_img = 0;
textbox_img_speed = 6/60;

textbox_spr_w = sprite_get_width(textbox_spr);
textbox_spr_h = sprite_get_height(textbox_spr);

// the text
page = 0;
page_number = 0;

if !variable_instance_exists(self, "display_text") {
	display_text = "sample text";
}

alarm[0] = 60;

alpha = _struct.alpha;

show_debug_message("GOT TO HERE");
show_debug_message(display_text);