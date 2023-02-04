var mouseWheelDirection = keyboard_check(vk_f1) - keyboard_check(vk_f2);

if(mouseWheelDirection != 0 ) {
	incrementCannalWidth(mouseWheelDirection);
	
}
if(keyboard_check_pressed(vk_space)) {
	triggerSplitEvent();
}
show_debug_message("spi:{0} mx{1}", splitPercentIndex, layer_get_x(borderMiddleLayer));
step();
