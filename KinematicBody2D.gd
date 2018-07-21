extends KinematicBody2D
var MOVE = 0

func _physics_process(delta):
	
	position.x += 1
	
	if position.x > 1300:
		position.x = -330
	pass
