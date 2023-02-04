layerForgroundId = layer_get_id("Instances_Foreground");
layerFocusId = layer_get_id("Instances_Focus");
layerBackgroundId = layer_get_id("Instances_Background");

borderRightLayer = undefined // defined in room_Game creation code
borderLeftLayer = undefined
borderMiddleLayer = undefined



RoomHeightQuart = RoomHeightHalf/2;
RoomWidthQuart = RoomWidthHalf/2;

CannalWidth = 200;

borderLeft = RoomWidthHalf - CannalWidth;
borderRight = RoomWidthHalf + CannalWidth;



incrementCannalWidth = function(incrementSize) {
	CannalWidth += incrementSize;
	borderLeft = RoomWidthHalf - CannalWidth;
	borderRight = RoomWidthHalf + CannalWidth;
	Object_Player.x = clamp(Object_Player.x, borderLeft, borderRight);
}
particalSystem = part_system_create();
particalEmitter = part_emitter_create(particalSystem);
part_system_layer(particalSystem, layerBackgroundId);
particalExaust = part_type_create()
part_type_alpha2(particalExaust, 1, 0);
part_type_color_mix(particalExaust, c_orange, c_yellow);
part_type_shape(particalExaust, pt_shape_square);
part_type_speed(particalExaust, 2, 20, 1, 5);
part_type_direction(particalExaust, 0, 360, 0, 5);
part_type_size(particalExaust, 0.1, 1, -1, 0.5);
part_type_life(particalExaust, 20, 20);

sleep = function() {};

step = sleep;


gradient = 0;
triggerSplitEvent = function() {
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
splitStepLeft = function() {
	
}
splitStepRight = function() {
	
}


room_goto_next();
