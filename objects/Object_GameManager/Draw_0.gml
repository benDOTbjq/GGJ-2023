

draw_rectangle( 0, 0, borderLeft, RoomHeight, false);
draw_rectangle(borderRight, 0, RoomWidth, RoomHeight, false);


draw_sprite_stretched_ext(Sprite_Pixel, 0, borderLeft, 0, CannalWidth, RoomHeight, c_red, gradient);
draw_sprite_stretched_ext(Sprite_Pixel, 0, borderLeft+CannalWidth, 0, CannalWidth, RoomHeight, c_blue, gradient);

layer_x(borderRightLayer, borderRight);
layer_x(borderLeftLayer, borderLeft-32);
layer_y(borderRightLayer, layer_get_y(borderRightLayer) + (Object_Player.backgroundSpeed/2) );
layer_y(borderMiddleLayer, layer_get_y(borderMiddleLayer) + (Object_Player.backgroundSpeed/2) );
layer_y(borderLeftLayer, layer_get_y(borderLeftLayer) + (Object_Player.backgroundSpeed/2) );
