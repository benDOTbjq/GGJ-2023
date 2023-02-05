surfacenerveY += Object_Player.backgroundSpeed;
if(!surface_exists(surfaceNerve)) {
	surfaceNerve = surface_create(borderRight-borderLeft, RoomHeight);
}
surface_set_target(surfaceNerve);
draw_sprite_tiled(BG2, -1, 0, surfacenerveY)
surface_reset_target();

draw_surface_stretched(surfaceNerve, borderLeft, 0, borderRight-borderLeft, RoomHeight);
//draw_rectangle( 0, 0, borderLeft, RoomHeight, false);
//draw_rectangle(borderRight, 0, RoomWidth, RoomHeight, false);


draw_sprite_stretched_ext(Sprite_Pixel, 0, borderLeft, 0, CannalWidth, RoomHeight, c_red, gradient);
draw_sprite_stretched_ext(Sprite_Pixel, 0, borderLeft+CannalWidth, 0, CannalWidth, RoomHeight, c_blue, gradient);

layer_x(borderRightLayer, borderRight-16);
layer_x(borderLeftLayer, borderLeft-16);
layer_y(borderRightLayer, layer_get_y(borderRightLayer) + (Object_Player.backgroundSpeed/2) );
layer_y(borderMiddleLayer, layer_get_y(borderMiddleLayer) + (Object_Player.backgroundSpeed) );
layer_y(borderLeftLayer, layer_get_y(borderLeftLayer) + (Object_Player.backgroundSpeed/2) );
