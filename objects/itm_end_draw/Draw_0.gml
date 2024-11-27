/// @description Insert description here
// You can write your code in this editor
switch (obj_game.state.flags.ending) {
	case 0:
		draw_sprite(spr_end_news, 0,0,0);
		break; 
		
	case 1:
		draw_sprite(spr_end_kala, 0,0,0);
		break;
		
	case 2:
		break;
}