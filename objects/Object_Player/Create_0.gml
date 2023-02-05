radius = 1;
backgroundSpeed = 0;
exaustDirection = 90
y = room_height - 200;
yPhysical = y;
yCamera = 0;
playAreaTop = RoomHeightHalf;
playAreaLimitWidth = 64;


isSoundPlaying = false;
isMaxSpeedPlaying = false;

bombAvailable = false

backgroundId = layer_get_id("Background");

yCameraTarget = RoomHeight - 200;

xMomentum = 0;

blastSounds = [exhaust_blast_01, exhaust_blast_02, exhaust_blast_03];

step = function() {
	
	
	
	horizontalInput = keyboard_check(vk_right) - keyboard_check(vk_left);
	verticalInput = keyboard_check(vk_down) - keyboard_check(vk_up);
	
	if(horizontalInput != 0) {
		xMomentum += horizontalInput*(1.5);
	}
	x += xMomentum
	var x1 = Game.currentPath;
	var x2 = Game.borderRight;
	
	var minClamp = Game.currentPath == PATH_CHOICE.RIGHT ? layer_get_x(Game.borderMiddleLayer) : Game.borderLeft;
	var maxClamp = Game.currentPath == PATH_CHOICE.LEFT ? layer_get_x(Game.borderMiddleLayer) : Game.borderRight;
	x = clamp(x, minClamp, maxClamp);
	xMomentum -= xMomentum * 0.1
	
	
	yPhysical = y - yCamera;
	if(keyboard_check_pressed(ord("B")) && bombAvailable) {
			var blastIndex = irandom_range(0,2);
			audio_play_sound(blastSounds[blastIndex], 10, false);
			bombAvailable = false;
			yPhysical = yPhysical*1.5;
			var influence = (abs(playAreaTop-yPhysical)/playAreaTop) * (1 * 5)
			backgroundSpeed = (1-(influence*1/4.6))*20;
			layer_vspeed(backgroundId, backgroundSpeed/10);
		}
	if(verticalInput != 0) {
		
		var influence = (abs(playAreaTop-yPhysical)/playAreaTop) * (verticalInput * 5)
		if (abs(influence) < 0.01) {
			bombAvailable = true
			
		}else {
			bombAvailable = false
			isMaxSpeedPlaying = false;
		}
		
		yPhysical += influence  
		yPhysical = min(yPhysical, RoomWidth)
		show_debug_message("y:{0}, i:{1}", yPhysical,  influence );
		
		backgroundSpeed = (1-(influence*verticalInput/4.6))*20;
		
		yPhysical = clamp(yPhysical, RoomHeightHalf, RoomHeight);
		
		layer_vspeed(backgroundId, backgroundSpeed/10);
	}
	
	//fix placement with camera
	yCamera += ((yCameraTarget - y) / yCameraTarget)*10;
	
	y = yPhysical + yCamera;
	
	
	
	//rotation
	image_angle = point_direction(x, y, mouse_x, mouse_y) - 90;
	
	
	
}