for (i=0;i<_key_count;i++) {
	if(_keys[i]._check_collision()==true) {
		show_debug_message("fucked");
		_arrows[i].point(_keys[i].x,_keys[i].y,true);
		array_delete(_keys, i, 1);
		array_delete(_arrows, i, 1);
		_key_count-=1;
		i=100000;
	}
	else {
		_arrows[i].point(_keys[i].x,_keys[i].y,false);
	}
}
if (!global.setting) {
	view_visible[0] = true;
	view_visible[1] = true;
	view_visible[2] = false;
	camera_set_view_pos(view_camera[0],obj_player_a.x-camera_get_view_width(view_camera[0])/2,obj_player_a.y-camera_get_view_height(view_camera[0])/2);
	camera_set_view_pos(view_camera[1],obj_player_b.x-camera_get_view_width(view_camera[1])/2,obj_player_b.y-camera_get_view_height(view_camera[1])/2);
}
else {
	view_visible[0] = false;
	view_visible[1] = false;
	view_visible[2] = true;
}