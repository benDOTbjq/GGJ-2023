radius = 1;
backgroundSpeed = 0;
exaustDirection = 90
y = room_height - 200;
yPhysical = y;
yCamera = 0;
playAreaTop = RoomHeightHalf;
playAreaLimitWidth = 64;

isSoundPlaying = false;

backgroundId = layer_get_id("Background");

yCameraTarget = RoomHeight - 200;

xMomentum = 0;

step = function() {
	
	
	
	horizontalInput = keyboard_check(vk_right) - keyboard_check(vk_left);
	verticalInput = keyboard_check(vk_down) - keyboard_check(vk_up);
	
	if(horizontalInput != 0) {
		xMomentum += horizontalInput*(1.5);
	}
	x += xMomentum
	x = clamp(x, Game.borderLeft, Game.borderRight);
	xMomentum -= xMomentum * 0.1
	
	
	yPhysical = y - yCamera;
	if(verticalInput != 0) {
		//				upperBound
		var influence = (abs(playAreaTop-yPhysical)/playAreaTop) * (verticalInput * 5)
		
		
		yPhysical += influence  
		yPhysical = min(yPhysical, RoomWidth)
		show_debug_message("y:{0}, i:{1}", yPhysical,  influence );
		
		backgroundSpeed = (1-(influence*verticalInput/4.6))*20;
		
		yPhysical = clamp(yPhysical, RoomHeightHalf, RoomHeight);
		layer_vspeed(backgroundId, backgroundSpeed);
	}
	
	//fix placement with camera
	yCamera += ((yCameraTarget - y) / yCameraTarget)*10;
	
	y = yPhysical + yCamera;
	
	
	//rotation
	image_angle = point_direction(x, y, mouse_x, mouse_y) - 90;
	
	
	
}