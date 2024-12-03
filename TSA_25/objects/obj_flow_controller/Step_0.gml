if keyboard_check_pressed(vk_escape) {
	if (global.setting) {
		global.setting = false;
	}
	else {
		global.setting = true;
	}
}