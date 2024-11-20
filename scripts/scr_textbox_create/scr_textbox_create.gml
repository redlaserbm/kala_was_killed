// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @param _text_id
function scr_textbox_create(_text_id, _dictionary = global.dictionary) {
	// Generates a textbox with text.
	// _text_id is the header that the text is labelled with.
	// _dictionary is the script that this function will search through to find that header.
	var _textbox = noone;
	if instance_number(obj_textbox) < 1 {
		_textbox = instance_create_depth(0,0,-16000, obj_textbox);
	} else {
		_textbox = instance_create_depth(0,0,-16000, obj_textbox_1);
	}
	with( _textbox) {
		
		state.text_id = _text_id;
		state.dictionary = _dictionary;
		
		_dictionary(_text_id);
	}
}