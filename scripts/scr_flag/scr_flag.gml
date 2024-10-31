// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_set_flag(_struct, _flag, _value){
	var _hash = variable_get_hash(_flag);
	struct_set_from_hash(_struct, _hash, _value);
}