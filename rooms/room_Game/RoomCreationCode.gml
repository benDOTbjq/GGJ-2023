instance_create_layer(RoomWidthHalf, RoomHeightHalf, "Instances_Focus", Object_Player);
instance_create_layer(0, 0, "Instances_Foreground", Object_HUD);

Game.borderRightLayer = layer_get_id("Background_BorderRight");
Game.borderLeftLayer = layer_get_id("Background_BorderLeft");
Game.borderMiddleLayer = layer_get_id("Backgrounds_BorderMiddle");
layer_x(Game.borderMiddleLayer, -999);