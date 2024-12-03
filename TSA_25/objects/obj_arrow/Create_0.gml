function point(_x,_y,_l) {
	if (!_l) {
		image_angle = point_direction(x, y, _x, _y)-90;
	}
	else {
		instance_destroy();
	}
}