
y += Object_Player.backgroundSpeed

if(y >= RoomHeight+20) {
	y = 0; 
	image_alpha = 0;
	layer_x(Game.borderMiddleLayer, RoomWidthHalf-16);
	Game.step = (Object_Player.x <= RoomWidthHalf) ? Game.splitStepLeft : Game.splitStepRight;
	instance_destroy(id);
	
}