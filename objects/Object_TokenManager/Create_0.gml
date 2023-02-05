/// @description Insert description here
// You can write your code in this editor
alarm_set(0, 300);

draw = Game.sleep;
step = Game.sleep;

tokenDropPercent = 0;
tokenDropIncrement = 0;
acBezier = animcurve_get_channel(bezier, "0-1");

drawActive = false

// good
cars = {
	sprite: token_cars,
	happyness: 0.1
}
daughter = {
	sprite: token_daughter,
	happyness: 0.2
}
dogs = {
	sprite: token_dogs,
	happyness: 0.1
}
politics = {
	sprite: token_politics,
	happyness: 0.2
}
swimming = {
	sprite: token_swimming,
	happyness: 0.1
}

// bad
cats = {
	sprite: token_cats,
	happyness: -0.1
}
crowdedplaces = {
	sprite: token_crowdedplaces,
	happyness: -0.1
}
mice = {
	sprite: token_mice,
	happyness: -0.1
}
mother = {
	sprite: token_mother,
	happyness: -0.1
}
son = {
	sprite: token_son,
	happyness: -0.2
}
wife = {
	sprite: token_wife,
	happyness: -0.2
}

choiceLeft = cats;
choiceRight = dogs;

choices = [cars, cats, crowdedplaces, daughter, dogs,
	mice, mother, politics, son, swimming, wife];
good = [cars, daughter, dogs, politics, swimming];
bad = [cats, crowdedplaces, mice, mother, son, wife];

postSplit = function(path) {
	tokenDropPercent = 0.95;
	tokenDropIncrement = -0.05;
	if path == PATH_CHOICE.LEFT {
		//if(choiceLeft.happyness<0 && Game.happyness<=0)
		//	Game.happyness = 0;
		//else if (choiceLeft.happyness>0 && Game.happyness>=1)
		//	Game.happyness = 1;
		//else
		Game.happyness += choiceLeft.happyness;
	}else {
		//if(ChoiceRight.happyness<0 && Game.happyness<=0)
		//	Game.happyness = 0;
		//else if (ChoiceRight.happyness>0 && Game.happyness>=1)
		//	Game.happyness = 1;
		//else
		Game.happyness += choiceRight.happyness;
	}
	alarm_set(0, 60*5);
	
}
