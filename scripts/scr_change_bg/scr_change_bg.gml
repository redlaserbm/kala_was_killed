// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// @param _spr
function scr_change_bg(_spr){
	var _lay_id = layer_get_id("Background");
	var _back_id = layer_background_get_id(_lay_id);
	layer_background_sprite(_back_id, _spr);
}