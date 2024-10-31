// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_slider (_x, _y, _speaker_struct, _speaker_variable) {
		// Method which creates a slider attached to the given variable embedded within a struct.
		var _slider_exists = false;
		if instance_number(obj_slider) > 0 {
			for (var _i = 0; _i < instance_number(obj_slider); _i++) {
				var _slider = instance_find(obj_slider, _i);
				if (_slider.speaker_struct == _speaker_struct) && (_slider.speaker_variable == _speaker_variable) {
					_slider_exists = true;	
				}
			}
		}
		if !_slider_exists {
			var _self_id = id;
			instance_create_depth(_x,_y, depth-1, obj_slider, {
					limit_x: [_x,_x + global.textbox.slider_width],
					speaker_struct: _speaker_struct, 
					speaker_variable: _speaker_variable,
					creator: id,
					creator_menu_pos: id.menu_pos // Hamfisted solution at this point in time...
					});	
		}
}