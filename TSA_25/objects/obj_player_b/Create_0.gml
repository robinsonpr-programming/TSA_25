//control variables
i = false;
j = false;
k = false;
l = false;

//speed variables
player_speed = 5;
player_horizontal_speed = player_speed*.707;

//gets the current control inputs
function check_contols() {
	if keyboard_check_pressed(ord("L")) {
		l = true;
	}
	if keyboard_check_pressed(ord("J")) {
		j = true;
	}
	if keyboard_check_pressed(ord("I")) {
		i = true;
	}
	if keyboard_check_pressed(ord("K")) {
		k = true;
	}
	if keyboard_check_released(ord("L")) {
		l = false;
	}
	if keyboard_check_released(ord("J")) {
		j = false;
	}
	if keyboard_check_released(ord("I")) {
		i = false;
	}
	if keyboard_check_released(ord("K")) {
		k = false;
	}
}

//updates the position based on inputs
function update_position() {
	//if the player is moving diagonal decrease the x and y speeds
	//this stops diagonal movement from being faster than normal movement
	if (l-j) != 0 and (k-i) != 0 {
		if 351>sqrt(sqr(obj_player_a.x-((l-j)*player_horizontal_speed+x))+sqr(obj_player_a.y-((k-i)*player_horizontal_speed+y))){
			move_and_collide((l-j)*player_horizontal_speed,(k-i)*player_horizontal_speed,obj_player_a)
		}
		else {
		x = obj_player_a.x + lengthdir_x(351, point_direction(obj_player_a.x, obj_player_a.y, x, y));
		y = obj_player_a.y + lengthdir_y(351, point_direction(obj_player_a.x, obj_player_a.y, x, y));
		}
	}
	//this is just normal input if not mobing diagonally
	else {
		if 351>sqrt(sqr(obj_player_a.x-((l-j)*player_speed+x))+sqr(obj_player_a.y-((k-i)*player_speed+y))){
			move_and_collide((l-j)*player_speed,(k-i)*player_speed,obj_player_a)
		}
		else {
		x = obj_player_a.x + lengthdir_x(352, point_direction(obj_player_a.x, obj_player_a.y, x, y));
		y = obj_player_a.y + lengthdir_y(352, point_direction(obj_player_a.x, obj_player_a.y, x, y));
		}
	}
}

//updates the player based on one frame
function update() {
	check_contols();
	update_position();
}