/// @description This object determines where to place items on screen so they can be clicked on and interacted with by the player.

linking_object = noone;
destroy_on_click = false;
setup = false;

room_setup = false;

// For each room, list the items that can be interacted with in that room
room_items = ds_map_create();
ds_map_add(room_items,rm_elevator, [itm_panel, itm_poster_laser, itm_poster_temmie, itm_poster_rito, itm_poster_nums]);

// For each item, list the coordinates that the mouse must reside on in order to click on and interact with the object
item_coords = ds_map_create();
ds_map_add(item_coords, itm_panel, [445,220,484,303]);
ds_map_add(item_coords, itm_poster_laser, [554,140,626,400]);
ds_map_add(item_coords, itm_poster_temmie, [84,148,134,365]);
ds_map_add(item_coords, itm_poster_rito, [5,123,82,400]);
ds_map_add(item_coords, itm_poster_nums, [506, 170, 550, 360]);

// For each item, identify the sprite to draw in the room representing that item. 
// Not all items need a sprite like this. Some items are *baked* into the background.
item_sprites = ds_map_create();
ds_map_add(item_sprites, itm_panel, noone);
ds_map_add(item_sprites, itm_poster_laser, noone);

active_items = []; // Array of items in the current room.
active_items_coords = []; // Array identifying where to click on to interact with said items in the current room. 
created_items = []; // This tracks the instances of the items that were actually created. 

// This is a struct which tracks the state values of all interactables which have ever been interacted with
state_variables = {};