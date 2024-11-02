// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @param _text_id
function scr_textbox_create(_text_id, _dictionary = scr_dialogue) {
	// Generates a textbox with text.
	// _text_id is the header that the text is labelled with.
	// _dictionary is the script that this function will search through to find that header.
	with( instance_create_depth(0,0,-16000, obj_textbox) ) {
		text_id = _text_id;
		_dictionary(_text_id);
	}
}