//checks if buttons can be rendered or pressed
if (global.room == 0 or global.setting) {
	// variables for the text
	if point_in_rectangle(mouse_x,mouse_y,x,y,_dx,_dy) {
		// if true the text turns red
		draw_set_color(c_red);
		//code for checking button presses
		if mouse_check_button_pressed(mb_left) {
			if (global.room) == 0 {
				room_goto(1);
				global.room = 1;
				_text   = "Main Menu";
				_width  = string_width(_text);
				x = room_width/2-_width/2;
				_dx = x+_width;
				global.setting = false;
			}
			else {
				room_goto(0);
				global.room = 0;
				_text   = "Dog Shit";
				_width  = string_width(_text);
				x = 1366/2-_width/2;
				_dx = x+_width;
				global.setting = false;
			}
		}
	}
	else {
		// if false the text turns white
		draw_set_color(c_white);
	}
	draw_text(x, y, _text);
}