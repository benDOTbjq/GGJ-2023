/// @description Insert description here
// You can write your code in this editor

if(mouse_check_button_pressed(mb_left) && collision_point(mouse_x,mouse_y,Object_MusicButton,false,false))
{
	if(!isSoundPlaying)
	{
		audio_play_sound(GGJ2023_emotecht_mainsong_loop_OGG,10,true);			
		isSoundPlaying = true;	
	}

	else
	{
		audio_stop_sound(GGJ2023_emotecht_mainsong_loop_OGG);
		isSoundPlaying = false;
	}
}
