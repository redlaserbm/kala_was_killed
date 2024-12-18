/// @description This object determines where to place items on screen so they can be clicked on and interacted with by the player.

room_setup = false;

// For each room, list the items that can be interacted with in that room
room_items = ds_map_create();
ds_map_add(room_items, rm_elevator, [itm_panel, itm_poster_laser, itm_poster_temmie, itm_poster_rito, itm_poster_nums]);
ds_map_add(room_items, rm_car_interior, [itm_kala_corpse, itm_brick, itm_boundary, itm_phone]);
ds_map_add(room_items, rm_road, [itm_leif, itm_tree, itm_car, itm_jakkop]);

// ds_map_add(room_items, rm_kala, [itm_comp, itm_journal, itm_news, itm_mechanism]);
ds_map_add(room_items, rm_kala, [itm_frame, itm_journal, itm_news, itm_comp]);
ds_map_add(room_items, rm_kala_frame, [itm_boundary_kala, itm_button_top, itm_button_middle, itm_button_bottom, itm_frame_state_draw]);
ds_map_add(room_items, rm_kala_comp, [itm_boundary_comp, itm_control, itm_discord]);
ds_map_add(room_items, rm_ending, [itm_end_draw]);

active_items = []; // Array of items in the current room.
created_items = []; // This tracks the instances of the items that were actually created. 

// Variable which tracks the index (in active_items) of the item being hovered over.
// Reads -1 if no such item exists
highlighted_ind = -1;

// This is a struct which tracks the state values of all interactables which have ever been interacted with
state_variables = {};

fudge_factor = 0;