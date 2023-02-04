var mouseWheelDirection = keyboard_check(vk_f1) - keyboard_check(vk_f2);

if(mouseWheelDirection != 0 ) {
	incrementCannalWidth(mouseWheelDirection);
	
}
