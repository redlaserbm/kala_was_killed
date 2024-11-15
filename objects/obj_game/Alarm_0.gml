var _item_to_activate = asset_get_index(state.active_item);

show_debug_message("obj_game activating " + state.active_item);

if instance_number(_item_to_activate) < 1 {
	instance_create_depth(0,0,obj_itemizer.depth-1, _item_to_activate);
}
scr_activate(_item_to_activate);