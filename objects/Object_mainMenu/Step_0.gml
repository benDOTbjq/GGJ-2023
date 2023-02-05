if keyboard_check_pressed(vk_enter) {
	audio_play_sound(GGJ2023_emotecht_mainsong_loop_OGG,10,true);
	instance_create_layer(0, 0, "Instances_Background", Object_GameManager);
}
show_debug_message("ALIVE")