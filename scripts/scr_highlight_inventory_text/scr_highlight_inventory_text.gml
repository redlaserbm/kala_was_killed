// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_highlight_inventory_text(_i, _inv_x, _inv_y){
	// This function is intended to be used only within the context of obj_inventory
	// Given an index _i referring to an object in the player's inventory, determine the coordinates of a rectangle that will highlight the text in that inventory.
	
	var _j = _i div inv_items_x;
	var _k = _i mod inv_items_x;
		
	// Use j and k to determine the (x,y) coordinates where the text to be drawn.
		
	// First, how much vertical space do we have to draw the text?
	// How much horizonal space do we have to draw the text?
	var _inv_text_height = inv_height - 2*inv_border_y;
	var _inv_text_width = inv_width - 2*inv_border_x;
		
	// Compute the (x,y) coordinates to draw the text...
	var _inv_item_x = _inv_x + inv_offset_x + inv_border_x + _k*(_inv_text_width/inv_items_x);
	var _inv_item_y = _inv_y + inv_offset_y + inv_border_y + _j*(_inv_text_height/inv_items_y);
		
	// What text needs to get drawn anyways?
	var _drawtext = state.inventory[_i];
	
	return [_inv_item_x, _inv_item_y, _inv_item_x + string_width(_drawtext), _inv_item_y + string_height(_drawtext)];
}