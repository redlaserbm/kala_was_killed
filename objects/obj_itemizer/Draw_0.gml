/// @description Insert description here
// You can write your code in this editor

// This code runs when:
// 1. We enter a room
// 2. We load a save file
if !room_setup {
	room_setup = true;
	
	// New room? Clean slate!
	active_items = [];
	for (var _i = 0; _i < array_length(created_items); _i++) {
		with (created_items[_i]) {
			instance_destroy();
		}
	}
	
	// What items are intended to be present in the room?
	active_items = ds_map_find_value(room_items, room);

	// TODO: For each item in the item list, determine whether or not that item *should* be in the room rn 
	// by checking against global flags.
	
	// For each item in the list, create that item!
	created_items = [];
	for (var _i = 0; _i < array_length(active_items); _i++) {
		created_items[_i] = instance_create_depth(0,0,0,active_items[_i]);	
	}
}

// For each item, identify a bounding box that, if clicked, leads to an interaction with the item.
// TODO: It would be nice if the bounding box was more complex than just a rectangle.


// For each item that exists in the room, check whether or not our mouse is hovering over that object
// If our mouse is hovering over the object, show the bounding box to the player
// We only allow the below code to run if there is not an active interactable

var _can_explore = true;
for (var _i = 0; _i < instance_number(obj_interactable); _i++) {
	var _interactable = instance_find(obj_interactable, _i);
	if _interactable.state.active {
		fudge_factor = 0;
		_can_explore = false;
		break;
	}
}
fudge_factor += 1;

var _old_ind = highlighted_ind;
if fudge_factor >= 3 {
	var _mx = mouse_x;
	var _my = mouse_y;
	var _left_click = mouse_check_button_pressed(mb_left);
	
	highlighted_ind = -1;
	for (var _i = 0; _i < array_length(active_items); _i++){
		if collision_point(_mx, _my, active_items[_i], true, true) && ((_old_ind == -1) || (_old_ind == _i)) {
			highlighted_ind = _i;
			// Draw a version of the sprite that is colored in in some way
		}
	}
	
	// TODO: Some items should NOT be highlighted when we put our mouse over them (like when interacting with Kala's computer)
	// We need to take note of this.
	if highlighted_ind >= 0 {
		draw_sprite_ext
		(
			object_get_sprite(active_items[highlighted_ind]),
			active_items[highlighted_ind].image_index,
			active_items[highlighted_ind].x, active_items[highlighted_ind].y,
			1, //width
			1, //height
			0,
			make_color_rgb(275,26,66),
			0.5
		);
		if _left_click {
			audio_play_sound(snd_click, 1, false, 0.25);
			with (active_items[highlighted_ind]) {
				scr_activate();	
			}
		}
	}
}

// Legacy code
//if point_in_rectangle(_mx,_my, active_items_coords[_i][0], active_items_coords[_i][1], active_items_coords[_i][2], active_items_coords[_i][3]) {
//	draw_sprite_ext
//	(
//		spr_black,
//		0,
//		active_items_coords[_i][0], 
//		 active_items_coords[_i][1],
//		( active_items_coords[_i][2] - active_items_coords[_i][0])/sprite_get_width(spr_black), //width
//		( active_items_coords[_i][3] - active_items_coords[_i][1])/sprite_get_height(spr_black),  //height
//		0,
//		make_color_rgb(0,0,0),
//		0.25
//	);
		
//	// Clicking on an object's bounding box will cause the associated object to become active!
//	if _left_click {
//		audio_play_sound(snd_click, 1, false, 0.25);
//		with (active_items[_i]) {
//			scr_activate();	
//		}
//	}
//}
