//control variables
w = false;
a = false;
s = false;
d = false;

//speed variables
player_speed = 5;
player_horizontal_speed = player_speed*.707;

//gets the current control inputs
function check_contols() {
	if keyboard_check_pressed(ord("D")) {
		d = true;
	}
	if keyboard_check_pressed(ord("A")) {
		a = true;
	}
	if keyboard_check_pressed(ord("W")) {
		w = true;
	}
	if keyboard_check_pressed(ord("S")) {
		s = true;
	}
	if keyboard_check_released(ord("D")) {
		d = false;
	}
	if keyboard_check_released(ord("A")) {
		a = false;
	}
	if keyboard_check_released(ord("W")) {
		w = false;
	}
	if keyboard_check_released(ord("S")) {
		s = false;
	}
}

//updates the position based on inputs
function update_position() {
	//if the player is moving diagonal decrease the x and y speeds
	//this stops diagonal movement from being faster than normal movement
	
	if (d-a) != 0 and (s-w) != 0 {
		if 351<sqrt(sqr(obj_player_b.x-((d-a)*(player_horizontal_speed/2)+x))+sqr(obj_player_b.y-((s-w)*(player_horizontal_speed/2)+y))) {
			move_and_collide((d-a)*(player_horizontal_speed/2),(s-w)*(player_horizontal_speed/2),obj_player_b);
			obj_player_b.x = x + lengthdir_x(351, point_direction(x, y, obj_player_b.x, obj_player_b.y));
			obj_player_b.y = y + lengthdir_y(351, point_direction(x, y, obj_player_b.x, obj_player_b.y));
		}
		else {
			move_and_collide((d-a)*(player_horizontal_speed),(s-w)*(player_horizontal_speed),obj_player_b);	
		}
	}
	//this is just normal input if not mobing diagonally
	else {
		if 351<sqrt(sqr(obj_player_b.x-((d-a)*(player_speed/2)+x))+sqr(obj_player_b.y-((s-w)*(player_speed/2)+y))) {
			move_and_collide((d-a)*(player_speed/2),(s-w)*(player_speed/2),obj_player_b);
			obj_player_b.x = x + lengthdir_x(351, point_direction(x, y, obj_player_b.x, obj_player_b.y));
			obj_player_b.y = y + lengthdir_y(351, point_direction(x, y, obj_player_b.x, obj_player_b.y));
		}
		else {
			move_and_collide((d-a)*(player_speed),(s-w)*(player_speed),obj_player_b);	
		}
	}
	
	
}

//updates the player based on one frame
function update() {
	check_contols();
	update_position();
}