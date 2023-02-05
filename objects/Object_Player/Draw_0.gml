/// @description Insert description here
// You can write your code in this editor
if(verticalInput != 0) {
	exaustDirection = verticalInput == 1 ? 90 : -90
	part_type_gravity(Game.particalExaust, backgroundSpeed, exaustDirection);
	part_emitter_region(Game.particalSystem, Game.particalEmitter, x, x, y, y, ps_shape_rectangle, ps_distr_linear)
	part_emitter_burst(Game.particalSystem, Game.particalEmitter, Game.particalExaust, 10);
	if(!isSoundPlaying) {
		audio_play_sound(player_particle_emit, 10, true);
		isSoundPlaying = true;	
	}
}

else
{
	if(isSoundPlaying)
	{
		isSoundPlaying = false;	
		audio_stop_sound(player_particle_emit);
	}
	
	
}
if(bombAvailable)
{
	if(!isMaxSpeedPlaying)
	{
		audio_play_sound(max_speed,10,false,1.5);
		isMaxSpeedPlaying = true;
	}	
	
	draw_sprite_ext(sprite_index, -1, x, y, 0.8, 0.8, image_angle, c_blue, 1);
	
}	
	
//draw_rectangle(x-bombHitboxXRange,y,x+bombHitboxXRange,y-bombHitboxYRange, false)
draw_sprite_ext(sprite_index, -1, x, y, 0.5, 0.5, image_angle, c_white, 1);
layer_x(Game.borderRightLayer, Game.borderRight-16);
layer_x(Game.borderLeftLayer, Game.borderLeft-16);
layer_y(Game.borderRightLayer, layer_get_y(Game.borderRightLayer) + (backgroundSpeed/2) );
layer_y(Game.borderLeftLayer, layer_get_y(Game.borderLeftLayer) + (backgroundSpeed/2) );

