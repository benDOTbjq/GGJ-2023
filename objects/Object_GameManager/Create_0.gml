layerForgroundId = layer_get_id("Instances_Foreground");
layerFocusId = layer_get_id("Instances_Focus");
layerBackgroundId = layer_get_id("Instances_Background");

borderRightLayer = undefined // defined in room_Game creation code
borderLeftLayer = undefined
borderMiddleLayer = undefined

surfaceNerve = noone;
surfacenerveY = 0;
RoomHeightQuart = RoomHeightHalf/2;
RoomWidthQuart = RoomWidthHalf/2;

CannalWidth = 500;

borderLeft = RoomWidthHalf - CannalWidth;
borderRight = RoomWidthHalf + CannalWidth;



incrementCannalWidth = function(incrementSize) {
	CannalWidth += incrementSize;
	borderLeft = RoomWidthHalf - CannalWidth;
	borderRight = RoomWidthHalf + CannalWidth;
	Object_Player.x = clamp(Object_Player.x, borderLeft, borderRight);
}
alarm_set(10, 20);
particalSystem = part_system_create();
particalEmitter = part_emitter_create(particalSystem);
part_system_layer(particalSystem, layerBackgroundId);

particalExaust = part_type_create()
part_type_alpha2(particalExaust, 1, 0);
//part_type_color_mix(particalExaust, c_orange, c_yellow);
part_type_sprite(particalExaust, ExhaustSprite, true, true, true);
//part_type_shape(particalExaust, pt_shape_square);
part_type_speed(particalExaust, 2, 20, 1, 5);
part_type_direction(particalExaust, 0, 360, 0, 5);
part_type_size(particalExaust, 0.1, 1, -1, 0.5);
part_type_life(particalExaust, 20, 20);

particalBomb = part_type_create()
part_type_alpha2(particalBomb, 1, 0);
part_type_color_mix(particalBomb, c_orange, c_red);
part_type_shape(particalBomb, pt_shape_explosion);
part_type_speed(particalBomb, 2, 20, 1, 5);
part_type_direction(particalBomb, 45, 135, 0, 5);
part_type_size(particalBomb, 0.1, 1, -1, 0.5);
part_type_life(particalBomb, 20, 20);

sleep = function() {};

step = sleep;

alarm_set(10, 20)
gradient = 0;
triggerSplitEvent = function() {
	if currentPath == PATH_CHOICE.NONE
		step = splitStep;
}
splitStep = function() {
	if(gradient >= 0.2) {
		instance_create_layer(RoomWidthHalf, 0, "Instances_Focus", Object_BorderStart);
		step = sleep;
	}else {
		gradient += 0.001*(Object_Player.backgroundSpeed/20);
	}
}
enum PATH_CHOICE {
	NONE,
	LEFT,
	RIGHT
}
happyness = 0.5;
currentPath = PATH_CHOICE.NONE;
splitPercentIndex = 0
acBezier = animcurve_get_channel(bezier, "0-1");
splitStepLeft = function() {
	gradient -= 0.002*(Object_Player.backgroundSpeed/20);
	var middleX = layer_get_x(borderMiddleLayer);
	var rightX = borderRight-16;
	if(splitPercentIndex >= 1) {
		currentPath = PATH_CHOICE.NONE;
		layer_x(borderMiddleLayer, -999);
		step = sleep;
		splitPercentIndex = 0;
	}else {
		layer_x(borderMiddleLayer, ((middleX*(animcurve_channel_evaluate(acBezier, 1-splitPercentIndex)))+(rightX*animcurve_channel_evaluate(acBezier, splitPercentIndex))) );
		splitPercentIndex += 0.005*(Object_Player.backgroundSpeed/20);
	}
}
splitStepRight = function() {
	gradient -= 0.002*(Object_Player.backgroundSpeed/20);
	var middleX = layer_get_x(borderMiddleLayer);
	var leftX = borderLeft-16;
	if(splitPercentIndex >= 1) {
		currentPath = PATH_CHOICE.NONE;
		layer_x(borderMiddleLayer, -999);
		step = sleep;
		splitPercentIndex = 0;
	}else {
		layer_x(borderMiddleLayer, (middleX*(animcurve_channel_evaluate(acBezier, 1-splitPercentIndex)))+(leftX*animcurve_channel_evaluate(acBezier, splitPercentIndex)));
		splitPercentIndex += 0.005*(Object_Player.backgroundSpeed/20);
	}
}


room_goto_next();

gameOver = function() {
	
}