/// @description Insert description here
// You can write your code in this editor

var _alpha = 0;
if timer < transition_time {
	_alpha = timer/transition_time;	
} else {
	_alpha = (2*transition_time - timer)/transition_time;	
}

draw_sprite_stretched_ext(spr_black, 0,0,0,640,480,c_white,_alpha);

if timer == transition_time {
	room_goto(target_room);
}

if timer >= 2*transition_time {
	instance_destroy();	
}

timer += 1;