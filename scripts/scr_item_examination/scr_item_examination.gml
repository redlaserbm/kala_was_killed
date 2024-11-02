// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_item_examination(_text_id) {
	switch (_text_id) {
		case "Temmie's knife":
				scr_text(spr_laser, 1, "Y'know, you shouldn't run around with sharp objects like that...");
				scr_text(spr_temmie, 1, "Why not?");
				scr_text(spr_laser, 1, "I don't trust you with sharp objects.");
				scr_text(spr_temmie, 1, "I will stab you with this.");
				scr_text(spr_laser, 1, "This is why I don't trust you.");
				scr_open_inventory();
				break;
	}
}