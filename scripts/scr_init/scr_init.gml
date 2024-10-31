// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
speaker = ds_map_create();
ds_map_add(speaker, spr_temmie, "Temmie");
ds_map_add(speaker, spr_laser, "Laser");
ds_map_add(speaker, spr_leif, "Leif");

// Helps obj_logger determine which portrait sprites to use
mini_speaker = ds_map_create();
ds_map_add(mini_speaker, spr_temmie, spr_temmie_mini);
ds_map_add(mini_speaker, spr_laser, spr_laser_mini);
ds_map_add(mini_speaker, spr_leif, spr_leif_mini);
ds_map_add(mini_speaker, noone, spr_narrator_mini); //This is an empty sprite

// Helps obj_main_menu determine how to make sliders influence the correct variables
map_settings = ds_map_create();
ds_map_add(map_settings, "Music Volume", "volume_music");
ds_map_add(map_settings, "SFX Volume", "volume_sfx");
ds_map_add(map_settings, "Master Volume", "volume");

// What font will we use for drawing text? What color should that font be?
main_font = fnt_ocr;
main_font_color = make_color_rgb(255,255,255);

// Keybinds
key_inv = ord("S");
key_log = ord("X");

// Defining dimensions for textboxes that will pop up during the game.
// This is here to expedite code writing for various interactables.
textbox = 
{
	width: 640,
	height: 112,
	
	offset_x: 0,
	offset_y: 368,
	
	border_x: 24,
	border_y: 21,
	
	option_border_x: 24,
	option_border_y: 18,
	
	highlight_border_x: 1,
	highlight_border_y: 1,
	
	nameplate_offset_x: 0,
	nameplate_offset_y: 0,
	
	nameplate_width: 384,
	nameplate_height: 48,
	
	nameplate_border_y: 14,
	
	line_sep: 24,
	
	alpha: 0.85,
	
	spr: spr_textbox,
	
	slider_width: 100,
}

// Auto computed struct variables
textbox.nameplate_offset_y = textbox.offset_y - textbox.nameplate_height;
textbox.line_width = textbox.width - textbox.border_x - textbox.border_y;
textbox.spr_w = sprite_get_width(textbox.spr);
textbox.spr_h = sprite_get_height(textbox.spr);

// Settings to consider
settings = {
	volume: 1,
	volume_music: 1,
	volume_sfx: 1
}

fade_time = 0;