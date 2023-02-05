if(drawActive) {
	var RightX = ((Game.borderRight + RoomWidthHalf)/2)-50;
	var LeftX = ((Game.borderLeft + RoomWidthHalf)/2)-50;
	if tokenDropPercent < 1 {
		var ty = -100 + (animcurve_channel_evaluate(acBezier, tokenDropPercent)*120);
		draw_sprite_stretched(choiceLeft.sprite, 0, LeftX, ty, 100, 100);
		draw_sprite_stretched(choiceRight.sprite, 0, RightX, ty, 100, 100);
		tokenDropPercent += 0.05;
	}else {
		draw_sprite_stretched(choiceLeft.sprite, 0, LeftX, 20, 100, 100);
		draw_sprite_stretched(choiceRight.sprite, 0, RightX, 20, 100, 100);
	}
}