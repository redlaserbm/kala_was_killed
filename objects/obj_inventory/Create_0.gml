/// @description Insert description here
// You can write your code in this editor
event_inherited();

// This object concerns the storage and manipulation of items in the player's person.
// There are two modes of operation:
// 1. Standard mode --- In this mode the player can freely interact with objects on their person.
// 2. Detective mode --- This mode is forcefully triggered by certain dialogue interactions. 

// state.detective is either "noone", or a _context argument which can be fed into scr_context_poll

// This is the actual inventory we have access to.
if !struct_exists(state, "inventory") {
	state.inventory = [];

	state.inventory[0] = "Temmie's knife";
	state.inventory[1] = "Laser";
	
	state.detective = noone
}

show_debug_message(state.inventory);

display = false;
setup = false;

// -------
// Parameters for inventory display when active
// -------

inv_offset_x = 0;
inv_offset_y = 50;

inv_height = 480 - inv_offset_y - 150;
inv_width = 640;

// Concerns spacing between the edge of the inventory textbox and the text describing the inventory
inv_border_x = 30;
inv_border_y = 30;

// How many items will the inventory menu display?
// We will use this to automatically determine the spacing to apply between items in the inventory menu
inv_items_x = 2;
inv_items_y = 5;

// -------
// Parameters for inventory display when inactive
// -------
eq_offset_x = 640;
eq_offset_y = 480;

eq_height = global.textbox.height;
eq_width = global.textbox.height;

// Which item are we hovered over?
hover_pos = -1;
clicks = 0;

// For tracking items for the combining feature. Which item did we click on?
click_pos = -1;

alpha = 0.85;

textbox_spr = spr_textbox;
textbox_img = 0;

textbox_spr_h = sprite_get_height(textbox_spr);
textbox_spr_w = sprite_get_width(textbox_spr);

// The inventory menu will also display descriptions of items when we hover over them.
// We need separate measurements for the textbox to accomodate for this.
textbox_width = global.textbox.width;
textbox_height = global.textbox.height;

// Unlike in that tutorial, we need separate variables for the x and y borders
textbox_x_offset = global.textbox.offset_x;
textbox_y_offset = global.textbox.offset_y;

nameplate_x_offset = global.textbox.nameplate_offset_x;

nameplate_width = global.textbox.nameplate_width;
nameplate_height = global.textbox.nameplate_height;

nameplate_y_offset = textbox_y_offset - nameplate_height;

text_border_x = global.textbox.border_x;
text_border_y = global.textbox.border_y;

nameplate_border_y = global.textbox.nameplate_border_y;

line_sep = global.textbox.line_sep; // Admittedly I'm not sure how to set this number, this is just a good guess rn...
line_width = textbox_width - text_border_x - text_border_y - 0;

// Set the sprite to use for the textbox, as well as the image from that sprite to use and how fast it should animate...
textbox_spr = global.textbox.spr;
textbox_img = 0;
textbox_img_speed = 6/60;

textbox_spr_w = sprite_get_width(textbox_spr);
textbox_spr_h = sprite_get_height(textbox_spr);

active_timer = 0;
hold_timer = 0;
hold_threshold = 20;
double_click_threshold = 20;