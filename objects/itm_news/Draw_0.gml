/// @description Insert description here
// You can write your code in this editor
var _left_click = mouse_check_button_pressed(mb_left) && (instance_number(obj_menu) > 0 && obj_menu.hover_pos < 0);

if !scr_check_item("Newspaper") {
	draw_sprite(spr_shitty_news,0,0,0);
} else {
	sprite_index = noone;	
}

if active {
	depth = obj_itemizer.depth + 1;
	switch (state.context) {
		case "first_view":
			scr_textbox_create("temmie_news");
			break;
			
		case "second_view":
			// show_debug_message("GOT TO HERE");
			depth = obj_itemizer.depth - 1;
			draw_sprite(spr_news_page,0,0,0);
			if _left_click {
				scr_textbox_create("temmie_news_store");
				state.context = "inventory";
			}
			break;
			
		case "inventory":
			depth = obj_itemizer.depth - 1;
			draw_sprite(spr_news_page,0,0,0);
			if _left_click {
				scr_activate(obj_inventory);	
			}
			break;
		
	}
}