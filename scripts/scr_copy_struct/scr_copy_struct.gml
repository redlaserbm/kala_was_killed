// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_copy_struct(_speaker, _receiver){
	// Copies the values from struct _speaker into struct _receiver
	var _keys = struct_get_names(_speaker);
	
	if !is_struct(_receiver) {
		_receiver = {};	
	}
	
	for (var _i = 0; _i < array_length(_keys); _i++) {
		if !is_struct(_speaker[$ _keys[_i]]) && !is_array(_speaker[$ _keys[_i]]) {
			_receiver[$ _keys[_i]] = _speaker[$ _keys[_i]];
		} else {
			_receiver[$ _keys[_i]] = variable_clone(_speaker[$ _keys[_i]]);	
		}
	}
}
