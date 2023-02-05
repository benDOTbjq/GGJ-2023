image_angle = random(360);
image_blend = c_blue;
y = -sprite_width;
x = random_range(Game.borderLeft+sprite_width, Game.borderRight-sprite_width);
pathChoice = PATH_CHOICE.NONE;
step = function() {
	y += 1*(Object_Player.backgroundSpeed/20);
	if y >= RoomWidth instance_destroy(id);
	if Game.currentPath != PATH_CHOICE.NONE && pathChoice == PATH_CHOICE.NONE {
		pathChoice = x <= RoomWidthHalf ? PATH_CHOICE.LEFT : PATH_CHOICE.RIGHT;
	}
	
}

