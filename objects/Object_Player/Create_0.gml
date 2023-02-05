radius = 1;
backgroundSpeed = 0;
exaustDirection = 90
y = room_height - 200;
yPhysical = y;
yCamera = 0;
playAreaTop = RoomHeightHalf;
playAreaLimitWidth = 64;

bombHitboxXRange = 150;
bombHitboxYRange = 100;
enemyHitList = ds_list_create();

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
			// Play sfx
			var blastIndex = irandom_range(0,2);
			audio_play_sound(blastSounds[blastIndex], 10, false, 0.8);
			
			part_emitter_burst(Game.particalSystem, Game.particalEmitter, Game.particalBomb, 30);
			
			var totalEnemiesHit = collision_rectangle_list(x-bombHitboxXRange,y,x+bombHitboxXRange,y-bombHitboxYRange,Object_Enemy,true,false, enemyHitList, false);
			
			for(var i = 0; i<totalEnemiesHit; i++)
			{
				enemyHitList[| i].kill();	
			}
			ds_list_clear(enemyHitList);
			
			
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

