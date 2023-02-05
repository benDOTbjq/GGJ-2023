/// @description Insert description here
// You can write your code in this editor
alarm_set(1, 60*5)
choiceLeft = choices[irandom(array_length(choices)-1)];
if(choiceLeft.happyness < 0) {
	choiceRight = good[irandom(array_length(good)-1)];
}else {
	choiceRight = bad[irandom(array_length(bad)-1)];
}
drawActive = true;

