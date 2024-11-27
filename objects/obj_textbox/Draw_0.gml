/// @description Insert description here
// You can write your code in this editor

accept_key = mouse_check_button_pressed(mb_left) && state.active && (obj_menu.hover_pos == noone) && (obj_menu.option_pos < 0); // Only try to advance dialogue if we are in the game state.
skip_key = mouse_check_button_pressed(mb_right) && state.active && timer > 2;

for (var _i = 0; _i < instance_number(obj_slider); _i++) {
	var _slider = instance_find(obj_slider, _i);
	if _slider.drag {
		accept_key = false;	
	}
}

// In rare cases, there may be two textboxes on screen at once. 
// If such is the case, the "younger" textbox shall use a different variable to determine activity

//for (var _i = 0; _i < instance_number(obj_textbox); _i++) {
//	var _textbox = instance_find(obj_textbox, _i);
//	if _textbox.timer < timer && (_textbox != self) && state.active {
//		show_debug_message("Deactivating " + string(self.id));
//		state.active = false;
//		break;
//	}
//}

if accept_key and timer > 2 {
	// audio_play_sound(snd_cursor,0,false,0.25);	
}
var _textbox_x = camera_get_view_x(view_camera[0]);
var _textbox_y = camera_get_view_y(view_camera[0]);

// Additional setup
if !setup {
	setup = true;
	
	draw_set_font(global.font);
	draw_set_color(c_white);
	
	// When we set a point to draw text from, we will be setting the TOP-LEFT most point of that text
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	for(var _p = 0; _p < page_number; _p++) {
		
		// Determine the length (in characters) of the text to be displayed for each page
		text_length[_p] = string_length(text[_p]);	
	}
	
	option_number = array_length(option);
	for(var _p = 0; _p < option_number; _p++) {
		// Determine the width of the textbox that will host the dialogue options
		if string_width(option[_p]) > option_width {
			option_width = string_width(option[_p]);
		}
	}
	// Don't forget to give the text some breathing room!
	option_width += 2.0*option_border_x // + cursor_spacing + cursor_spr_w;
	
	// How high should the options textbox be?
	option_height = 2*option_border_y + line_sep*(array_length(option)-1) + string_height(option[array_length(option)-1]);
	
	if instance_number(obj_logger) > 0 {
		obj_logger.ind += 1;
		obj_logger.text[obj_logger.ind] = text[page];
		obj_logger.portrait[obj_logger.ind] = portrait[page];
	}
	
	show_debug_message("text: " + state.text_id);
}

draw_set_font(global.font);

