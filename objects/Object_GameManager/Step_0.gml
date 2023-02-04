var mouseWheelDirection = keyboard_check(vk_f1) - keyboard_check(vk_f2);

if(mouseWheelDirection != 0 ) {
	incrementCannalWidth(mouseWheelDirection);
	
}
if(keyboard_check_pressed(vk_space)) {
	triggerSplitEvent();
}

step();
