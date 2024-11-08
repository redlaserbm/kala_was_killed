/// @description Insert description here
// You can write your code in this editor

// Additional setup
if !setup {
	setup = true;
	
	draw_set_font(global.main_font);
	
	// When we set a point to draw text from, we will be setting the TOP-LEFT most point of that text
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}

var _inv_x = camera_get_view_x(view_camera[0]);
var _inv_y = camera_get_view_y(view_camera[0]);

var _click = mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x, mouse_y, 0, 0, 640, 480);

var _key_inv = false; // keyboard_check_pressed(global.key_inv);
if _key_inv {
	if active {
		active = false;	
	} else {
		scr_activate();	
	}
}

hover_pos = -1;
new_items_tracker = noone;

if active {
	// Draw the textbox that we will display all inventory items on.
	draw_sprite_ext(textbox_spr, textbox_img, _inv_x + inv_offset_x, _inv_y + inv_offset_y, inv_width/textbox_spr_w, inv_height/textbox_spr_h, 0, c_white, alpha);
	
	if click_pos != -1 {
		// If we have a clicked on an item (making it a candidate for combining). Let's highlight that item in a different color.
		var _coords = scr_highlight_inventory_text(click_pos, _inv_x, _inv_y);
		var _drawtext = state.inventory[click_pos];
		draw_sprite_stretched
			(
				spr_gold,
				0,
				_coords[0], 
				_coords[1],
				string_width(_drawtext), //width
				string_height(_drawtext) //height
			);
	}
	
	// Draw the text for all inventory entries
	for (var _i = 0; _i < array_length(state.inventory); _i++) {
		// Using index 0 notation, which row j and column k should we draw the item on?
		var _coords = scr_highlight_inventory_text(_i, _inv_x, _inv_y);
		
		var _inv_item_x = _coords[0];
		var _inv_item_y = _coords[1];
		
		// Draw the text on the textbox
		var _drawtext = state.inventory[_i];
		
		// Check if the mouse is hovering over the text at hand. If so, we will *highlight* that text.
		// We will also draw a 
		var _mx = mouse_x;
		var _my = mouse_y;
		
		if point_in_rectangle(_mx, _my, _coords[0], _coords[1], _coords[2], _coords[3]) {
			draw_sprite_stretched
				(
					spr_black,
					0,
					_inv_item_x, 
					_inv_item_y,
					string_width(_drawtext), //width
					string_height(_drawtext) //height
				);
			hover_pos = _i;
		}
		
		draw_set_color(make_color_rgb(255,255,255));
		draw_text_ext(_inv_item_x, _inv_item_y, _drawtext, 640, 640);
	}
	
	// This code concerns selecting items for combining.
	if _click {
		clicks += 1;
		if (click_pos == -1) {
			// We are not trying to combine items yet, we're just selecting the first candidate for combining.
			click_pos = hover_pos;
		} else {
			// We *are* trying to combine items now!
			if (hover_pos != click_pos) && (hover_pos != -1) {
				show_debug_message("GOT TO HERE! 1");
				var _item_1 = ds_map_find_value(global.item_index, state.inventory[hover_pos]);
				var _item_2 = ds_map_find_value(global.item_index, state.inventory[click_pos]);
				
				if (!is_undefined(_item_1)) && (!is_undefined(_item_2)) {
					var _new_items = global.item_combo[# min(_item_1, _item_2), max(_item_1, _item_2)];
					if typeof(_new_items) == "array" {
						scr_add_items(_new_items);
					}
				} else {
					click_pos = hover_pos;	
				}
			} else if hover_pos == -1 && (obj_menu.hover_pos == noone) {
				click_pos = -1;	
			} else if (hover_pos == click_pos) {
				if (click_timer < double_click_threshold) {
					scr_textbox_create(state.inventory[click_pos], scr_item_examination);
				} else {
					click_pos = -1;
				}
				// We have clicked on the same item as before. If we clicked fast enough, we have double-clicked!
				// In this case, let's examine the object in more detail.
			}
		}
	}
	
	// Draw the textbox that we will display item descriptions on.
	draw_sprite_ext(textbox_spr, textbox_img, _inv_x + textbox_x_offset, _inv_y + textbox_y_offset, textbox_width/textbox_spr_w, textbox_height/textbox_spr_h, 0, c_white, alpha);

	// If relevant, draw the text that gives the description of the item we are hovered over.
	if hover_pos != -1 {
		var _drawtext = scr_inventory_description(state.inventory[hover_pos]);
		draw_set_color(global.main_font_color);
		draw_text_ext(_inv_x + textbox_x_offset + text_border_x, _inv_y +  textbox_y_offset + text_border_y, _drawtext, line_sep, line_width);
	}
	
	if _click {
		click_timer = 0;	
	}
} else {
	// If the inventory is inactive, display the item that is currently equipped, if such an item exists.	
	
	// To avoid screen clutter
	var _cluttered = false;
	for (var _i = 0; _i < instance_number(obj_interactable); _i++) {
		var _item = instance_find(obj_interactable, _i);
		if _item.active {
			_cluttered = true;	
		}
	}
	
	// click_pos gives the index of the actively equipped item
	if (click_pos != -1) && !_cluttered {
		var _subimg = ds_map_find_value(global.item_equip, state.inventory[click_pos]);
		
		if !is_undefined(_subimg) {
			// Draw a background for the item to appear on
			var _x = eq_offset_x - eq_width;
			var _y = eq_offset_y - eq_height;
		
			draw_sprite_ext(textbox_spr, 0, eq_offset_x - eq_width, eq_offset_y - eq_height, eq_width/textbox_spr_w, eq_height/textbox_spr_h, 0, make_color_rgb(255,255,255), global.textbox.alpha);	
	
			// Draw the equipped item
			draw_sprite(spr_item_equipped, _subimg, _x + 6, _y + 6);
		}
	}
}

// draw_text(150, 0, click_pos);
// draw_text(200, 0, hover_pos);
// draw_text(250, 0, clicks);