// As silly as this looks, I need a way of preventing textbox code from working if we are not in the game state.
if state.active && instance_number(obj_transition) < 1 {
	for (var _i = 0; _i < array_length(methods[page]); _i++) {
		methods[page][_i]();	
	}
	// Typewriter effect
	// Don't draw text while a transition between scenes is occuring...
	if draw_char < text_length[page] && global.fade_time == 0 {
		draw_char += text_speed;
		draw_char = clamp(draw_char, 0, text_length[page]); 
		if (draw_char % 2) == 0 {
			audio_play_sound(snd_blip, 1, false,0.25*global.settings.volume*global.settings.volume_sfx);
		}
	}

	var _lay_id = layer_get_id("Background");
	var _back_id = layer_background_get_id(_lay_id);

	// Change the background (if needed)
	// The purpose of this weird flag setup is to avoid a weird visual glitch where sprites that are only intended to show after a fade transition has ended...
	// also show up for the very first frame of the fade transition before disappearing
	var _flag = true;
	if bg[page] != noone {
		if global.bg_new != bg[page] {
			_flag = false;
			global.bg_new = bg[page];
		}
	}

	// Change the music (if needed)
	if sound[page] != noone {
		obj_game.bg_music_new = sound[page];	
	}

	// CODE FOR DRAWING TEXT AND CHARACTER SPEAKING 
	if global.bg_current == global.bg_new {
		// General overview of procedure:
		// 1. DRAW THE PLAYER
		// 2. DRAW THE OPTIONS TEXTBOX (if necessary)
		// 3. DRAW THE NAMEPLATE
		// 4. DRAW THE REGULAR TEXTBOX
	
		// Values used for drawing the options textbox in the correct location
		var _xval = _textbox_x + textbox_x_offset + textbox_width - option_width;
		var _yval = _textbox_y + textbox_y_offset - option_height;
	
		// Values used for drawing the portrait in the correct location in the presence of dialogue options
		var _portrait_x_target = 0.4*(room_width - _xval);
		var	_portrait_y_target = 0;
	
		// Draw the character that is speaking
	
		if portrait[page] != noone {
			draw_sprite_ext(portrait[page], image[page], 0,0, 1.0, 1.0, 0, c_white, 1);	
		}
	
		// Options
		var _display_options = (page == page_number - 1) && (draw_char >= text_length[page]) && option_link_id[0] != noone;
		if _display_options {
			scr_draw_options(_xval, _yval, option);
		}
	
		// Draw the nameplate and the name of the person speaking, provided that such a person exists
		var _drawtext = ds_map_find_value(global.speaker, portrait[page]);
		if !is_undefined(_drawtext) {
			textbox_img += textbox_img_speed;
			textbox_spr_w = sprite_get_width(textbox_spr);
			textbox_spr_h = sprite_get_height(textbox_spr);
			draw_sprite_ext(textbox_spr, textbox_img, _textbox_x + nameplate_x_offset, _textbox_y + nameplate_y_offset, (string_width(_drawtext) + 2*text_border_x)/textbox_spr_w, nameplate_height/textbox_spr_h, 0, c_white, alpha);

			// Draw the name of the person speaking
			draw_text_ext(_textbox_x + nameplate_x_offset + text_border_x, _textbox_y + nameplate_y_offset + nameplate_border_y, _drawtext, line_sep, line_width);
		}
	
		// Draw the textbox
		draw_sprite_ext(textbox_spr, textbox_img, _textbox_x + textbox_x_offset, _textbox_y + textbox_y_offset, textbox_width/textbox_spr_w, textbox_height/textbox_spr_h, 0, c_white, alpha);

		// Draw the text on the textbox
		_drawtext = string_copy(text[page], 1, floor(draw_char));
		draw_set_color(global.main_font_color);
		draw_text_ext(_textbox_x + textbox_x_offset + text_border_x, _textbox_y +  textbox_y_offset + text_border_y, _drawtext, line_sep, line_width);
	
		// CODE FOR PAGE FLIPPING

		// If options dialogue is NOT present, advance the dialogue upon clicking.
		// If options dialogue is present, advance the dialogue provided that we click on an option.
		// For presentation's sake, do not allow the player to advance dialogue while the game is transitioning from background to background.
		if (force_go && draw_char >= text_length[page]) || ((accept_key && !_display_options) || (accept_key && _display_options && option_pos != noone)) && timer > 2 && global.fade_time == 0 {
			// Has all the text for the current page displayed yet?
			if draw_char < text_length[page] {
				// No. This skips the typing effect and writes out all the text immediately
				draw_char = text_length[page];
			}
			else {
				// Write out of the current page of text to the logger.
				if (page+1) < array_length(text) {
					obj_logger.ind += 1;
					obj_logger.text[obj_logger.ind] = text[page+1];
					obj_logger.portrait[obj_logger.ind] = portrait[page+1];
				}
				audio_play_sound(snd_click, 1, false, 0.25);
			
				// Yes! Is there still more pages of text to display?
				if page < page_number - 1 {
					// Yes, there is!
					page++;
					force_go = false;
					draw_char = 0;
				} else {
					instance_destroy();

				}
			}
		}

		if skip_key {
			// Log any of the test that was skipped over. This will be helpful if for whatever reason the player accidentally skips over the text.
			while (page + 1) < array_length(text) {
				obj_logger.ind += 1;
				obj_logger.text[obj_logger.ind] = text[page+1];
				obj_logger.portrait[obj_logger.ind] = portrait[page+1];	
				page++;
			}
			
			// Are there dialogue options the player needs to choose from?
			if option_link_id[0] == noone {
				// No, there aren't, we can end the textbox dialogue right away
				instance_destroy();
			} else {
				// Yes, there are!
				// Immediately display the last page of text
				page = page_number - 1;
				draw_char = text_length[page];
			
			}
		}
	
		// ACCEPT CURSOR DISPLAY
		// When text is finished displaying for a text prompt, I'll display spr_cursor so that the player knows.
		if draw_char >= text_length[page] and (obj_game.timer % 30 < 10) {
			draw_sprite_ext(spr_cursor, 0, _textbox_x + textbox_x_offset + textbox_width - 40, _textbox_y + textbox_y_offset + textbox_height - 40, 1, 1, 0, c_white, alpha);
		}
	}
	
	//for (var _i = 0; _i < array_length(methods[page]); _i++) {
	//	methods[page][_i]();	
	//}
}

state.page = page;
//draw_text(50, 250, timer);
//draw_text(50,300,draw_char);
//draw_text(50,200,invisible_offset);





