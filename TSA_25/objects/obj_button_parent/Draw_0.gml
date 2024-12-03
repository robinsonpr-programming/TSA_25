//checks if buttons can be rendered or pressed
if (global.room == 0 or global.setting) {
	// variables for the text
	if point_in_rectangle(mouse_x,mouse_y,x,y,_dx,_dy) {
		// if true the text turns red
		draw_set_color(c_red);
		//code for checking button presses
		if mouse_check_button_pressed(mb_left) {
		
		}
	}
	else {
		// if false the text turns white
		draw_set_color(c_white);
	}
	draw_text(x, y, _text);
}