image_angle = random(360);
image_xscale = random_range(0.5, 1.2);
image_yscale = image_xscale;
speed_independent = random_range(-1, 2);
image_blend = make_color_hsv(irandom_range(170, 190), irandom(255), 255);
image_angleIncrement = random_range(-1, 1);
fadeIncrement = 0;
y = -sprite_width;
x = random_range(Game.borderLeft+sprite_width, Game.borderRight-sprite_width);
pathChoice = PATH_CHOICE.NONE;
step = function() {
	image_angle += image_angleIncrement;
	y += speed_independent + (2*(Object_Player.backgroundSpeed/20));
	if y >= RoomWidth instance_destroy(id);
	if Game.currentPath != PATH_CHOICE.NONE && pathChoice == PATH_CHOICE.NONE {
		pathChoice = x <= RoomWidthHalf ? PATH_CHOICE.LEFT : PATH_CHOICE.RIGHT;
		fadeIncrement = Game.currentPath == pathChoice ? 0 : -0.05;
	}
	image_alpha += fadeIncrement;
	if image_alpha <= 0 instance_destroy(id);
	x = clamp(x, Game.borderLeft, Game.borderRight);
}

