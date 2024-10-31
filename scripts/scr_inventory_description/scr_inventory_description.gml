// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_inventory_description(_text_id){
	var _return_text = noone;
	switch(_text_id) {
		case "Temmie's knife":
			_return_text = "Temmie's trusty knife. Cuts cleanly through her adversaries. Please don't stand in her way she will stab you with this."
			break;
			
		case "Chocolate cake":
			_return_text = "Mmm..Food! But also bound to give you diabetes. Seriously, have you checked how much sugar is in this thing?";
			break;
			
		case "Sliced cake":
			_return_text = "Mmm..Food! Still bound to give you diabetes, but it's easier to share with your friends now.";
	}
	return _return_text;
}