radius = 1;
backgroundSpeed = 0;
y = room_height - 64;

backgroundId = layer_get_id("Background");

step = function() {
	horizontalInput = keyboard_check(vk_right) - keyboard_check(vk_left);
	verticalInput = keyboard_check(vk_down) - keyboard_check(vk_up);
	show_debug_message("b:{0}, v:{1}", backgroundSpeed, verticalInput);
	if(horizontalInput != 0) {
		x += horizontalInput * 5;
		x = clamp(x, Game.borderLeft, Game.borderRight);
	}
	if(verticalInput != 0) {
		backgroundSpeed -= verticalInput*0.1;
		backgroundSpeed = clamp(backgroundSpeed, -20, 20)
		layer_vspeed(backgroundId, backgroundSpeed);
	}
	//rotation
	image_angle = point_direction(x, y, mouse_x, mouse_y) - 90;
	
	
}