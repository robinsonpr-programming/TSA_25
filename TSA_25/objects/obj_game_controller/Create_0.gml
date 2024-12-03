_key_count = 3;
_keys = []
_arrows = []
//creates the keys for the objective
for (i=0;i<_key_count; i++) {
	_instance = instance_create_layer(random_range(0,room_width), random_range(0,room_height), "Instances", obj_key);
	array_push(_keys,_instance);
	_instance = instance_create_layer(obj_player_b.x, obj_player_b.y, "Instances_UI", obj_arrow);
	array_push(_arrows,_instance);
}