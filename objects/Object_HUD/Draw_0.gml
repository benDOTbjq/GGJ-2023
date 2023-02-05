if(mouse_check_button_pressed(mb_right)) {
	sheetToggle = !sheetToggle;
}
draw_sprite_stretched(Sprite_Sheet, sheetPage, sheetX, RoomHeightHalf- 200, sheetSize, sheetSize);

curveIndexer += sheetToggle ? 0.05 : -0.05;
curveIndexer = clamp(curveIndexer, 0, 1);
sheetX = (animcurve_channel_evaluate(acBezier, curveIndexer)*(sheetSize/2)) + (RoomWidth - sheetSize);
var mousewheelDirection = mouse_wheel_up() - mouse_wheel_down();
if(mousewheelDirection != 0 ) {
	sheetPage += mousewheelDirection + 3
	sheetPage %= 3;
}

draw_rectangle_color(130, 160, 180, 360, c_black, c_black, c_black, c_black, false);
draw_rectangle_color(130, 160, 180, 360-((min(0, -Object_Player.backgroundSpeed)/20)*300), c_red, c_red, c_red, c_red, false);

//var frame = 0;
//var sprite = 
draw_sprite(RedBar, 5, -50, 70)