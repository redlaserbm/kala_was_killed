/// @description This is the menu that shows up during the game!

// Is the menu collapsed or not?
collapsed = true;
collapse_timer = 0;
collapse_flag = false;

// The "minimized" state of the menu"
option[0,0] = {text:"Menu", type:"standard"};

option[1,0] = {text:"Inventory", type:"standard"};
option[1,1] = {text:"Logs", type: "standard"};
option[1,2] = {text:"Settings", type:"standard"};
option[1,3] = {text:"Back", type:"standard"};

// For Saving/Loading or accessing more settings
option[2,0] = {text:"Save Game", type:"standard"};
option[2,1] = {text:"Load Game", type:"standard"};
option[2,2] = {text:"Options", type:"standard"};
option[2,3] = {text:"Back", type:"standard"};

// The options menu (for SFX)
option[3,0] = {text:"Master Volume", type:"slider"};
option[3,1] = {text:"Music Volume", type:"slider"};
option[3,2] = {text:"SFX Volume", type:"slider"};
option[3,3] = {text:"Back", type:"standard"};

// For Saving the Game
option[5,0] = {text:"Save File 1", type:"standard"};
option[5,1] = {text:"Save File 2", type:"standard"};
option[5,2] = {text:"Save File 3", type:"standard"};
option[5,3] = {text:"Back", type:"standard"};

// For Loading Save Files
option[6,0] = {text:"Load File 1", type:"standard"};
option[6,1] = {text:"Load File 2", type:"standard"};
option[6,2] = {text:"Load File 3", type:"standard"};
option[6,3] = {text:"Back", type:"standard"};

// This "menu" shows up whenever the logger or the inventory are active
option[4,0] = {text: "Back", type: "standard"};

menu_pos = 0; 
option_pos = -1;

accept_key = false;

alpha = 1;

textbox_width = 640;
textbox_height = 112;

option_width = 0;
option_height = 80;

// Unlike in that tutorial, we need separate variables for the x and y borders
textbox_x_offset = 0;
textbox_y_offset = 368;

nameplate_x_offset = 0;

nameplate_width = 384;
nameplate_height = 48;

nameplate_y_offset = textbox_y_offset - nameplate_height;

// If I need to make a textbox invisible, I'm just gonna draw it WAY off-screen.
// This is good coding practice I swear to god.
invisible_offset = 10000;

text_border_x = 24;
text_border_y = 21;

nameplate_border_y = 14;

option_border_x = 24; // I get it, this is annoying, but I'm trying to make the display look nice, okay?
option_border_y = 18;

portrait_border_x = 16;
portrait_border_y = 8;

// This is so that we don't try to draw the text on top of the portrait
portrait_width = 0;

line_sep = 24; // Admittedly I'm not sure how to set this number, this is just a good guess rn...
line_width = textbox_width - text_border_x - text_border_y - 0;

// Set the sprite to use for the textbox, as well as the image from that sprite to use and how fast it should animate...
textbox_spr = spr_textbox;
textbox_img = 0;
textbox_img_speed = 6/60;

textbox_spr_w = sprite_get_width(textbox_spr);
textbox_spr_h = sprite_get_height(textbox_spr);

menu_hover = false;
hover_pos = noone;

depth = -15001;