draw_rectangle( 0, 0, borderLeft, RoomHeight, false);
draw_rectangle(borderRight, 0, RoomWidth, RoomHeight, false);

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
