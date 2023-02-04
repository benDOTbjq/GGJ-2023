layerForgroundId = layer_get_id("Instances_Foreground");
layerFocusId = layer_get_id("Instances_Focus");
layerBackgroundId = layer_get_id("Instances_Background");

RoomHeightQuart = RoomHeightHalf/2;
RoomWidthQuart = RoomWidthHalf/2;

CannalWidth = 200;

borderLeft = RoomWidthHalf - CannalWidth;
borderRight = RoomWidthHalf + CannalWidth;

incrementCannalWidth = function(incrementSize) {
	CannalWidth += incrementSize;
	borderLeft = RoomWidthHalf - CannalWidth;
	borderRight = RoomWidthHalf + CannalWidth;
}

room_goto_next();
