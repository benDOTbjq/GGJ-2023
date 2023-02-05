if keyboard_check_pressed(vk_enter) {
	audio_play_sound(GGJ2023_emotecht_mainsong_loop_OGG,10,true);
	room_goto_next();
}
show_debug_message("ALIVE")