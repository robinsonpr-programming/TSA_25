alive = true
function _check_collision() {
	if (place_meeting(x,y,obj_player_b)) {
		alive = false
		return true;
	}
	else {
		return false;
	}
}