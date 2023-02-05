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

var frame = 0;
var sprite = RedBar
show_debug_message(Game.happyness)
switch(round(Game.happyness*10)) {
	case 0:
		frame = 0;
		sprite = RedBar;
		break;
	case 1:
		frame = 1;
		sprite = RedBar;
		break;
	case 2:
		frame = 2;
		sprite = RedBar;
		break;
	case 3:
		frame = 3;
		sprite = RedBar;
		break;
	case 4:
		frame = 4;
		sprite = RedBar;
		break;
		
	case 5:
		frame = 5;
		sprite = GreenBar;
		break;
	case 6:
		frame = 4;
		sprite = GreenBar;
		break;
	case 7:
		frame = 3;
		sprite = GreenBar;
		break;
	case 8:
		frame = 2;
		sprite = GreenBar;
		break;
	case 9:
		frame = 1;
		sprite = GreenBar;
		break;
	default:
		frame = 0;
		sprite = GreenBar;
		break;
}
draw_sprite(sprite, frame, -50, 70)