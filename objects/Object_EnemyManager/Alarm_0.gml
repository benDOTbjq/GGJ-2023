alarm_set(0, random(200)+50)
var r = random(1);
if(r < 0.8) {
	instance_create_layer(0, 0, "Instances_Focus", Object_Enemy);
}else {
	instance_create_layer(0, 0, "Instances_Focus", Object_EnemyHard);
}