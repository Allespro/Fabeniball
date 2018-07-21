extends KinematicBody2D
var MOVE = 0

func _physics_process(delta):
	
	position.x -= 2
	
	if position.x < -400:
		position.x = 1300
	pass
